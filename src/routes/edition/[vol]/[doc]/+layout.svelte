<script>
	import { Switch } from '@skeletonlabs/skeleton-svelte';

	import {
		ID_CONTAINER_SETTINGS,
		ID_CONTAINER_MAIN,
		ID_CONTAINER_DOCHEAD,
		ID_CONTAINER_DOCTITLE
	} from '$lib/constants/constants';

	let { data, children } = $props();

	let dochead = $state(data.dochead);
	let doctitle = $state(data.doctitle);

	let copyWithoutLinebreaks = $state(false);
</script>

<div id={ID_CONTAINER_SETTINGS} class="flex w-full justify-center align-middle">
	<div class="flex justify-center align-middle">
		<Switch
			name="toggleCopyWithoutLinebreaks"
			active="bg-primary-500"
			bind:checked={copyWithoutLinebreaks}
		/>
		<p>Ohne Zeilenumbrüche kopieren</p>
	</div>
</div>

<div
	id={ID_CONTAINER_MAIN}
	class="grid h-screen w-full grid-cols-[90px,750px,60px,600px] overflow-x-hidden overflow-y-scroll border border-r-black pb-24"
>
	<!-- Document Head (Metadata) -->
	<div id={ID_CONTAINER_DOCHEAD} class="col-span-3 col-start-1 m-5 bg-slate-50 p-5 shadow-xl">
		{@html dochead}
	</div>

	<!-- Document Title -->
	<div id={ID_CONTAINER_DOCTITLE} class="col-span-1 col-start-2 my-12">
		{@html doctitle}
	</div>

	{@render children()}
</div>

<style>
	:global(#containerDocTitle p) {
		font-weight: 700;
		text-align: center;
	}

	:global(p) {
		padding-top: 15px;
	}
</style>
