<script>
	import { handlePopupClick } from '$lib/functions/floatingApparatus';
	import { updateFunctionFloatingPopover } from '$lib/functions/floatingApparatus';
	import { onMount } from 'svelte';
	import { autoUpdate } from '@floating-ui/dom';

	let { multiMarkPopupIds, selectedNote } = $props();
	let popUpElement = $state();

	onMount(() => {
		const cleanup = autoUpdate(
			multiMarkPopupIds.target,
			popUpElement,
			updateFunctionFloatingPopover(multiMarkPopupIds.target, popUpElement)
		);
		return () => {
			cleanup();
		};
	});
</script>

<div
	class="multimark-popup absolute z-10 rounded-md border-2 border-[#94ffcf] border-white bg-[#e0fff1] p-5"
	bind:this={popUpElement}
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
