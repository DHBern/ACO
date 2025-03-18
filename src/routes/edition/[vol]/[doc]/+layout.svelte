<script>
	import { Switch } from '@skeletonlabs/skeleton-svelte';
	import { copyWithoutLinebreaks } from '../../globals.svelte.js';

	let { data, children } = $props();

	let dochead = $state(data.dochead);
	let doctitle = $state(data.doctitle);
</script>

<div id="containerSettings" class="flex w-full justify-center align-middle">
	<div class="flex justify-center align-middle">
		<Switch
			name="toggleCopyWithoutLinebreaks"
			active="bg-primary-500"
			bind:checked={copyWithoutLinebreaks.value}
		/>
		<p>Ohne Zeilenumbrüche kopieren</p>
	</div>
</div>

<div
	id="containerDocHead"
	class="grid h-screen w-full grid-cols-[90px_750px_60px_600px] overflow-x-hidden overflow-y-scroll border border-r-black pb-24"
>
	<!-- Document Head (Metadata) -->
	<div id="containerDocHead" class="col-span-3 col-start-1 m-5 bg-slate-50 p-5 shadow-xl">
		{@html dochead}
	</div>

	<!-- Document Title -->
	<div id="containerDocTitle" class="col-span-1 col-start-2 my-12 **:font-bold **:text-center">
		{@html doctitle}
	</div>

	{@render children()}
</div>
