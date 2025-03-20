<script>
	import { Switch } from '@skeletonlabs/skeleton-svelte';
	import { copyWithoutLinebreaks, marksVisible } from '../../globals.svelte.js';
	import { goto } from '$app/navigation';

	let { data, children } = $props();

</script>

<!-- Document Head (Metadata) -->
<div class="containerDocHead col-span-4 col-start-1 p-5 shadow-md">
	{@html data.docMetadata.meta}
</div>

<!-- Settings and Unit-Navigation -->
<div class="containerSettings flex w-full justify-center align-middle">
	<!-- Unit-Navigation -->
	<div class="containerDocUnits my-5">
		{#each data.docMetadata.slugs as slug, idx}
			<button
				type="button"
				onclick={() => goto(`${slug}`)}
				class="mx-2 my-1 rounded-full bg-black px-4 py-1 text-white">{data.docMetadata.labels[idx]}</button
			>
		{/each}
	</div>
	
	<!-- Settings -->
	<div class="mx-5 flex justify-center gap-2 align-middle">
		<Switch
			name="toggleCopyWithoutLinebreaks"
			checked={copyWithoutLinebreaks.value}
			onCheckedChange={(e) => (copyWithoutLinebreaks.value = e.checked)}
			controlInactive="bg-primary-500"
		>
		<p>Fluid-Copy</p>
		</Switch>
		<Switch
			name="toggleMarksVisible"
			checked={marksVisible.value}
			onCheckedChange={(e) => (marksVisible.value = e.checked)}
			controlInactive="bg-primary-500"
		/>
		<p>Markierungen</p>
	</div>
</div>

<div class="h-screen w-full overflow-x-scroll pb-24">
	<!-- Document Title -->
	<div class="containerDocTitle col-span-1 col-start-3 my-12 **:text-center **:font-bold">
		{@html data.docMetadata.title}
	</div>

	<div class="containerDocContent grid grid-cols-[90px_60px_1fr] lg:grid-cols-[90px_60px_1fr_1fr]">
		{@render children()}
	</div>
</div>
