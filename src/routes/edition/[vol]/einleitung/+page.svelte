<script lang="ts">
	import { intro } from '$lib/data/get_alldata_testing.js';

	import { onMount } from 'svelte';

	let maintext = '';
	let footnotes: { id: string; html: string; n: number }[];

	onMount(() => {
		const htmlString = intro || '';
		// Parse into a DOM document
		const parser = new DOMParser();
		const doc = parser.parseFromString(htmlString, 'text/html');

		// Find aside elements under article in document order
		const asides = Array.from(doc.querySelectorAll('article aside'));

		footnotes = asides.map((aside, idx) => {
			const n = idx + 1;
			const id = aside.id || `footnote-${n}`;
			// Capture the aside inner HTML as the footnote content
			const html = aside.innerHTML.trim();
			return { id, html, n };
		});

		// Replace each aside with <sup>N</sup>
		asides.forEach((aside, idx) => {
			const sup = doc.createElement('sup');
			sup.textContent = String(idx + 1);
			// aside.parentNode.insertBefore(sup, aside);
			aside.remove();
		});

		const articleEl = doc.querySelector('article');
		maintext = articleEl ? articleEl.outerHTML : doc.body.innerHTML;
	});
</script>

<div class="mx-auto max-w-[1500px] py-24">
	{@html maintext}

	{#each footnotes as footnote}
		<sup>{@html footnote.n}</sup>{@html footnote.html}
	{/each}
</div>
