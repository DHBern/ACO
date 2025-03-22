<script>
	import { handlePopupClick } from '$lib/functions/floatingApparatus';
	import { updateFunctionFloatingPopover } from '$lib/functions/floatingApparatus';
	import { onMount } from 'svelte';
	import { autoUpdate } from '@floating-ui/dom';
	import { createNoteReferenceString } from '$lib/functions/protoHTMLconversion/createNoteReferenceString';

	let { multiMarkPopupSlugs, selectedNote, notesData, slug_doc, slug_unit } = $props();
	let popUpElement = $state();
	console.log(slug_unit, notesData[slug_doc][slug_unit]);

	onMount(() => {
		const cleanup = autoUpdate(
			multiMarkPopupSlugs.target,
			popUpElement,
			updateFunctionFloatingPopover(multiMarkPopupSlugs.target, popUpElement)
		);
		return () => {
			cleanup();
		};
	});
</script>

<!-- class="absolute z-10 rounded-md border-2 border-[#94ffcf] border-white bg-[#e0fff1] p-5" -->
<div
	class="multimark-popup absolute max-w-[700px] border-4 border-[var(--aco-gray-1)] bg-[var(--aco-gray-1)] transition-transform duration-500 dark:bg-[var(--aco-teal)]"
	bind:this={popUpElement}
>
	<div class="p-1 font-bold">Bitte Kommentar wählen</div>
	<ul
		class="w-full bg-[var(--aco-teal-light)]/10"
	>
		{#each multiMarkPopupSlugs.slugs as id (id)}
			{@const idMetadata = notesData[slug_doc][slug_unit][id]}
			<li class="p-2 hover:bg-[var(--aco-orange-light)]/30">
				<button
					onclick={() => {
						handlePopupClick(id, selectedNote, multiMarkPopupSlugs);
					}}
					><p class="m-0 !pt-0 color-sky-900">
						{@html createNoteReferenceString(
							idMetadata.line_start,
							idMetadata.line_end,
							idMetadata.text_start,
							idMetadata.text_end
						)}
					</p></button
				>
			</li>
		{/each}
	</ul>
</div>
