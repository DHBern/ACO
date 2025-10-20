<script>
	import { abbData } from '$lib/data/get_alldata_testing.js';
	import { X } from '@lucide/svelte';
	import { Dialog } from '@skeletonlabs/skeleton-svelte';

	let { openState = $bindable(false) } = $props();

	function drawerClose() {
		openState = false;
	}
</script>

<Dialog
	open={openState}
	onOpenChange={(e) => (openState = e.value)}
	contentBase="p-4 space-y-4 shadow-xl w-[480px] h-screen bg-secondary-400-600 relative border-r-5 border-r-secondary-200-800"
	positionerJustify="justify-start"
	positionerAlign=""
	positionerPadding=""
	transitionsPositionerIn={{ x: -480, duration: 200 }}
	transitionsPositionerOut={{ x: -480, duration: 200 }}
	classes="containerAbbreviations"
>
	{#snippet content()}
		<div class="flex h-full flex-col">
			<header class="relative flex flex-wrap justify-between pl-5">
				<h2 class="h3 mt-18">Abkürzungsverzeichnis</h2>
			</header>
			<article class="mt-8 grid flex-grow grid-cols-[150px_auto] gap-4 overflow-y-auto px-10 pb-5">
				{#each Object.keys(abbData) as key}
					<span class="col-span-1 col-start-1 font-bold">{key}</span>
					<span class="col-span-1 col-start-2">{abbData[key]}</span>
				{/each}
			</article>
			<footer></footer>
		</div>
		<button
			type="button"
			class="btn preset-filled border-secondary-700-300 absolute top-4 right-4 h-12 w-12 rounded-full border-2 bg-transparent p-0"
			onclick={drawerClose}
		>
			<X size="18" color="var(--color-secondary-700-300)" />
		</button>
	{/snippet}
</Dialog>
