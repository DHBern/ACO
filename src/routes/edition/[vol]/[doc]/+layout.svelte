<script>
	import { Switch } from '@skeletonlabs/skeleton-svelte';
	import { Accordion } from '@skeletonlabs/skeleton-svelte';
	import { copyWithoutLinebreaks, marksVisible } from '../../globals.svelte.js';
	import { goto } from '$app/navigation';
	import { base } from '$app/paths';

	let { data, children } = $props();
	let accordionUnitNav = $state(['unitNav']);
	let accordionMetadata = $state(['metadata']);
</script>

<div class="mx-auto max-w-[1500px] py-24">
	<!-- Title -->
	<h1 class="mb-2 text-4xl text-[var(--aco-orange)]">{@html data.docMetadata.toc_title}</h1>
	<!-- Document Metadata -->
	<Accordion
		{accordionMetadata}
		onValueChange={(e) => (accordionMetadata = e.value)}
		collapsible
		classes="containerDocHead shadow-md mb-4"
	>
		<Accordion.Item value="metadata">
			{#snippet lead()}{/snippet}
			{#snippet control()}<span class="text-xl font-bold">Metadaten</span>{/snippet}
			{#snippet panel()}
				<div class="col-span-4 col-start-1 p-5">
					{@html data.docMetadata.meta}
				</div>
			{/snippet}
		</Accordion.Item>
	</Accordion>

	<!-- Unit-Navigation -->
	<Accordion
		{accordionUnitNav}
		onValueChange={(e) => (accordionUnitNav = e.value)}
		collapsible
		classes="containerSettings shadow-md"
	>
		<Accordion.Item value="unitNav">
			{#snippet lead()}{/snippet}
			{#snippet control()}<span class="text-xl font-bold">Kapitelübersicht</span>{/snippet}
			{#snippet panel()}
				<div class="containerDocUnits my-5 max-h-60 overflow-y-scroll">
					{#each data.docMetadata.slugs as slug, idx (slug)}
						<button
							type="button"
							onclick={() => {
								goto(`${slug}`);
							}}
							class="mx-2 my-1 rounded-full bg-black px-4 py-1 text-white"
							>{data.docMetadata.labels[idx]}</button
						>
					{/each}
				</div>
			{/snippet}
		</Accordion.Item>
	</Accordion>

	<!-- Settings -->
	<div class="my-5 flex justify-center gap-5 align-middle">
		<Switch
			name="toggleMarksVisible"
			classes="**:text-lx"
			checked={marksVisible.value}
			onCheckedChange={(e) => (marksVisible.value = e.checked)}
			controlActive="bg-surface-700"
			controlInactive="bg-surface-200"
		>
			Markierungen
		</Switch>
		<Switch
			name="toggleCopyWithoutLinebreaks"
			classes="**:text-lx"
			checked={copyWithoutLinebreaks.value}
			onCheckedChange={(e) => {
				copyWithoutLinebreaks.value = e.checked;
			}}
			controlActive="bg-surface-700"
			controlInactive="bg-surface-200"
			>Fluid-Copy
		</Switch>
	</div>

	<div class="h-screen w-full overflow-x-scroll pb-24">
		<div class="containerDocContent grid grid-rows-[40px_auto_40px] gap-5">
			{@render children()}
		</div>
	</div>
</div>
