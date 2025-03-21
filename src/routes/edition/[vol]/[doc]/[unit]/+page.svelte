<script>
	import { onMount } from 'svelte';
	import { copyWithoutLinebreaks } from '../../../globals.svelte.js';

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
	let multiMarkPopupSlugs = $state({ slugs: [], target: undefined });

	function handleResetMultiMark(ev) {
		if (
			!ev.target.classList.contains('multimark-popup') &&
			!(multiMarkPopupSlugs.slugs.length > 0 && ev.target.classList.contains('multiple-ids'))
		) {
			multiMarkPopupSlugs.slugs = [];
		}
	}

	// Extract note-ids from text and place note-boxes at initial positions
	$effect(() => {
		groupedUnits.forEach((unit) => {
			const ids = extractNoteIds(unit.text);
			placeNotes(ids);
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

<!-- Page Numbers -->
<div
	class="containerPageNums col-span-1 col-start-1 row-span-1 row-start-1 lg:row-span-2 lg:row-start-1"
>
	{#each groupedUnits as unit (unit.slug)}
		{@html generatePageNumbers(unit.text)}
	{/each}
</div>

<!-- Line Numbers -->
<div
	class="containerLineNums col-span-1 col-start-2 row-span-1 row-start-1 lg:row-span-2 lg:row-start-1"
>
	{#each groupedUnits as unit (unit.slug)}
		{@html generateLineNumbers(unit.text)}
	{/each}
</div>

<!-- Main Text -->
<div
	class={[
		'containerText maintext relative col-span-1 col-start-3 row-span-1 row-start-1 lg:row-span-2 lg:row-start-1',
		copyWithoutLinebreaks.value && 'copyWithoutLinebreaks'
	]}
>
	{#if data.docMetadata.slugs.findIndex((unit) => unit === groupedUnits[0].prevSlug) - 1}
		<button
			class="shadow-4xl m-3 mx-auto block min-w-[50px] bg-red-300 px-5 py-1"
			type="button"
			onclick={(ev) => {
				const firstUnit = groupedUnits[0];
				groupedUnits.unshift({
					slug: firstUnit.prevSlug,
					prevSlug:
						data.docMetadata.slugs[
							data.docMetadata.slugs.findIndex((unit) => unit === firstUnit.prevSlug) - 1 || null
						] || null,
					nextSlug:
						data.docMetadata.slugs[
							data.docMetadata.slugs.findIndex((unit) => unit === firstUnit.prevSlug) + 1 || null
						] || null,
					prevSlugLabel:
						data.docMetadata.labels[
							data.docMetadata.slugs.findIndex((unit) => unit === firstUnit.prevSlug) - 1 || null
						] || null,
					nextSlugLabel:
						data.docMetadata.labels[
							data.docMetadata.slugs.findIndex((unit) => unit === firstUnit.prevSlug) + 1 || null
						] || null,
					text: data.docContent[firstUnit.prevSlug] || '',
					notes: data.notesData[data.slug_doc]?.[firstUnit.prevSlug] || []
				});
			}}><span class="font-bold">{groupedUnits[0].prevSlugLabel}</span> laden</button
		>
	{/if}
	{#each groupedUnits as unit (unit.slug)}
		<Unit slug={unit.slug} text={generateMainText(unit.text)} {selectedNote} {multiMarkPopupSlugs}
		></Unit>
	{/each}
	{#if data.docMetadata.slugs.findIndex((unit) => unit === groupedUnits[groupedUnits.length - 1].nextSlug) + 1}
		<button
			class="shadow-4xl m-3 mx-auto block min-w-[50px] bg-red-300 px-5 py-1"
			type="button"
			onclick={(ev) => {
				const lastUnit = groupedUnits[groupedUnits.length - 1];
				groupedUnits.push({
					slug: lastUnit.nextSlug,
					prevSlug:
						data.docMetadata.slugs[
							data.docMetadata.slugs.findIndex((unit) => unit === lastUnit.nextSlug) - 1 || null
						] || null,
					nextSlug:
						data.docMetadata.slugs[
							data.docMetadata.slugs.findIndex((unit) => unit === lastUnit.nextSlug) + 1 || null
						] || null,
					prevSlugLabel:
						data.docMetadata.labels[
							data.docMetadata.slugs.findIndex((unit) => unit === lastUnit.nextSlug) - 1 || null
						] || null,
					nextSlugLabel:
						data.docMetadata.labels[
							data.docMetadata.slugs.findIndex((unit) => unit === lastUnit.nextSlug) + 1 || null
						] || null,
					text: data.docContent[lastUnit.nextSlug] || '',
					notes: data.notesData[data.slug_doc]?.[lastUnit.nextSlug] || []
				});
			}}
			><span class="font-bold">{groupedUnits[groupedUnits.length - 1].nextSlugLabel}</span> laden</button
		>
	{/if}
</div>

<!-- Notes -->
<div
	class={[
		'containerNotes relative col-span-3 col-start-1 row-span-1 row-start-2 mt-0 transition-all duration-1000 lg:col-span-1 lg:col-start-4 lg:row-span-2 lg:row-start-1',
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
{#if multiMarkPopupSlugs.slugs.length > 0}
	<MultiMarkPopup
		{multiMarkPopupSlugs}
		{selectedNote}
		notesData={data.notesData}
		slug_doc={data.slug_doc}
		slug_unit={data.slug_unit}
	/>
{/if}

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
