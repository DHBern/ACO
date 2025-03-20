<script>
	import { Switch } from '@skeletonlabs/skeleton-svelte';
	import { copyWithoutLinebreaks } from '../../globals.svelte.js';

	let { data, children } = $props();

	let dochead = $state(data.dochead);
	let doctitle = $state(data.doctitle);
	let state = $state(false)
</script>

<!-- <div class="containerSettings flex w-full justify-center align-middle">
	<div class="flex justify-center align-middle">
		<Switch
			name="toggleCopyWithoutLinebreaks"
			checked={copyWithoutLinebreaks.value}
			onCheckedChange={(e) => (copyWithoutLinebreaks.value = e.checked)}
			controlInactive="bg-primary-500"
		/>
		<p>Ohne Zeilenumbrüche kopieren</p>
	</div>
</div> -->

<div class="containerDocHead grid h-screen w-full grid-cols-[90px_60px_1fr_1fr] overflow-x-scroll pb-24">
	<!-- Document Head (Metadata) -->
	<div class="containerDocHead col-span-4 col-start-1 m-5 p-5 shadow-md">
		{@html dochead}
	</div>

	<!-- Document Title -->
	<div class="containerDocTitle col-span-1 col-start-3 my-12 **:font-bold **:text-center">
		{@html doctitle}
	</div>

	{@render children()}
</div>
