<script>
	import { onMount } from 'svelte';
	import { metaData } from '$lib/data/aco-metadata.json';

	let query = $state('Lehre*');
	let docFilter = $state('CPal22');
	let start = $state(0);
	let rows = 40;
	let docs = $state([]);
	let highlighting = $state({});
	let numFound = $state(0);
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
		params.set('hl.snippets', '999999');
		// params.set('hl.fl', 'title');

		// Return json instead of xml
		params.set('wt', 'json');

		url = `/api/solr?${params.toString()}`;

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
			>Search</button
		>
	</form>

	{#if loading}
		<p>Loading…</p>
	{:else}
		<p>{numFound} Treffer</p>
		<ul>
			{#each docs as doc}
				<li>
					<div
						class={[
							'm-2 border-2 border-5 border-black',
							doc.type === 'aco-unit' && 'border-primary-50',
							doc.type === 'aco-note' && 'border-secondary-50'
						]}
					>
						<div
							class={[
								'px-3 py-1 text-xl',
								doc.type === 'aco-unit' && 'bg-primary-50',
								doc.type === 'aco-note' && 'bg-secondary-50'
							]}
						>
							<strong>{doc.schwartzSlug}: {doc.title}</strong>
						</div>
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
				</li>
			{/each}
		</ul>

		<div class="pagination">
			<button onclick={prevPage} disabled={start === 0}>Zurück</button>
			<button onclick={nextPage} disabled={start + rows >= numFound}>Weiter</button>
		</div>
	{/if}
</div>
