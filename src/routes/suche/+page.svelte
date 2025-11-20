<script>
	import { onMount } from 'svelte';
	import { metaData } from '$lib/data/aco-metadata.json';

	let q = $state('*');
	let docFilter = $state('');
	let start = $state(0);
	let rows = 40;
	let docs = $state([]);
	let highlighting = $state({});
	let numFound = $state(0);
	let loading = $state(false);
	let isChecked = $state(true);

	const schwartzSlugs = metaData.map((m) => {
		return m.schwartzSlug;
	});

	async function search() {
		loading = true;
		const params = new URLSearchParams();
		// Trim input
		// params.set('q', q.trim() || '*:*');
		params.set('q', q.trim() || ':');

		// Weights
		// params.set('qf', 'title^5 docText^1 author^2');
		// params.set('pf', 'title^20');

		// Filters
		if (docFilter) {
			params.append('fq', `schwartzSlug:${docFilter}`);
		}

		// Cursor-based search range
		params.set('start', String(start));
		params.set('rows', String(rows));

		// Field List
		// params.set('fl', 'id,type,author,title,entry,score');
		params.set('fl', 'id,type,title,entry,score');
		// params.set('fl', '*,score');

		// https://hallernet-search.hidora.com/solr/public/select?q=*&start=0&rows=100&fq=author:[*%20TO%20*]&fl=title%2Cid%2Ctype%2Centry%2Cauthor%2Cscore&hl=true&wt=json

		// Highlighting
		params.set('hl', 'true');
		// params.set('hl.fl', 'title');

		// Return json instead of xml
		params.set('wt', 'json');

		// loading = true;
		// const params = new URLSearchParams();
		// params.set('q', q.trim() || '*:*');
		// if (docFilter) params.set('fq', `schwartzSlug:${docFilter}`);

		const url = `/api/solr?${params.toString()}`;
		try {
			const res = await fetch(url);
			if (!res.ok) throw new Error(`Solr error ${res.status}`);
			const json = await res.json();
			docs = json.response.docs || [];
			highlighting = json.highlighting || {};
			numFound = json.response.numFound || 0;
		} catch (err) {
			console.error(err);
			docs = [];
			highlighting = {};
			numFound = 0;
		} finally {
			loading = false;
		}
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

<div class="py-14">
	<h1>Suche</h1>

	<form onsubmit={onSearchSubmit} class="search-form flex gap-10">
		<input bind:value={q} placeholder="Search text..." />
		<label>
			<input type="checkbox" bind:checked={isChecked} /> Random Checkbox
		</label>
		<select bind:value={docFilter}>
			<option value="">All documents</option>
			{#each schwartzSlugs as slug}
				<option value={slug}>{slug}</option>
			{/each}
		</select>
		<button class="preset-filled rounded-full px-4 py-2" type="submit" disabled={loading}
			>Search</button
		>
	</form>

	{#if loading}
		<p>Loading…</p>
	{:else}
		<p>{numFound} results</p>

		<ul>
			{#each docs as doc}
				<li>
					<div class="m-2 border-2 border-black p-3">
						<div><strong>{doc.title}</strong> — <em>{doc.unit_slug}</em></div>
						<div>
							{#if highlighting[doc.id] && highlighting[doc.id].body}
								{@html highlighting[doc.id].body.join(' ... ')}
							{:else}
								<p>{doc.first_line}</p>
							{/if}
						</div>
						<small
							>id: {doc.id ?? '-'} • type: {doc.type ?? '-'} • author: {doc.author
								? doc.author[0]
								: '-'} • score:
							{Math.round((doc.score ?? 0) * 100) / 100}</small
						>
						<!-- <p>{doc.docText ? doc.docText : 'no text'}</p> -->
						<p>{doc.title ? doc.title[0] : 'no title'}</p>
					</div>
				</li>
			{/each}
		</ul>

		<div class="pagination">
			<button onclick={prevPage} disabled={start === 0}>Previous</button>
			<button onclick={nextPage} disabled={start + rows >= numFound}>Next</button>
		</div>
	{/if}
</div>
