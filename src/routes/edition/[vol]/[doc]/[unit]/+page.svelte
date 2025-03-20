<script>
	import { onMount } from 'svelte';
	import { copyWithoutLinebreaks } from '../../../globals.svelte';

	import Note from './Note.svelte';
	import Text from './Text.svelte';
	import MultiMarkPopup from './MultiMarkPopup.svelte';

	import {
		extractNoteIds,
		generateMainText,
		generateLineNumbers,
		generatePageNumbers
	} from '$lib/functions/protoHTMLconversion';

	import { placeNotes, handleMarkClick } from '$lib/functions/floatingApparatus';

	let { data } = $props();

	let allNotes = $state(data.notes);
	let selectedNote = $state({ id: '' });
	let multiMarkPopupIds = $state({ ids: [] });

	let units = $state(data.units);

	let mainTexts = $derived(
		units.map((unit) => {
			return generateMainText(unit);
		})
	);

	onMount(() => {
		units.forEach((unit) => {
			const ids = extractNoteIds(unit);
			placeNotes(ids);
		});
	});
</script>

<!-- Page Numbers -->
<div class="containerPageNums row-start-1 row-span-1 lg:row-start-1 lg:row-span-2 col-span-1 col-start-1">
	{#each units as unit}
		{@html generatePageNumbers(unit)}
	{/each}
</div>

<!-- Line Numbers -->
<div class="containerLineNums row-start-1 row-span-1 lg:row-start-1 lg:row-span-2 col-span-1 col-start-2">
	{#each units as unit}
		{@html generateLineNumbers(unit)}
	{/each}
</div>

<!-- Main Text -->
<div class={"containerText " + [
		'maintext relative row-start-1 row-span-1 lg:row-start-1 lg:row-span-2 col-span-1 col-start-3',
		copyWithoutLinebreaks.value && 'copyWithoutLinebreaks'
	]}
>
	{#each units as unit, idx}
		<Text text={mainTexts[idx]} {selectedNote} {multiMarkPopupIds}></Text>
	{/each}
</div>

<!-- Notes -->
<div
	class={"containerNotes "+[
		'relative row-start-2 row-span-1 lg:row-start-1 lg:row-span-2 col-span-3 col-start-1 lg:col-span-1 lg:col-start-4 mt-0 transition-all duration-1000',
		copyWithoutLinebreaks.value && 'copyWithoutLinebreaks'
	]}
>
	{#each units as unit}
		{@const notes = extractNoteIds(unit).map((id) => ({
			id: id,
			content: allNotes[id]?.note_content
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

<style>
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
