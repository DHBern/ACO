<script>
	import { Accordion } from '@skeletonlabs/skeleton-svelte';
	import { goto } from '$app/navigation';
	let value = $state(['metadata']);

	let { data } = $props();
</script>

<Accordion
	{value}
	onValueChange={(e) => (value = e.value)}
	collapsible
	classes="containerSettings shadow-md mb-4"
>
	<Accordion.Item value="unitNav">
		{#snippet lead()}{/snippet}
		{#snippet control()}<span class="text-xl font-bold">Dokumentenstruktur</span>{/snippet}
		{#snippet panel()}
			<div class="containerDocUnits my-5 max-h-60 overflow-y-scroll">
				{#each data.docMetadata.slugs as slug, idx (slug)}
					<button
						type="button"
						onclick={() => {
							goto(`${slug}`).then(() => {
								const elUnit = document.querySelector(`[data-unit="${slug}"]`);
								if (elUnit) {
									elUnit.scrollIntoView({ behavior: 'smooth', block: 'start' });
								}
							});
						}}
						class="bg-surface-950-50 hover:bg-secondary-200 text-surface-50-950 mx-2 my-1 rounded-full px-4 py-1"
						>{data.docMetadata.labels[idx]}</button
					>
				{/each}
			</div>
		{/snippet}
	</Accordion.Item>
</Accordion>
