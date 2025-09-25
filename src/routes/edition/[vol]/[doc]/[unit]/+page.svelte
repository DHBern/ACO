<script lang="ts">
	import { goto } from '$app/navigation';
	import { base } from '$app/paths';
	import { onMount, tick } from 'svelte';
	import { copyWithoutLinebreaks } from '../../../globals.svelte.js';

	import LoadButton from './LoadButton.svelte';
	import Note from './Note.svelte';
	import Unit from './Unit.svelte';
	import MultiMarkPopup from './MultiMarkPopup.svelte';

	import { IsInViewport, ElementRect, ScrollState } from 'runed';

	import {
		extractNoteIds,
		generateMainText,
		generateLineNumbers,
		generatePageNumbers
	} from '$lib/functions/protoHTMLconversion';
	import { placeNotes } from '$lib/functions/floatingApparatus/placeNotes.js';

	let { data } = $props();

	let visibleUnits = $state([data.unit]);

	// reconstruct visibleUnits on change of data.unit
	$effect(() => {
		// Insert unit if it's not there yet
		if (visibleUnits.findIndex((u) => u.slug === data.unit.slug) === -1) {
			const nextUnit = visibleUnits.findIndex((u) => u.nextSlug === data.unit.slug);
			const prevUnit = visibleUnits.findIndex((u) => u.prevSlug === data.unit.slug);
			if (prevUnit !== -1 && nextUnit !== -1) {
				// both neighbors are there -> so unit itself should also be there
				return;
			} else if (nextUnit >= 0) {
				// insert the unit last
				visibleUnits.push(data.unit);
			} else if (prevUnit >= 0) {
				// insert the unit first
				visibleUnits.unshift(data.unit);
			} else {
				// no neighbors are present -> reset
				visibleUnits = [data.unit];
			}
		}
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

	// Scrolling to lines and units
	// $effect(() => {
	// 	const elLine = document.querySelector(`[data-line="${data.line}"]`);
	// 	if (elLine) {
	// 		elLine.scrollIntoView({ behavior: 'smooth', block: 'start' });
	// 	}
	// });
	// $effect(() => {
	// 	const elLine = document.querySelector(`[data-unit="${data.slug_unit}"]`);
	// 	if (elLine) {
	// 		elLine.scrollIntoView({ behavior: 'smooth', block: 'start' });
	// 	}
	// });

	const handleAddPrevUnit = async () => {
		const oldHeight = rectMainText.height;
		await goto(`${base}/edition/${data.slug_vol}/${data.slug_doc}/${visibleUnits[0].prevSlug}`, {
			noScroll: true,
			keepFocus: true,
			replaceState: true
		});
		await tick();
		const newHeight =
			document.querySelector('.containerText')?.getBoundingClientRect().height || oldHeight;
		scrollState.scrollTo(scrollState.x, newHeight - oldHeight);
		// Re-place position of all notes
		visibleUnits.forEach((unit) => {
			placeNotes(extractNoteIds(unit.text));
		});
	};

	const handleAddNextUnit = async () => {
		await goto(
			`${base}/edition/${data.slug_vol}/${data.slug_doc}/${visibleUnits[visibleUnits.length - 1].nextSlug}`,
			{
				noScroll: true,
				keepFocus: true,
				replaceState: true
			}
		);
	};

	// inViewportObservers for LoadButtons
	let targetNodePrev = $state<HTMLElement>()!;
	let targetNodeNext = $state<HTMLElement>()!;
	let inViewportPrev = new IsInViewport(() => targetNodePrev);
	let inViewportNext = new IsInViewport(() => targetNodeNext);

	$effect.pre(() => {
		inViewportPrev.current; // track changes for effect
		inViewportNext.current; // track changes for effect
		tick().then(() => {
			if (inViewportNext.current) {
				handleAddNextUnit();
			} else if (inViewportPrev.current) {
				handleAddPrevUnit();
			}
		});
	});

	// scrollObservers container
	let container = $state<HTMLElement>();
	const scrollState = new ScrollState({ element: () => container });

	// rectObserver main text
	let mainTextContainer = $state<HTMLElement>();
	const rectMainText = new ElementRect(() => mainTextContainer);

	onMount(() => {
		// Event Listeners
		document.body.addEventListener('click', handleResetMultiMark);
		// Clean-up
		return () => {
			document.body.removeEventListener('click', handleResetMultiMark);
		};
	});
</script>

<div
	bind:this={container}
	class="h-[calc(100vh*0.8)] w-full overflow-x-scroll bg-[var(--aco-gray-2)] p-10 pb-24"
>
	<div class="grid h-full grid-rows-[1fr_auto_1fr]">
		<!-- Load Button -->
		<LoadButton
			isDisabled={visibleUnits[0].prevSlug ? false : true}
			bind:node={targetNodePrev}
			type="prev"
			{data}
			{visibleUnits}
			clickHandler={handleAddPrevUnit}
			classes="row-span-1 row-start-1"
		/>

		<!-- Units -->
		<div
			class="row-span-1 row-start-2 grid grid-cols-[90px_60px_1fr] gap-6 lg:grid-cols-[100px_50px_auto_1fr]"
		>
			<!-- Page Numbers -->
			<div class="containerPageNums col-span-1 col-start-1">
				{#each visibleUnits as unit (unit.slug)}
					{@html generatePageNumbers(unit.text)}
				{/each}
			</div>

			<!-- Line Numbers -->
			<div class="containerLineNums col-span-1 col-start-2">
				{#each visibleUnits as unit (unit.slug)}
					{@html generateLineNumbers(unit.text)}
				{/each}
			</div>

			<!-- Main Text -->
			<div
				bind:this={mainTextContainer}
				class={[
					'containerText maintext relative col-span-1 col-start-3',
					copyWithoutLinebreaks.value && 'copyWithoutLinebreaks'
				]}
			>
				{#each visibleUnits as unit (unit.slug)}
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
				{#each visibleUnits as unit (unit.slug)}
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
		<LoadButton
			isDisabled={visibleUnits[visibleUnits.length - 1].nextSlug ? false : true}
			bind:node={targetNodeNext}
			type="next"
			{data}
			{visibleUnits}
			clickHandler={handleAddNextUnit}
			classes="row-span-1 row-start-3"
		/>
	</div>
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
