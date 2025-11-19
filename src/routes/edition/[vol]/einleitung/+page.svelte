<script lang="ts">
	import { intro } from '$lib/data/get_alldata_testing.js';
	import { ArrowUpIcon } from '@lucide/svelte';
	import { onMount } from 'svelte';

	let maintext: string;

	// Sort footnotes by number
	const footnotes = Object.keys(intro.footnotes)
		.map((key) => {
			const parts = key.split('-');
			const num = parseInt(parts[1], 10);
			return { key, number: num, text: intro.footnotes[key] };
		})
		.sort((a, b) => a.number - b.number);

	// Add anchors to footnotes in maintext
	function linkifyFootnoteSupers(html) {
		const parser = new DOMParser();
		const doc = parser.parseFromString(html, 'text/html');

		doc.querySelectorAll('sup[id]').forEach((sup) => {
			// skip if already inside an anchor
			if (sup.closest('a')) return;

			const parts = String(sup.id).split('-');
			const n = parts[parts.length - 1];
			if (!n) return;

			const a = doc.createElement('a');
			a.href = '#footnote-' + n;
			a.setAttribute('aria-label', 'Jump to footnote ' + n);
			a.className = 'footnote-ref';

			sup.replaceWith(a);
			a.appendChild(sup);
		});

		return doc.body.innerHTML;
	}

	onMount(() => {
		maintext = linkifyFootnoteSupers(intro.text);
	});
</script>

<div class="mx-auto max-w-[1500px] py-24">
	<div class="maintext">{@html maintext}</div>

	<div class="footnotes mt-10 grid grid-cols-[100px_auto] gap-x-4">
		<h2 class="h2 col-span-2 col-start-1">Fussnoten</h2>
		{#each footnotes as footnote}
			<div id={`footnote-${footnote.number}`} class="col-span-1 col-start-1">
				<p class="text-right">
					<sup>{@html footnote.number}</sup>
					<a
						href={'#note-' + footnote.number}
						aria-label={'Back to note ' + footnote.number}
						class="back-link inline-block"
						title="Back to note"
					>
						<ArrowUpIcon size="24" />
					</a>
				</p>
			</div>
			<div class="col-span-1 col-start-2">
				{@html footnote.text}
			</div>
		{/each}
	</div>
</div>

<style>
	@reference "tailwindcss";
	@reference "@skeletonlabs/skeleton";

	.maintext :global(.footnote-ref) {
		@apply text-secondary-500;
	}
	.footnotes :global(a) {
		@apply text-secondary-500;
	}
</style>
