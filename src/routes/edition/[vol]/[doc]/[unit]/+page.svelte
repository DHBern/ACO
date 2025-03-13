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

	let allunits = $state(data.allunits);

	let mainTexts = $derived(
		allunits.map((unit) => {
			return generateMainText(unit);
		})
	);

	onMount(() => {
		allunits.forEach((unit) => {
			const ids = extractNoteIds(unit);
			placeNotes(ids);
		});
	});
</script>

<!-- Page Numbers -->
<div id="containerPageNums" class="col-span-1 col-start-1">
	{#each allunits as unit}
		{@html generatePageNumbers(unit)}
	{/each}
</div>

<!-- Main Text -->
<div
	id="containerText"
	class={[
		'maintext relative col-span-1 col-start-2',
		copyWithoutLinebreaks.value && 'copyWithoutLinebreaks'
	]}
>
	{#each allunits as unit, idx}
		<Text text={mainTexts[idx]} {selectedNote} {multiMarkPopupIds}></Text>
	{/each}
</div>

<!-- Line Numbers -->
<div id="containerLineNums" class="col-span-1 col-start-3">
	{#each allunits as unit}
		{@html generateLineNumbers(unit)}
	{/each}
</div>
<!-- Notes -->
<div
	id="containerNotes"
	class={[
		'relative col-span-1 col-start-4 mt-0 transition-all duration-1000',
		copyWithoutLinebreaks.value && 'copyWithoutLinebreaks'
	]}
>
	{#each allunits as unit}
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
	#containerText :global(a.lib-number) {
		text-align: center;
		font-weight: 600;
	}
	#containerLineNums :global(a.line-number), 
	#containerLineNums :global(a.page-number) {
		user-select: none;
		margin-right: 8px;
	}
	#containerLineNums :global(a.line-number::after) {
		content: '';
		background-image: url(/icons/link.svg);
		background-size: contain;
		background-repeat: no-repeat;
		margin-left: 10px;
		width: 1em; /* Adjust width as needed */
		height: 1em; /* This makes it scale with line-height */
		display: none;
	}
	#containerLineNums :global(a.line-number:hover::after) {
		display: inline-block;
	}
	#containerLineNums :global(a.line-number-hidden) {
		color: white;
		&:hover {
			color: grey;
		}
	}
	#containerLineNums :global(.lineNumBuffer) {
		user-select: none;
		color: white;
	}
</style>
