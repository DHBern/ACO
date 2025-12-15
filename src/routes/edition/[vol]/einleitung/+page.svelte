<script lang="ts">
	import { ArrowUpIcon } from '@lucide/svelte';

	let { data } = $props();
</script>

<div class="maintext">{@html data.intro.text}</div>

<div class="footnotes mt-10 grid grid-cols-[100px_auto] gap-x-4">
	<h2 class="h2 col-span-2 col-start-1">Fussnoten</h2>
	{#each data.intro.footnotes as footnote}
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
