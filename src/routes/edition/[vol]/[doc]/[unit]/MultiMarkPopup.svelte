<script>
	import { handlePopupClick } from '$lib/functions/floatingApparatus';
	import { Popover } from '@skeletonlabs/skeleton-svelte';
	import IconX from '@lucide/svelte/icons/x';
	// import {PositioningOptions} from '$lib/types/popover.ts'
	
	let openState = $state(false);

	function popoverClose() {
	openState = false;
	}




	let { multiMarkPopupIds, selectedNote } = $props();
</script>
<!-- 
<Popover
	open={openState}
	onOpenChange={(e) => (openState = e.open)}
	positioning={{ placement: 'top' }}
	triggerBase="btn preset-tonal"
	contentBase="card bg-surface-200-800 p-4 space-y-4 max-w-[320px]"
	arrow
	arrowBackground="!bg-surface-200 dark:!bg-surface-800"
	>
	{#snippet trigger()}Click Me{/snippet}
	{#snippet content()}
		<header class="flex justify-between">
		<p class="font-bold text-xl">Popover Example</p>
		<button class="btn-icon hover:preset-tonal" onclick={popoverClose}><IconX /></button>
		</header>
		<article>
		<p class="opacity-60">
			This will display a basic popover with a header and body. This also includes a title, description, and close button.
		</p>
		</article>
	{/snippet}
</Popover> -->

<div
	class="multimark-popup absolute left-5 top-1/2 z-10 rounded-md border-2 border-[#94ffcf] border-white bg-[#e0fff1] p-5"
>
	<ul>
		{#each multiMarkPopupIds.ids as id}
			<li>
				<button
					onclick={() => {
						handlePopupClick(id, selectedNote, multiMarkPopupIds);
					}}><p class="color-sky-900">{id}</p></button
				>
			</li>
		{/each}
	</ul>
</div>
