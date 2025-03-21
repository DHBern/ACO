<script>
	import { handlePopupClick } from '$lib/functions/floatingApparatus';
	import { updateFunctionFloatingPopover } from '$lib/functions/floatingApparatus';
	import { onMount } from 'svelte';
	import { autoUpdate } from '@floating-ui/dom';
	import {createNoteReferenceString} from '$lib/functions/protoHTMLconversion/createNoteReferenceString'

	let { multiMarkPopupIds, selectedNote, notesData, slug_doc, slug_unit } = $props();
	let popUpElement = $state();
	console.log(slug_unit, notesData[slug_doc][slug_unit]);

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
		{@const idMetadata = notesData[slug_doc][slug_unit][id]}
			<li>
				<button
					onclick={() => {
						handlePopupClick(id, selectedNote, multiMarkPopupIds);
					}}
					><p class="color-sky-900">
						{@html createNoteReferenceString(idMetadata.line_start, idMetadata.line_end, idMetadata.text_start, idMetadata.text_end)}
					</p></button
				>
			</li>
		{/each}
	</ul>
</div>
