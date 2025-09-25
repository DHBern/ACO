<script>
	import { abbData } from '$lib/data/get_alldata_testing';
	import { X } from '@lucide/svelte';
	import { Modal } from '@skeletonlabs/skeleton-svelte';

	let { openState = $bindable(false) } = $props();

	function drawerClose() {
		openState = false;
	}
</script>

<Modal
	open={openState}
	onOpenChange={(e) => (openState = e.value)}
	contentBase="p-4 space-y-4 shadow-xl w-[480px] h-screen bg-[var(--aco-orange-light)] relative border-r-5 border-r-[var(--aco-orange-light2)]"
	positionerJustify="justify-start"
	positionerAlign=""
	positionerPadding=""
	transitionsPositionerIn={{ x: -480, duration: 200 }}
	transitionsPositionerOut={{ x: -480, duration: 200 }}
	classes="containerAbbreviations"
>
	{#snippet content()}
		<header class="relative flex flex-wrap justify-between pl-5">
			<h2 class="h3 mt-7">Abkürzungsverzeichnis</h2>
		</header>
		<button
			type="button"
			class="btn preset-filled absolute top-4 right-4 h-12 w-12 rounded-full border-2 border-[var(--aco-orange-light2)] bg-transparent p-0"
			onclick={drawerClose}
		>
			<X size="18" color="var(--aco-orange-light2)" />
		</button>
		<article class="mt-8 grid h-8/10 grid-cols-[150px_auto] gap-4 overflow-y-auto px-10 pb-5">
			{#each Object.keys(abbData) as key}
				<span class="col-span-1 col-start-1 font-bold">{key}</span>
				<span class="col-span-1 col-start-2">{abbData[key]}</span>
			{/each}
		</article>
		<footer></footer>
	{/snippet}
</Modal>
