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

	import {
		ID_CONTAINER_LINENUMS,
		ID_CONTAINER_NOTES,
		ID_CONTAINER_PAGENUMS,
		ID_CONTAINER_TEXT
	} from '$lib/constants/constants';

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
<div id={ID_CONTAINER_PAGENUMS} class="col-span-1 col-start-1">
	{#each allunits as unit}
		{@html generatePageNumbers(unit)}
	{/each}
</div>

<!-- Main Text -->
<!-- svelte-ignore a11y_click_events_have_key_events -->
<!-- svelte-ignore a11y_no_static_element_interactions -->
<div
	id={ID_CONTAINER_TEXT}
	class={[
		'maintext relative col-span-1 col-start-2',
		copyWithoutLinebreaks.value && 'copyWithoutLinebreaks'
	]}
	onclick={(ev) => {
		handleMarkClick(ev, selectedNote, multiMarkPopupIds);
	}}
>
	{#each allunits as unit, idx}
		<Text text={mainTexts[idx]}></Text>
	{/each}
</div>

<!-- Line Numbers -->
<div id={ID_CONTAINER_LINENUMS} class="col-span-1 col-start-3">
	{#each allunits as unit}
		{@html generateLineNumbers(unit)}
	{/each}
</div>
<!-- Notes -->
<div
	id={ID_CONTAINER_NOTES}
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
	:global(a.lib-number) {
		text-align: center;
		font-weight: 600;
	}
	:global(a.line-number, a.page-number) {
		user-select: none;
		margin-right: 8px;
	}
	:global(a.line-number::after) {
		content: '';
		background-image: url(/icons/link.svg);
		background-size: contain;
		background-repeat: no-repeat;
		margin-left: 10px;
		width: 1em; /* Adjust width as needed */
		height: 1em; /* This makes it scale with line-height */
		display: none;
	}
	:global(a.line-number:hover::after) {
		display: inline-block;
	}
	:global(a.line-number-hidden) {
		color: white;
		&:hover {
			color: grey;
		}
	}
	:global(.lineNumBuffer) {
		user-select: none;
		color: white;
	}
</style>
