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

	let { data } = $props();

	let myUnits = $state(data.myUnits);

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
	// Load next and prev data
	async function loadMore(myUnits, direction: 'next' | 'prev') {
		const endNode = direction === 'next' ? myUnits[myUnits.length - 1] : myUnits[0];
		const slug = direction === 'next' ? endNode.nextSlug : endNode.prevSlug;
		const idx = data.docMetadata.slugs.indexOf(slug);
		if (idx === -1 || !slug) return myUnits; // nothing to load
		const item = {
			slug,
			prevSlug: idx > 0 ? data.docMetadata.slugs[idx - 1] : null,
			nextSlug: idx < data.docMetadata.slugs.length - 1 ? data.docMetadata.slugs[idx + 1] : null,
			prevLabel: idx > 0 ? data.docMetadata.labels[idx - 1] : null,
			nextLabel: idx < data.docMetadata.labels.length - 1 ? data.docMetadata.labels[idx + 1] : null,
			text: data.unitText || '',
			notes: data.unitNotes || []
		};
		// const heightOld = rect.height;
		if (direction === 'next') myUnits.push(item);
		else myUnits.unshift(item);
		return myUnits;
	}

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

	const handlePrevUnit = () => {
		const oldHeight = rectMainText.height;
		goto(`${base}/edition/${data.slug_vol}/${data.slug_doc}/${myUnits[0].prevSlug}`, {
			noScroll: true,
			keepFocus: true,
			replaceState: true
		}).then(() => {
			loadMore(myUnits, 'prev').then((value) => {
				myUnits = value;
				tick().then(() => {
					//@Sebi: I tried with `rectMainText.height`, but the DOM was not ready yet, so I have to use getBoundingClientRect() to force a repaint.
					// const newHeight = rectMainText.height;
					const newHeight =
						document.querySelector('.containerText')?.getBoundingClientRect().height || oldHeight;
					scrollState.scrollTo(scrollState.x, newHeight - oldHeight);
				});
			});
		});
	};

	const handleNextUnit = async () => {
		goto(
			`${base}/edition/${data.slug_vol}/${data.slug_doc}/${myUnits[myUnits.length - 1].nextSlug}`,
			{
				noScroll: true,
				keepFocus: true,
				replaceState: true
			}
		).then(() => {
			scrollState.scrollToBottom();
			loadMore(myUnits, 'next').then((value) => {
				myUnits = value;
			});
		});
	};

	// inViewportObservers for LoadButtons
	let targetNodePrev = $state<HTMLElement>()!;
	let targetNodeNext = $state<HTMLElement>()!;
	let inViewportPrev = new IsInViewport(() => targetNodePrev);
	let inViewportNext = new IsInViewport(() => targetNodeNext);

	let isLoadingNext = $state(false);
	let initialRun = $state(true);

	// Edge-case 1: There is this edge case where both buttons are visible at the same time for short texts.
	// 				Now, the way inViewportPrev/inViewportNext are implemented,
	// 				they change from false to true, even if the DOM-element is intersecting from the very beginning.
	// 				As a consequence both $effects run at the same time.
	// 				DANGER: Synchronous loading in both directions, however will lead to WRONG texts inserted!
	//
	// Workaround: 	To avoid this, we...
	// 				(1) make sure NEXT goes first (by stopping PREV if next-button is visible),
	// 				(2) block PREV while NEXT runs
	// 				--> due to the situation described above, this must happen *outsid* the tick().then() to be fast enough
	//  	   			for the PREV-effect not to catch up. This is, why there is this hack with `initialRun` that makes sure the guard
	// 					 (a) is in place soon enough
	//					 (b) can be removed after the initial run
	//
	// Edge-case 2: If the texts are so short that also after the first NEXT-load both buttons are still visible,
	// 				theninViewportPrev/Next remain unchanged and nothing will happen. In this case one has to click the buttons until
	// 				there is enough text to scroll the buttons out of visibility.

	$effect(() => {
		inViewportPrev.current; // track changes for effect
		tick().then(() => {
			if (inViewportPrev.current && !inViewportNext.current && !isLoadingNext) {
				handlePrevUnit();
			}
		});
	});

	$effect(() => {
		inViewportNext.current; // track changes for effect
		tick().then(() => {
			isLoadingNext = initialRun ? true : false; //! hack 2-a for edge-case 1 (see above)
			if (inViewportNext.current) {
				isLoadingNext = true;
				handleNextUnit().then(() => {
					isLoadingNext = false;
					initialRun = false;
				});
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
			isDisabled={myUnits[0].prevSlug ? false : true}
			bind:node={targetNodePrev}
			type="prev"
			{data}
			{myUnits}
			clickHandler={handlePrevUnit}
			classes="row-span-1 row-start-1"
		/>

		<!-- Units -->
		<div
			class="row-span-1 row-start-2 grid grid-cols-[90px_60px_1fr] gap-6 lg:grid-cols-[100px_50px_auto_1fr]"
		>
			<!-- Page Numbers -->
			<div class="containerPageNums col-span-1 col-start-1">
				{#each myUnits as unit (unit.slug)}
					{@html generatePageNumbers(unit.text)}
				{/each}
			</div>

			<!-- Line Numbers -->
			<div class="containerLineNums col-span-1 col-start-2">
				{#each myUnits as unit (unit.slug)}
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
				{#each myUnits as unit (unit.slug)}
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
				{#each myUnits as unit (unit.slug)}
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
			isDisabled={myUnits[myUnits.length - 1].nextSlug ? false : true}
			bind:node={targetNodeNext}
			type="next"
			{data}
			{myUnits}
			clickHandler={handleNextUnit}
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
