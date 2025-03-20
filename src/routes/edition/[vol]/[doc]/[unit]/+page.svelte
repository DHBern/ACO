<script>
	import { onMount } from 'svelte';
	import { copyWithoutLinebreaks, marksVisible } from '../../../globals.svelte.js';

	import Note from './Note.svelte';
	import Unit from './Unit.svelte';
	import MultiMarkPopup from './MultiMarkPopup.svelte';

	import {
		extractNoteIds,
		generateMainText,
		generateLineNumbers,
		generatePageNumbers
	} from '$lib/functions/protoHTMLconversion';

	import { placeNotes } from '$lib/functions/floatingApparatus';

	let { data } = $props();

	let selectedNote = $state({ id: '' });
	let multiMarkPopupIds = $state({ ids: [], target: undefined });

	// let mainTexts = $derived(
	// 	data.groupedUnits.map((unit) => {
	// 		return generateMainText(unit.text);
	// 	})
	// );

	function handleResetMultiMark(ev) {
		if (
				!ev.target.classList.contains('multimark-popup') &&
				!(multiMarkPopupIds.ids.length > 0 && ev.target.classList.contains('multiple-ids'))
			) {
				multiMarkPopupIds.ids = [];
			}
	}

	onMount(() => {
		// Extract note-ids from text and place note-boxes at initial positions
		$effect(()=>{

			data.groupedUnits.forEach((unit) => {
				const ids = extractNoteIds(unit.text);
				placeNotes(ids);
			});
		})
		
		// Scrolling to lines and units
		$effect(()=>{
			const elLine = document.querySelector(`[data-line="${data.line}"]`);
			if (elLine) {
				elLine.scrollIntoView({ behavior: 'smooth', block: 'start' });
			}
		})
		$effect(()=>{
			const elLine = document.querySelector(`[data-unit="${data.slug_unit}"]`);
			if (elLine) {
				elLine.scrollIntoView({ behavior: 'smooth', block: 'start' });
			}
		})
		
		// Event Listeners
		document.body.addEventListener('click', handleResetMultiMark);
		
		return () => {
			document.body.removeEventListener('click', handleResetMultiMark);
		}
		
	});
</script>

<!-- Page Numbers -->
<div
	class="containerPageNums col-span-1 col-start-1 row-span-1 row-start-1 lg:row-span-2 lg:row-start-1"
>
	{#each data.groupedUnits as unit}
		{@html generatePageNumbers(unit.text)}
	{/each}
</div>

<!-- Line Numbers -->
<div
	class="containerLineNums col-span-1 col-start-2 row-span-1 row-start-1 lg:row-span-2 lg:row-start-1"
>
	{#each data.groupedUnits as unit}
		{@html generateLineNumbers(unit.text)}
	{/each}
</div>

<!-- Main Text -->
<div
	class={'containerText ' +
		[
			'maintext relative col-span-1 col-start-3 row-span-1 row-start-1 lg:row-span-2 lg:row-start-1',
			copyWithoutLinebreaks.value && 'copyWithoutLinebreaks'
		]}
>
	{#each data.groupedUnits as unit}
		<Unit {unit} text={generateMainText(unit.text)} {selectedNote} {multiMarkPopupIds}></Unit>
	{/each}
</div>

<!-- Notes -->
<div
	class={'containerNotes ' +
		[
			'relative col-span-3 col-start-1 row-span-1 row-start-2 mt-0 transition-all duration-1000 lg:col-span-1 lg:col-start-4 lg:row-span-2 lg:row-start-1',
			copyWithoutLinebreaks.value && 'copyWithoutLinebreaks'
		]}
>
	{#each data.groupedUnits as unit}
		<!-- //! Dont do this twice! -->
		{@const notes = extractNoteIds(unit.text).map((id) => ({
			id: id,
			content: unit.notes[id]?.note_content
		}))}
		{#each notes as note}
			<Note {note} {selectedNote}></Note>
		{/each}
	{/each}
</div>

<!-- Popups for multiple notes over same place -->
{#if multiMarkPopupIds.ids.length > 0}
	<MultiMarkPopup {multiMarkPopupIds} {selectedNote} />
{/if}

<style lang="postcss">
	@reference "tailwindcss";

	.containerLineNums :global(a.line-number),
	.containerPageNums :global(a.page-number) {
		@apply mr-2 select-none;
	}

	/* Anchors for line-numbers */
	.containerLineNums :global(a.line-number::after) {
		@apply ml-2 hidden h-4 w-4 bg-[url(/icons/link.svg)] bg-contain bg-no-repeat content-[""];
	}
	.containerLineNums :global(a.line-number:hover::after) {
		@apply inline-block;
	}
	.containerLineNums :global(.lineNumBuffer) {
		@apply text-black/0 select-none;
	}
</style>
