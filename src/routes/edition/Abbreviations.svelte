<script>
	import { abbData } from '$lib/data/get_alldata_testing.js';
	import { X } from '@lucide/svelte';
	import { Dialog, Portal } from '@skeletonlabs/skeleton-svelte';
	let { openState = $bindable(false) } = $props();

	function drawerClose() {
		openState = false;
	}
</script>

<Dialog open={openState} onOpenChange={(e) => (openState = e.value)}>
	<Portal>
		<Dialog.Positioner
			class="fixed inset-0 z-50 flex justify-start transition-transform duration-200"
		>
			<Dialog.Content
				class="bg-secondary-400-600 border-r-secondary-200-800 relative h-screen w-[480px] space-y-4 border-r-5 p-4 shadow-xl"
			>
				<div class="flex h-full flex-col">
					<header class="relative flex flex-wrap justify-between pl-5">
						<h2 class="h3 mt-18">Abkürzungsverzeichnis</h2>
					</header>
					<article
						class="mt-8 grid flex-grow grid-cols-[150px_auto] gap-4 overflow-y-auto px-10 pb-5"
					>
						{#each Object.keys(abbData) as key}
							<span class="col-span-1 col-start-1 font-bold">{key}</span>
							<span class="col-span-1 col-start-2">{abbData[key]}</span>
						{/each}
					</article>
					<footer></footer>
				</div>
				<Dialog.CloseTrigger
					class="btn preset-filled border-secondary-700-300 absolute top-4 right-4 h-12 w-12 rounded-full border-2 bg-transparent p-0"
					onclick={drawerClose}
				>
					<X size="18" color="var(--color-secondary-700-300)" />
				</Dialog.CloseTrigger>
			</Dialog.Content>
		</Dialog.Positioner>
	</Portal>
</Dialog>
