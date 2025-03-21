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

<!-- Document Metadata -->
<Accordion
	{accordionMetadata}
	onValueChange={(e) => (accordionMetadata = e.value)}
	collapsible
	classes="containerDocHead shadow-md"
>
	<Accordion.Item accordionMetadata="metadata">
		{#snippet lead()}{/snippet}
		{#snippet control()}Dokument-Angaben zu {@html data.docMetadata.toc_title}{/snippet}
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
	<Accordion.Item accordionUnitNav="unitNav">
		{#snippet lead()}{/snippet}
		{#snippet control()}Zu Kapitel/Einheit springen{/snippet}
		{#snippet panel()}
			<div class="containerDocUnits my-5 max-h-60 overflow-y-scroll">
				{#each data.docMetadata.slugs as slug, idx (slug)}
					<button
						type="button"
						onclick={() => {
							goto(`${slug}`);
							console.log('goto: ', slug);
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
		name="toggleCopyWithoutLinebreaks"
		checked={copyWithoutLinebreaks.value}
		onCheckedChange={(e) => {
			copyWithoutLinebreaks.value = e.checked;
		}}
		controlActive="bg-surface-700"
		controlInactive="bg-surface-200"
	>
		<p>Fluid-Copy</p>
	</Switch>
	<Switch
		name="toggleMarksVisible"
		checked={marksVisible.value}
		onCheckedChange={(e) => (marksVisible.value = e.checked)}
		controlActive="bg-surface-700"
		controlInactive="bg-surface-200"
	/>
	<p>Markierungen</p>
</div>

<div class="h-screen w-full overflow-x-scroll pb-24">
	<div
		class="containerDocContent grid grid-cols-[90px_60px_1fr] gap-6 lg:grid-cols-[80px_50px_auto_1fr]"
	>
		{@render children()}
	</div>
</div>
