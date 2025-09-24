<script>
	import { onMount } from 'svelte';

	const SOLR_BASE = 'http://SOLR_HOST:PORT/solr';
	const CORE = 'CORE';

	let q = '';
	let typeFilter = ''; // "CPal" or "CV"
	let start = 0;
	let rows = 10;
	let docs = [];
	let highlighting = {};
	let numFound = 0;
	let loading = false;

	async function search() {
		loading = true;
		const params = new URLSearchParams();
		params.set('q', q.trim() || '*:*');
		if (typeFilter) params.set('fq', `type:${typeFilter}`);
		params.set('start', String(start));
		params.set('rows', String(rows));
		params.set('fl', 'id,title,unit_slug,first_line,page,score,type,schwartzSlugNum');
		params.set('hl', 'true');
		params.set('hl.fl', 'body');
		params.set('wt', 'json');

		const url = `${SOLR_BASE}/${CORE}/select?${params.toString()}`;
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
		typeFilter = type;
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

	<form onsubmit={onSearchSubmit} class="search-form">
		<input bind:value={q} placeholder="Search text..." />
		<select bind:value={typeFilter}>
			<option value="">All types</option>
			<option value="CPal">CPal</option>
			<option value="CV">CV</option>
		</select>
		<button type="submit" disabled={loading}>Search</button>
	</form>

	{#if loading}
		<p>Loading…</p>
	{:else}
		<p>{numFound} results</p>

		<ul>
			{#each docs as doc}
				<li>
					<div><strong>{doc.title}</strong> — <em>{doc.unit_slug}</em></div>

					<div>
						{#if highlighting[doc.id] && highlighting[doc.id].body}
							{@html highlighting[doc.id].body.join(' ... ')}
						{:else}
							<p>{doc.first_line}</p>
						{/if}
					</div>

					<small
						>type: {doc.type ?? '-'} • page: {doc.page ?? '-'} • score: {Math.round(
							(doc.score ?? 0) * 100
						) / 100}</small
					>
				</li>
			{/each}
		</ul>

		<div class="pagination">
			<button onclick={prevPage} disabled={start === 0}>Previous</button>
			<button onclick={nextPage} disabled={start + rows >= numFound}>Next</button>
		</div>
	{/if}
</div>

<style>
	@reference "tailwindcss";
	h1 {
		@apply mb-2 text-3xl font-bold text-[var(--aco-orange)];
	}
	h2 {
		@apply text-xl font-bold;
	}
	h3 {
		@apply text-lg font-bold;
	}
</style>
