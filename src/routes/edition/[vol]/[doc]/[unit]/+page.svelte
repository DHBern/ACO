<script lang="ts">
	import { goto } from '$app/navigation';
	import { base } from '$app/paths';
	import { onMount, tick } from 'svelte';
	import { copyWithoutLinebreaks } from '../../../globals.svelte.js';

	import LoadButton from './LoadButton.svelte';
	import Note from './Note.svelte';
	import Unit from './Unit.svelte';
	import MultiMarkPopup from './MultiMarkPopup.svelte';

	import { IsInViewport, ElementRect, ScrollState, useIntersectionObserver } from 'runed';

	import {
		extractNoteIds,
		generateMainText,
		generateLineNumbers,
		generatePageNumbers
	} from '$lib/functions/protoHTMLconversion';
	import { placeNotes } from '$lib/functions/floatingApparatus/placeNotes.js';

	let { data } = $props();

	// Runed ScrollState for Container of Content
	let containerContent = $state<HTMLElement>();
	const scrollState = new ScrollState({ element: () => containerContent });

	// Runed ElementRect for Main Text
	let mainTextContainer = $state<HTMLElement>();
	const rectMainText = new ElementRect(() => mainTextContainer);

	// Runed inViewportObservers for LoadButtons
	let elPrevButton = $state<HTMLElement>()!;
	let elNextButton = $state<HTMLElement>()!;
	let inViewportPrev = new IsInViewport(() => elPrevButton);
	let inViewportNext = new IsInViewport(() => elNextButton);

	// --- Collect Loaded Units in Array ---------------------------

	// Contains all visible (=loaded) units, starting with current unit
	let visibleUnits = $state([{ ...data.unit, element: undefined }]);

	// Add unit to the end or beginning of the array when data.unit changes
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
				visibleUnits.push({ ...data.unit, element: undefined });
			} else if (prevUnit >= 0) {
				// insert the unit first
				visibleUnits.unshift({ ...data.unit, element: undefined });
			} else {
				// no neighbors are present -> reset
				visibleUnits = [{ ...data.unit, element: undefined }];
			}
		}
	});

	// --- Handle Loading new Units ---------------------------

	// handlers that take care of...
	// - navigation via goto (changing URL will update data.unit)
	// - update scroll position
	// - re-position all notes

	const handleAddPrevUnit = async () => {
		if (!visibleUnits[0].prevSlug) return;
		const oldHeight = rectMainText.height;
		await goto(`${base}/edition/${data.slug_vol}/${data.slug_doc}/${visibleUnits[0].prevSlug}`, {
			noScroll: true,
			keepFocus: true,
			replaceState: true
		});
		await tick();

		// Update scrollposition to where user was before new unit was loaded
		const newHeight =
			document.querySelector('.containerText')?.getBoundingClientRect().height || oldHeight;
		scrollState.scrollTo(scrollState.x, newHeight - oldHeight);

		// Re-position of all notes
		visibleUnits.forEach((unit) => {
			placeNotes(extractNoteIds(unit.text));
		});
	};

	const handleAddNextUnit = async () => {
		if (!visibleUnits[visibleUnits.length - 1].nextSlug) return;
		await goto(
			`${base}/edition/${data.slug_vol}/${data.slug_doc}/${visibleUnits[visibleUnits.length - 1].nextSlug}`,
			{
				noScroll: true,
				keepFocus: true,
				replaceState: true
			}
		);
	};

	// --- Trigger Unit-Load when loadButton gets into view ---------------------------

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

	// --- Update URL on scroll within already loaded units ---------------------------

	useIntersectionObserver(
		() => visibleUnits.map((u) => u.element).filter((el) => el !== undefined) as HTMLElement[],
		(entries) => {
			const entry = entries[0];
			if (!entry || !entry.isIntersecting) return;
			goto(
				`${base}/edition/${data.slug_vol}/${data.slug_doc}/${(entry.target as HTMLElement).dataset.unit}`,
				{
					replaceState: true,
					noScroll: true,
					keepFocus: true
				}
			);
		},
		{ root: () => containerContent, rootMargin: '-15% 0px -15% 0px' }
	);

	// --- Handle Selecting Notes ---------------------------

	let selectedNote = $state({ slug: '' });
	let multiMarkPopupStore = $state({ slugs: [], target: undefined, slugUnitTarget: undefined });

	function handleResetMultiMark(ev: Event) {
		const target = ev.target as Element | null;
		if (
			!target?.classList.contains('multimark-popup') &&
			!(multiMarkPopupStore.slugs.length > 0 && target?.classList.contains('multiple-ids'))
		) {
			multiMarkPopupStore.slugs = [];
		}
	}

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
	bind:this={containerContent}
	class="containerContent h-[calc(100vh*0.8)] w-full overflow-x-scroll bg-[var(--aco-gray-2)] p-10 pb-24"
>
	<div class="grid h-full grid-rows-[1fr_auto_1fr]">
		<!-- Load Button -->
		<LoadButton
			isDisabled={visibleUnits[0].prevSlug ? false : true}
			bind:node={elPrevButton}
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
						bind:el={unit.element}
						slug={unit.slug}
						text={generateMainText(unit.text)}
						unitLabelInline={unit.labelInline}
						bind:selectedNote
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
					{#each extractNoteIds(unit.text) as noteSlug (noteSlug)}
						<Note {noteSlug} noteMetadata={unit.notes[noteSlug]} bind:selectedNote></Note>
					{/each}
				{/each}
			</div>

			<!-- Popups for multiple notes over same place -->
			{#if multiMarkPopupStore.slugs.length > 0}
				<MultiMarkPopup
					{multiMarkPopupStore}
					bind:selectedNote
					notesData={data.notesData}
					slug_doc={data.slug_doc}
				/>
			{/if}
		</div>

		<!-- Load Button -->
		<LoadButton
			isDisabled={visibleUnits[visibleUnits.length - 1].nextSlug ? false : true}
			bind:node={elNextButton}
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
