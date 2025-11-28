<script>
	import { onMount } from 'svelte';
	import { metaData } from '$lib/data/aco-metadata.json';

	let query = $state('Lehre*');
	let docFilter = $state('CPal22');
	let start = $state(0);
	let rows = 40;
	let docs = $state([]);
	let highlighting = $state({});
	let numFoundDocs = $state(0);
	let numFoundGroups = $state(0);
	let loading = $state(false);
	let checkedSearchText = $state(true);
	let checkedSearchNotes = $state(true);
	let searchInTitle = $state(true);

	let url = $state('');
	$inspect(url);

	const schwartzSlugs = metaData.map((m) => {
		return m.schwartzSlug;
	});

	async function search() {
		loading = true;
		const params = new URLSearchParams();
		// Trim input
		params.set('defType', 'edismax');
		params.set('q', query.trim() || '*:*');

		// Weights
		if (searchInTitle) {
			params.set('qf', 'title^1 aco_text_bare^1');
		} else {
			params.set('qf', 'aco_text_bare^1');
		}
		// params.set('pf', 'title^20');

		// Filters
		if (!checkedSearchText) {
			params.append('fq', '-type:aco-unit');
		}
		if (!checkedSearchNotes) {
			params.append('fq', '-type:aco-note');
		}
		if (docFilter) {
			params.append('fq', `schwartzSlug:${docFilter}`);
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
		params.append('hl.fl', 'title aco_text_bare');
		params.append('hl.snippets', '999999');
		params.append('hl.fragsize', '30');
		params.append('hl.mergeContiguous', 'true');
		params.append('hl.useFastVectorHighlighter', 'true');

		// Grouping
		params.append('group', 'true');
		params.append('group.field', 'schwartzSlug');
		params.append('group.limit', '999');
		params.append('group.sort', 'score desc');
		params.append('group.ngroups', 'true');

		// Return json instead of xml
		params.set('wt', 'json');

		url = `/api/solr?${params.toString()}`;

		try {
			const res = await fetch(url);
			if (!res.ok) throw new Error(`Solr error ${res.status}`);
			const json = await res.json();
			// docs = json.response.docs || []; // no-grouping
			console.log('JSON', json);
			docs = json.grouped.schwartzSlug.groups[0].doclist.docs.docs || [];
			highlighting = json.highlighting || {};
			numFoundGroups = json.grouped.schwartzSlug.matches || 0;
			numFoundDocs = json.highlighting.length || 0;
		} catch (err) {
			console.error(err);
			docs = [];
			highlighting = {};
			numFoundDocs = 0;
		} finally {
			loading = false;
		}
		console.log(docs);
	}

	function onSearchSubmit(e) {
		e.preventDefault();
		start = 0;
		search();
	}
	function setFilter(type) {
		docFilter = type;
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

	onMount(() => {
		search();
	});
</script>

<div class="mx-auto max-w-[1500px] py-14">
	<h1 class="h1">Suche</h1>

	<form onsubmit={onSearchSubmit} class="search-form flex gap-10">
		<input bind:value={query} placeholder="Search text..." />
		<select bind:value={docFilter}>
			<option value="">All documents</option>
			{#each schwartzSlugs as slug}
				<option value={slug}>{slug}</option>
			{/each}
		</select>
		<label>
			<input type="checkbox" bind:checked={checkedSearchNotes} /> Search in notes
		</label>
		<label>
			<input type="checkbox" bind:checked={checkedSearchText} /> Search in text
		</label>
		<label>
			<input type="checkbox" bind:checked={searchInTitle} /> Include title
		</label>
		<button class="preset-filled rounded-full px-4 py-2" type="submit" disabled={loading}
			>Suchen</button
		>
	</form>
	<div class="searchResults">
		{#if loading}
			<p>Bitte warten…</p>
		{:else}
			<p>{numFoundDocs} Treffer</p>
			<ul>
				{#each docs as doc}
					<li>
						<!-- Document -->
						<a
							href={`../edition/vol1/${doc.schwartzSlug}`}
							target="_blank"
							rel="noopener noreferrer"
						>
							<div
								class={[
									'm-2 border-5 border-black',
									doc.type === 'aco-unit' && 'border-primary-50',
									doc.type === 'aco-note' && 'border-secondary-50'
								]}
							>
								<!-- Header -->
								<div
									class={[
										'px-3 py-1 text-xl',
										doc.type === 'aco-unit' && 'bg-primary-50',
										doc.type === 'aco-note' && 'bg-secondary-50'
									]}
								>
									<strong>{doc.schwartzSlug}: {doc.title}</strong>
								</div>
								<!-- Results -->
								<div class="p-3">
									{#if highlighting[doc.id] && highlighting[doc.id].aco_text_bare}
										{#each highlighting[doc.id].aco_text_bare as hl, idx}
											<div class={['border-secondary-100 m-2 border-3 p-3']}>
												<!-- <p>{@html Object.keys(highlighting[doc.id])}</p> -->
												<!-- <p>{@html highlighting[doc.id].line}</p> -->
												<p>{@html hl}</p>
											</div>
										{/each}
									{:else}
										<p>
											{(doc.aco_text_bare || '').slice(0, 8) +
												((doc.aco_text_bare || '').length > 8 ? '\n…' : '')}
										</p>
									{/if}
									<!-- <p>
									{doc.aco_text_bare ? doc.aco_text_bare : ''}
								</p> -->
								</div>
							</div>
						</a>
					</li>
				{/each}
			</ul>

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
			</div>
		{/if}
	</div>
</div>

<style>
	@reference "tailwindcss";
	@reference "@skeletonlabs/skeleton";
	.searchResults :global(mark) {
		@apply bg-secondary-300;
	}
</style>
