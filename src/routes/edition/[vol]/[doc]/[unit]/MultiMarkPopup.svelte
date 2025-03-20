<script>
	import { handlePopupClick } from '$lib/functions/floatingApparatus';
	import { onMount } from 'svelte';
	import { autoUpdate } from '@floating-ui/dom';
	import { computePosition, shift, flip, offset } from '@floating-ui/dom';

	let { multiMarkPopupIds, selectedNote } = $props();

	let popUpElement = $state();

	onMount(() => {
		const updateFunction = () => {
			computePosition(multiMarkPopupIds.target, popUpElement, {
				placement: 'top',
				middleware: [offset(5), flip(), shift()],
				strategy: 'absolute'
			}).then(({ x, y }) => {
				popUpElement.style.top = `${y}px`;
				popUpElement.style.left = `${x}px`;
				popUpElement.style.display = 'block';
			});
		};
		const cleanup = autoUpdate(multiMarkPopupIds.target, popUpElement, updateFunction);
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
