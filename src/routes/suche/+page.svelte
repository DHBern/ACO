<script>
	import { onMount } from 'svelte';
	import { metaData } from '$lib/data/aco-metadata.json';
	import { base } from '$app/paths';

	const baseURL = 'https://solr.dsl.unibe.ch/solr/aco-dev/select';
	let query = $state('Kyrill* AND Nestor*');
	let docFilterSchwartz = $state('');
	let docFilterDok = $state('');
	let start = $state(0);
	let rows = 999999;
	let groups = $state([]);
	let docs = $state([]);
	let highlighting = $state({});
	let numFoundDocs = $state(0);
	let numFoundGroups = $state(0);
	let numFoundHighlights = $state(0);
	let loading = $state(false);
	let checkedSearchText = $state(true);
	let checkedSearchNotes = $state(true);

	const types = ['CV', 'CPal', 'CVer', 'CU'];
	const schwartzSlugs = types.reduce((acc, type) => {
		const slugs = metaData
			.filter(({ type: t }) => t === type)
			.sort((a, b) => a.schwartzNum - b.schwartzNum)
			.map((item) => item.schwartzSlug);
		return acc.concat(slugs);
	}, []);

	const docNums = metaData
		.map((m) => {
			return m.acoDocNum;
		})
		.sort((a, b) => a - b);

	async function search() {
		if (!query) return;
		loading = true;
		const params = new URLSearchParams();
		// Trim input
		params.set('defType', 'edismax');
		params.set('q', query.trim() || '');
		// Weights
		params.set('qf', 'aco_text_bare^1');

		// Filters
		if (!checkedSearchText) {
			params.append('fq', '-aco_type:aco-unit');
		}
		if (!checkedSearchNotes) {
			params.append('fq', '-aco_type:aco-note');
		}
		if (docFilterSchwartz && docFilterSchwartz !== 'ignore') {
			params.append('fq', `aco_schwartzSlug:${docFilterSchwartz}`);
		}
		if (docFilterDok && docFilterDok !== 'ignore') {
			params.append('fq', `aco_numX:${docFilterDok}`);
		}

		// Cursor-based search range
		params.set('start', String(start));
		params.set('rows', String(rows));

		// Field List
		params.set('fl', '*,score');

		// Highlighting
		params.set('hl', 'true');
		params.set('hl.simple.pre', '<mark>');
		params.set('hl.simple.post', '</mark>');
		params.append('hl.fl', 'aco_text_bare');
		params.append('hl.snippets', '999999'); //! TOCHANGE
		params.append('hl.fragsize', '150'); //! TOCONSIDER
		params.append('hl.mergeContiguous', 'true');
		params.append('hl.useFastVectorHighlighter', 'true');

		// Grouping
		params.append('group', 'true');
		params.append('group.field', 'aco_schwartzSlug');
		params.append('group.limit', '999'); //! TOCHANGE
		params.append('group.sort', 'score desc');
		params.append('group.ngroups', 'true');

		// Return json instead of xml
		params.set('wt', 'json');

		const url = `${baseURL}?${params.toString()}`;

		try {
			const res = await fetch(url);
			if (!res.ok) throw new Error(`Solr error ${res.status}`);
			const json = await res.json();
			groups = json.grouped.aco_schwartzSlug.groups || [];
			docs = groups.flatMap((g) => g.doclist.docs);
			highlighting = json.highlighting || {};
			numFoundGroups = json.grouped.aco_schwartzSlug.matches || 0;
			numFoundDocs = groups.reduce((sum, g) => sum + (g.doclist?.numFound || 0), 0);
			numFoundHighlights = docs
				.flatMap((d) => Object.values(json.highlighting?.[d.id] ?? {}))
				.reduce((sum, arr) => sum + (Array.isArray(arr) ? arr.length : 0), 0);
		} catch (err) {
			console.error(err);
			docs = [];
			highlighting = {};
			numFoundDocs = 0;
		} finally {
			loading = false;
		}
	}

	function onSearchSubmit(e) {
		e.preventDefault();
		start = 0;
		search();
	}
	function nextPage() {
		start += rows;
		search();
	}
	function prevPage() {
		start = Math.max(0, start - rows);
		search();
	}

	function resetDocFilterSchwartz() {
		docFilterSchwartz = 'ignore';
	}
	function resetDocFilterDok() {
		docFilterDok = 'ignore';
	}

	onMount(() => {
		search();
	});
</script>

<h1 class="h1">Suche</h1>

<!-- Settings -->
<form
	onsubmit={onSearchSubmit}
	class="search-form bg-gray-100-900 mx-auto flex max-w-[1300px] flex-wrap items-start justify-start gap-10 p-5 py-8 shadow-md"
>
	<!-- buffer for large screens to force settings to center-->
	<div class="hidden flex-grow lg:block"></div>

	<div class="flex flex-col gap-3">
		<span class="label-text font-bold">Suchbegriff</span>
		<input class="input" bind:value={query} placeholder="Search text..." />
	</div>
	<div class="flex flex-col gap-3">
		<span class="label-text font-bold">Dokument auswählen</span>
		<div class="flex flex-wrap gap-3">
			<select class="select w-40" onchange={resetDocFilterDok} bind:value={docFilterSchwartz}>
				<option value="ignore"></option>
				<option value="">Alle Dokumente</option>
				{#each schwartzSlugs as slug}
					<option value={slug}>{slug}</option>
				{/each}
			</select>
			<select class="select w-40" onchange={resetDocFilterSchwartz} bind:value={docFilterDok}>
				<option value="ignore"></option>
				<option value="">Alle Dokumente</option>
				{#each docNums as num}
					<option value={num}>Dok. {num}</option>
				{/each}
			</select>
		</div>
	</div>

	<div class="flex flex-col gap-3">
		<span class="label-text font-bold">Suchen in</span>
		<div class="flex flex-wrap gap-3">
			<label class="flex items-center">
				<input class="checkbox" type="checkbox" bind:checked={checkedSearchText} />
				<span class="text-label pl-1">Text</span>
			</label>
			<label class="flex items-center">
				<input class="checkbox" type="checkbox" bind:checked={checkedSearchNotes} />
				<span class="text-label pl-1">Kommentar</span>
			</label>
		</div>
	</div>
	<button
		type="submit"
		class="btn-lg btn preset-filled-surface-900-100 self-center"
		disabled={loading}>Suchen</button
	>
	<div class="hidden flex-grow lg:block"></div>
</form>

<!-- Results -->
<div class="searchResults mx-auto max-w-[1300px]">
	{#if loading}
		<p>Bitte warten…</p>
	{:else}
		<p class="p-5 text-left">{numFoundHighlights} Treffer in {numFoundDocs} Dokumenten</p>
		<ul>
			{#each docs as doc}
				<li>
					<!-- Document -->
					<a
						href={`${base}/edition/vol1/${doc.aco_schwartzSlug}/${doc.aco_unit}${doc.aco_type === 'aco-note' ? `?line=${doc.aco_noteLineStart}` : ''}`}
						target="_blank"
						rel="noopener noreferrer"
					>
						<div
							class={[
								'm-2 border-5 border-black',
								doc.aco_type === 'aco-unit' && 'border-primary-500/30',
								doc.aco_type === 'aco-note' && 'border-secondary-500/30'
							]}
						>
							<!-- Header -->
							<div
								class={[
									'px-3 py-1 text-xl',
									doc.aco_type === 'aco-unit' && 'bg-primary-300/30',
									doc.aco_type === 'aco-note' && 'bg-secondary-300/30'
								]}
							>
								<strong>
									{doc.aco_type === 'aco-note' ? 'Kommentar in ' : ''}
									{doc.aco_schwartzSlug}{doc.aco_unit !== 'text' ? `/${doc.aco_unit}` : ''}:
									<span class="ml-1">{doc.aco_docTitle}</span>
								</strong>
							</div>
							<!-- Results -->
							<div class="p-3">
								{#if highlighting[doc.id] && highlighting[doc.id].aco_text_bare}
									{#each highlighting[doc.id].aco_text_bare as hl, idx}
										<div
											class={[
												'm-2 p-3',
												doc.aco_type === 'aco-unit' &&
													'bg-primary-500/8 border-primary-500/10 border-2',
												doc.aco_type === 'aco-note' &&
													'bg-secondary-500/8 border-secondary-500/10 border-2'
											]}
										>
											<p>{@html hl}</p>
										</div>
									{/each}
								{:else}
									<p>
										{(doc.aco_text_bare || '').slice(0, 8) +
											((doc.aco_text_bare || '').length > 8 ? '\n…' : '')}
									</p>
								{/if}
							</div>
						</div>
					</a>
				</li>
			{/each}
		</ul>
		<!-- 
		<div class="pagination flex justify-around">
			<div class="flex gap-5">
				<button
					class="btn preset-filled-primary-500 rounded-full px-4 py-2"
					onclick={prevPage}
					disabled={start === 0}>Zurück</button
				>
				<button
					class="btn preset-filled-primary-500 rounded-full px-4 py-2"
					onclick={nextPage}
					disabled={start + rows >= numFoundDocs}>Weiter</button
				>
			</div>
		</div> -->
	{/if}
</div>

<style>
	@reference "tailwindcss";
	@reference "@skeletonlabs/skeleton";
	.searchResults :global(mark) {
		@apply bg-secondary-300;
	}
</style>
