<script lang="ts">
	import { ArrowUpIcon } from '@lucide/svelte';
	import { onMount } from 'svelte';

	let { data } = $props();
	let footnotes: object | undefined = $state();

	// Transform footnotes (sort by number and modify text)
	function transformFootnotes(object) {
		return Object.keys(object)
			.map((key) => {
				const parts = key.split('-');
				const num = parseInt(parts[1], 10);
				return { key, number: num, text: modifyAnchors(object[key]) };
			})
			.sort((a, b) => a.number - b.number);
	}

	// Transform footnotes such that contained cross-references open in new tab
	function modifyAnchors(html) {
		const parser = new DOMParser();
		const doc = parser.parseFromString(html, 'text/html');

		// Add attributes to all anchors
		doc.querySelectorAll('a').forEach((a) => {
			a.setAttribute('target', '_blank');
			a.setAttribute('rel', 'noopener noreferrer');
		});

		// Return serialized inner HTML of the body (keeps only the fragment)
		return doc.body.innerHTML;
	}

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
			a.href = '#note-' + n;
			a.setAttribute('aria-label', 'Jump to footnote ' + n);
			a.className = 'note-ref';

			sup.replaceWith(a);
			a.appendChild(sup);
		});

		return doc.body.innerHTML;
	}

	onMount(() => {
		footnotes = transformFootnotes(data.intro.footnotes);
	});
</script>

<div class="mx-auto max-w-[1500px] py-24">
	<div class="maintext">{@html data.intro.text}</div>

	<div class="footnotes mt-10 grid grid-cols-[100px_auto] gap-x-4">
		<h2 class="h2 col-span-2 col-start-1">Fussnoten</h2>
		{#each footnotes as footnote}
			<div id={`note-${footnote.number}`} class="col-span-1 col-start-1">
				<p class="text-right">
					<sup>{@html footnote.number}</sup>
					<a
						href={'#ref-' + footnote.number}
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

	.maintext :global(.note-ref) {
		@apply text-secondary-500;
	}
	.footnotes :global(a) {
		@apply text-secondary-500;
	}
</style>
