<script>
	import { onMount } from 'svelte';
	import { copyWithoutLinebreaks } from '../../../globals.svelte.js';

	import LoadButton from './LoadButton.svelte';
	import Note from './Note.svelte';
	import Unit from './Unit.svelte';
	import MultiMarkPopup from './MultiMarkPopup.svelte';
	import { placeNotes } from '$lib/functions/floatingApparatus/placeNotes.js';

	import {
		extractNoteIds,
		generateMainText,
		generateLineNumbers,
		generatePageNumbers
	} from '$lib/functions/protoHTMLconversion';

	let { data } = $props();

	let groupedUnits = $state(data.groupedUnits);
	$effect(() => {
		groupedUnits = data.groupedUnits;
	});

	let selectedNote = $state({ slug: '' });
	let multiMarkPopupStore = $state({ slugs: [], target: undefined, slugUnitTarget: undefined });

	function handleResetMultiMark(ev) {
		if (
			!ev.target.classList.contains('multimark-popup') &&
			!(multiMarkPopupStore.slugs.length > 0 && ev.target.classList.contains('multiple-ids'))
		) {
			multiMarkPopupStore.slugs = [];
		}
	}

	// Extract note-ids from text and place note-boxes at initial positions
	$effect(() => {
		groupedUnits.forEach((unit) => {
			placeNotes(extractNoteIds(unit.text));
		});
	});

	// Scrolling to lines and units
	$effect(() => {
		const elLine = document.querySelector(`[data-line="${data.line}"]`);
		if (elLine) {
			elLine.scrollIntoView({ behavior: 'smooth', block: 'start' });
		}
	});
	$effect(() => {
		const elLine = document.querySelector(`[data-unit="${data.slug_unit}"]`);
		if (elLine) {
			elLine.scrollIntoView({ behavior: 'smooth', block: 'start' });
		}
	});

	onMount(() => {

		// Event Listeners
		document.body.addEventListener('click', handleResetMultiMark);

		return () => {
			document.body.removeEventListener('click', handleResetMultiMark);
		};
	});
</script>

<div class="grid grid-rows-[1fr_auto_1fr]">
	<!-- Load Button -->
	{#if groupedUnits[0].prevSlug}
		<LoadButton type="prev" {data} {groupedUnits} classes="row-span-1 row-start-1" />
	{/if}

	<!-- Units -->
	<div
		class="row-span-1 row-start-2 grid grid-cols-[90px_60px_1fr] gap-6 lg:grid-cols-[100px_50px_auto_1fr]"
	>
		<!-- Page Numbers -->
		<div class="containerPageNums col-span-1 col-start-1">
			{#each groupedUnits as unit (unit.slug)}
				{@html generatePageNumbers(unit.text)}
			{/each}
		</div>

		<!-- Line Numbers -->
		<div class="containerLineNums col-span-1 col-start-2">
			{#each groupedUnits as unit (unit.slug)}
				{@html generateLineNumbers(unit.text)}
			{/each}
		</div>

		<!-- Main Text -->
		<div
			class={[
				'containerText maintext relative col-span-1 col-start-3',
				copyWithoutLinebreaks.value && 'copyWithoutLinebreaks'
			]}
		>
			{#each groupedUnits as unit (unit.slug)}
				<Unit
					slug={unit.slug}
					text={generateMainText(unit.text)}
					unitLabelInline={unit.labelInline}
					{selectedNote}
					{multiMarkPopupStore}
				></Unit>
			{/each}
		</div>

		<!-- Notes -->
		<div
			class={[
				'containerNotes relative col-span-3 col-start-1 transition-all duration-1000 lg:col-span-1 lg:col-start-4 lg:row-span-2 lg:row-start-1',
				copyWithoutLinebreaks.value && 'copyWithoutLinebreaks'
			]}
		>
			{#each groupedUnits as unit (unit.slug)}
				<!-- //! Dont do this twice! -->
				{#each extractNoteIds(unit.text) as noteSlug (noteSlug)}
					<Note {noteSlug} noteMetadata={unit.notes[noteSlug]} {selectedNote}></Note>
				{/each}
			{/each}
		</div>

		<!-- Popups for multiple notes over same place -->
		{#if multiMarkPopupStore.slugs.length > 0}
			<MultiMarkPopup
				{multiMarkPopupStore}
				{selectedNote}
				notesData={data.notesData}
				slug_doc={data.slug_doc}
			/>
		{/if}
	</div>
	<!-- Load Button -->
	{#if groupedUnits[groupedUnits.length - 1].nextSlug}
		<LoadButton type="next" {data} {groupedUnits} classes="row-span-1 row-start-3" />
	{/if}
</div>

<style lang="postcss">
	@reference "tailwindcss";

	.containerLineNums :global(a.line-number),
	.containerPageNums :global(a.page-number) {
		@apply mr-2 select-none;
	}

	/* Anchors for line-numbers and page-numbers */
	.containerLineNums :global(a.line-number::after),
	.containerPageNums :global(a.page-number::after) {
		@apply ml-2 hidden h-4 w-4 bg-[url(/icons/link.svg)] bg-contain bg-no-repeat content-[""];
	}
	.containerLineNums :global(a.line-number:hover::after),
	.containerPageNums :global(a.page-number:hover::after) {
		@apply inline-block;
	}
	.containerLineNums :global(.lineNumBuffer) {
		@apply text-black/0 select-none;
	}
</style>
