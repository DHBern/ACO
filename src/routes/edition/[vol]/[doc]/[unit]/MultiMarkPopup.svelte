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

<div
	class="multimark-popup border-surface-50-950 bg-surface-50-950 absolute max-w-[700px] border-4 transition-transform duration-500"
	bind:this={popUpElement}
>
	<div class="bg-secondary-500/10 p-1 px-3 font-bold">Bitte Kommentar wählen</div>
	<ul class="bg-secondary-300-700/60 w-full">
		{#each multiMarkPopupStore.slugs.filter((slug) => slug !== 'TODO') as id (id)}
			{@const idMetadata = notesData[slug_doc][multiMarkPopupStore.slugUnitTarget][id]}
			<li class="hover:bg-secondary-300-700 p-2">
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
