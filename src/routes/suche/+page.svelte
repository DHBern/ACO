<script>
	import { onMount } from 'svelte';
	import { base } from '$app/paths';
	import { InfoIcon } from '@lucide/svelte';

	const baseURL = 'https://solr.dsl.unibe.ch/solr/aco-dev/select';
	let query = $state('');
	let docFilterSchwartz = $state('ignore');
	let docFilterDok = $state('ignore');
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
	
	let { data } = $props();
	
	let isInfoVisible = $state(false);
	
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
 <div class="bg-gray-100-900 mx-auto flex flex-col gap-10 max-w-[1300px] p-5 py-8 shadow-md">
	<form
	class="flex flex-wrap items-start justify-start gap-10"
		onsubmit={onSearchSubmit}
	>
		<!-- buffer for large screens to force settings to center-->
		<div class="hidden flex-grow lg:block"></div>

		<div class="flex flex-col gap-3">
			<span class="label-text font-bold">Suchbegriff</span>
			<input class="input" bind:value={query} placeholder="Suchbegriffe eingeben..." />
		</div>
		<div class="flex flex-col gap-3">
			<span class="label-text font-bold">Dokument auswählen (Schwartz oder ACO)</span>
			<div class="flex flex-wrap gap-3">
				<select class="select w-40" onchange={resetDocFilterDok} bind:value={docFilterSchwartz}>
					<option value="ignore"></option>
					<option value="">Alle Dokumente</option>
					{#each data.schwartzSlugs as slug}
						<option value={slug}>{slug}</option>
					{/each}
				</select>
				<select class="select w-40" onchange={resetDocFilterSchwartz} bind:value={docFilterDok}>
					<option value="ignore"></option>
					<option value="">Alle Dokumente</option>
					{#each data.docNums as num}
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
					<span class="text-label pl-1">Anmerkung</span>
				</label>
			</div>
		</div>
		<button
			type="submit"
			class="btn-lg btn preset-filled-surface-900-100 self-center"
			disabled={loading}>Suchen</button
		>
		<button onclick={()=>{isInfoVisible = !isInfoVisible}} class="m-0 p-0 self-center">
			<InfoIcon color="grey" class="ml-1 inline-block"></InfoIcon>
		</button>
		<div class="hidden flex-grow lg:block"></div>
	</form>
	<!-- Info-Box -->
	<div class={[!isInfoVisible && "hidden","mx-20 mt-5 mb-10"]}>
		<h3 class="h4">Kurze Anleitung für die Suche</h3>
		<h4 class="h5 mt-7">Suchbegriffe eingeben</h4>
		<p class="text-base!">In der Suchfunktion können Sie verschiedene Suchbegriffe verwenden, um Ihre Ergebnisse zu verfeinern. Hier sind einige grundlegende Suchfunktionen:</p>
		<ul class="list-disc ml-10">
			<li class="text-base! mt-2"><strong>Anführungszeichen ("")</strong>: Verwenden Sie Anführungszeichen, um nach einer exakten Phrase zu suchen. Zum Beispiel: <code class="bg-secondary-500/20 font-bold">"Kyrill grüßt"</code> sucht nach der exakten Wortfolge "Kyrill grüßt".</li>
			<li class="text-base! mt-2"><strong>Sternchen (*)</strong>: Das Sternchen kann als Platzhalter für ein oder mehrere Wörter verwendet werden. Zum Beispiel: <code class="bg-secondary-500/20 font-bold">*gebärerin</code> sucht nach allen Wörtern, die auf "gebärerin" enden, wie "Christusgebärerin", "Gottesgebärerin" oder "Menschengebärerin".</li>
			<li class="text-base! mt-2"><strong>AND</strong>: Verwenden Sie das Wort "AND", um nach Dokumenten zu suchen, die beide Begriffe enthalten. Zum Beispiel: <code class="bg-secondary-500/20 font-bold">Nestorius AND Kyrill</code> sucht nach Dokumenten, die sowohl "Nestorius" als auch "Kyrill" enthalten.</li>
			<li class="text-base! mt-2"><strong>OR</strong>: Verwenden Sie das Wort "OR", um nach Dokumenten zu suchen, die mindestens einen der Begriffe enthalten. Zum Beispiel: <code class="bg-secondary-500/20 font-bold">Nestorius OR Kyrill</code> sucht nach Dokumenten, die entweder "Nestorius" oder "Kyrill" enthalten.</li>
		</ul>

		<h4 class="h5 mt-15">Erweiterte Suchmuster</h4>

		<p class="text-base!">Mit erweiterten Suchmustern können Sie Ihre Suchanfragen noch präziser gestalten. Ein Beispiel für ein solches Suchmuster ist:</p>
		<p class="text-base!"><code class="bg-secondary-500/20 font-bold">(Kyrill OR Nestorius) AND lehr*</code></p>
		<p class="text-base!">Dieses Suchmuster funktioniert wie folgt:</p>
		<ul class="list-disc ml-10">
			<li class="text-base! mt-2"><strong>Kyrill OR Nestorius</strong>: Zuerst sucht die Funktion nach Dokumenten, die entweder den Begriff "Kyrill" oder den Begriff "Nestorius" enthalten. Dies bedeutet, dass alle Dokumente, die mindestens einen dieser beiden Namen enthalten, in die Ergebnisliste aufgenommen werden.</li>
			<li class="text-base! mt-2"><strong>AND lehr*</strong>: Anschließend wird die Ergebnisliste weiter eingegrenzt, indem nur die Dokumente berücksichtigt werden, die zusätzlich Begriffe enthalten, die mit "lehr" beginnen. Das Sternchen (*) dient als Platzhalter für ein oder mehrere Wörter. Das bedeutet, dass Begriffe wie "Lehrer", "Lehre" oder "lehrst" in den Dokumenten enthalten sein müssen.</li>
		</ul>
		<p class="text-base!">Zusammengefasst zeigt dieses Suchmuster alle Dokumente, die entweder "Kyrill" oder "Nestorius" und zusätzlich Begriffe wie "Lehrer", "Lehre" oder "lehrst" enthalten.</p>

		<h4 class="h5 mt-15">Nach Dokumenten filtern</h4>
		<p class="text-base!">Standardmäßig wird in allen Dokumenten gesucht. Mit den beiden Dropdown-Menüs können Sie die Suche jedoch auch auf ein bestimmtes Dokument einschränken. Verwenden Sie das Dropdown-Menü links für die Dokumentenamen nach Schwartz (z.B. CV5) oder das Dropdown-Menü rechts für ACO-Dokumentenummern (z.B. Dok. 24).</p>
		<h4 class="h5 mt-15">Suchen im Haupttext und in den Anmerkungen</h4>
		<p class="text-base!">Mit den zwei Checkboxen <code class="font-bold">Text</code> und <code class="font-bold">Anmerkungen</code> können Sie die Suche auf den Haupttext und/oder die darin enthaltenen Anmerkungen eingrenzen. Die Suchresultate in blauen Kästchen entstammen dem  und solche in orangenen Kästchen den Anmerkungen.</p>
	</div>
</div>

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
						href={`${base}/dokumente/vol1/${doc.aco_schwartzSlug}/${doc.aco_unit}${doc.aco_type === 'aco-note' ? `?line=${doc.aco_noteLineStart}` : ''}`}
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
									'px-3 py-1 text-base!',
									doc.aco_type === 'aco-unit' && 'bg-primary-300/30',
									doc.aco_type === 'aco-note' && 'bg-secondary-300/30'
								]}
							>
								<strong>
									{doc.aco_type === 'aco-note' ? 'Anmerkung in ' : ''}
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
	{/if}
</div>

<style>
	@reference "tailwindcss";
	@reference "@skeletonlabs/skeleton";
	.searchResults :global(mark) {
		@apply bg-secondary-300;
	}
</style>
