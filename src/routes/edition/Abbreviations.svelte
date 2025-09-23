<script>
	import { abbData } from '$lib/data/get_data';
	import { Modal } from '@skeletonlabs/skeleton-svelte';
	let drawerState = $state(false);

	function drawerClose() {
		drawerState = false;
	}
	let abbs = abbData;
</script>

<Modal
	open={drawerState}
	onOpenChange={(e) => (drawerState = e.value)}
	triggerBase="btn preset-filled"
	contentBase="bg-surface-100-900 p-4 space-y-4 shadow-xl w-[480px] h-screen overflow-y-auto"
	positionerJustify="justify-start"
	positionerAlign=""
	positionerPadding=""
	transitionsPositionerIn={{ x: -480, duration: 200 }}
	transitionsPositionerOut={{ x: -480, duration: 200 }}
	classes="containerAbbreviations"
>
	{#snippet trigger()}Abkürzungsverzeichnis{/snippet}

	{#snippet content()}
		<header class="flex justify-between">
			<h2 class="h2">Abkürzungsverzeichnis</h2>
		</header>
		<article>
			<div class="grid grid-cols-[150px_auto] gap-4 pb-5 pl-13">
				{#each Object.keys(abbs) as key}
					<span class="col-span-1 col-start-1 font-bold">{key}</span>
					<span class="col-span-1 col-start-2">{abbs[key]}</span>
				{/each}
			</div>
		</article>
		<footer>
			<button type="button" class="btn preset-filled" onclick={drawerClose}>Schliessen</button>
		</footer>
	{/snippet}
</Modal>
