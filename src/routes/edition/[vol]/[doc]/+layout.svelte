<script>
	import { Switch } from '@skeletonlabs/skeleton-svelte';
	import { copyWithoutLinebreaks } from '../../globals.svelte.js';
	import { goto } from '$app/navigation';

	let { data, children } = $props();

	let dochead = $state(data.dochead);
	let doctitle = $state(data.doctitle);

	const units = $state(data.units);
	console.log(units);

</script>



<!-- Document Head (Metadata) -->
<div class="containerDocHead col-span-4 col-start-1 p-5 shadow-md">
	{@html dochead}
</div>

<div class="containerSettings flex w-full justify-center align-middle">
	<div class="containerDocUnits my-5">
		{#each units as unit}
			<button type="button" onclick={()=>(goto(`${unit}`))}
				class="px-4 py-1 mx-2 rounded-full bg-black text-white">{unit}</button>
		{/each}
	</div>
	<div class="flex justify-center align-middle mx-5 gap-2">
		<Switch
			name="toggleCopyWithoutLinebreaks"
			checked={copyWithoutLinebreaks.value}
			onCheckedChange={(e) => (copyWithoutLinebreaks.value = e.checked)}
			controlInactive="bg-primary-500"
		/>
		<p>Copy-Mode</p>
	</div>
</div>

<div class="h-screen w-full  overflow-x-scroll pb-24">
	<!-- Document Title -->
	<div class="containerDocTitle col-span-1 col-start-3 my-12 **:font-bold **:text-center">
		{@html doctitle}
	</div>

	<div class="containerDocContent grid grid-cols-[90px_60px_1fr] lg:grid-cols-[90px_60px_1fr_1fr]">
		{@render children()}
	</div>
</div>
