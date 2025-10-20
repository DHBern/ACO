<script>
	import { handlePopupClick } from '$lib/functions/floatingApparatus';
	import { updateFunctionFloatingPopover } from '$lib/functions/floatingApparatus';
	import { onMount } from 'svelte';
	import { autoUpdate } from '@floating-ui/dom';
	import { createNoteReferenceString } from '$lib/functions/protoHTMLconversion/createNoteReferenceString';

	let { multiMarkPopupStore, selectedNote = $bindable(), notesData, slug_doc } = $props();
	let popUpElement = $state();

	onMount(() => {
		const cleanup = autoUpdate(
			multiMarkPopupStore.target,
			popUpElement,
			updateFunctionFloatingPopover(multiMarkPopupStore.target, popUpElement)
		);
		return () => {
			cleanup();
		};
	});
</script>

<!-- class="absolute z-10 rounded-md border-2 border-[#94ffcf] border-white bg-[#e0fff1] p-5" -->
<div
	class="multimark-popup border-surface-50-950 bg-primary-400-600 absolute max-w-[700px] border-4 transition-transform duration-500"
	bind:this={popUpElement}
>
	<div class="p-1 font-bold">Bitte Kommentar wählen</div>
	<ul class="bg-primary-400-600/10 w-full">
		{#each multiMarkPopupStore.slugs.filter((slug) => slug !== 'TODO') as id (id)}
			{@const idMetadata = notesData[slug_doc][multiMarkPopupStore.slugUnitTarget][id]}
			<li class="hover:bg-secondary-200-800/30 p-2">
				<button
					onclick={() => {
						handlePopupClick(id, selectedNote, multiMarkPopupStore);
					}}
				>
					<p class="color-sky-900 m-0 !pt-0">
						{@html createNoteReferenceString(
							idMetadata.line_start,
							idMetadata.line_end,
							idMetadata.text_start,
							idMetadata.text_end
						)}
					</p>
				</button>
			</li>
		{/each}
	</ul>
</div>
