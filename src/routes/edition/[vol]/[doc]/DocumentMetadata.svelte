<script>
	import { Accordion } from '@skeletonlabs/skeleton-svelte';
	let value = $state(['metadata']);

	let { data } = $props();
</script>

<Accordion
	{value}
	onValueChange={(e) => (value = e.value)}
	collapsible
	classes="containerDocHead shadow-md mb-4"
>
	<Accordion.Item value="metadata">
		{#snippet lead()}{/snippet}
		{#snippet control()}<span class="text-xl font-bold">Zusätzliche Informationen</span>{/snippet}
		{#snippet panel()}
			<div class="col-span-4 col-start-1 pl-13">
				{@html data.docMetadata.meta}
			</div>
		{/snippet}
	</Accordion.Item>
</Accordion>
