<script lang="ts">
	import { goto } from '$app/navigation';
	import { page } from '$app/state';
	import { base } from '$app/paths';
	import { onMount, tick } from 'svelte';
	import { copyWithoutLinebreaks } from '../../../globals.svelte.js';

	import { useSearchParams } from 'runed/kit';
	import { z } from 'zod';

	import LoadButton from './LoadButton.svelte';
	import Note from './Note.svelte';
	import TextUnit from './TextUnit.svelte';
	import MultiMarkPopup from './MultiMarkPopup.svelte';

	import { IsInViewport, ElementRect, ScrollState, useIntersectionObserver } from 'runed';

	import { placeNotes } from '$lib/functions/floatingApparatus';
	import {
		extractNoteIds,
		generateMainText,
		generateLineNumbers,
		generatePageNumbers
	} from '$lib/functions/protoHTMLconversion';

	let { data } = $props();

	let finishedInitScroll = $state(false);
	let finishedInitLoading = $state(false);
	let elContainerContent = $state<HTMLElement>();

	let visibleUnits = $state([]);

	// --- Handle search params ---------------------------

	// Get boundaries of data-line and data-page
	function getCurrentMinMaxAttribute(html, minmax: 'min' | 'max', attr = '') {
		if (!html) return 0;
		const re = new RegExp(`data-${attr}=['"]?(\\d+)['"]?`, 'g');
		let match;
		if (minmax === 'max') {
			let max = 0;
			while ((match = re.exec(html)) !== null) {
				const v = Number(match[1]);
				if (v > max) max = v;
			}
			return max;
		} else if (minmax === 'min') {
			let min = 1e9;
			while ((match = re.exec(html)) !== null) {
				const v = Number(match[1]);
				if (v < min) min = v;
			}
			return min;
		}
	}
	const maxLine = getCurrentMinMaxAttribute(data.unitText, 'max', 'line'); // runtime number
	const maxPage = getCurrentMinMaxAttribute(data.unitText, 'max', 'page'); // runtime number
	const minPage = getCurrentMinMaxAttribute(data.unitText, 'min', 'page'); // runtime number

	// Runed useSearchParams
	const params = useSearchParams(
		z.object({
			line: z.coerce
				.number()
				.int()
				.default(1)
				// clamp between 1 and maxLine
				.transform((n) => {
					// guard NaN from z.coerce; default to 1
					const v = Number.isFinite(n) ? n : 1;
					return Math.min(Math.max(v, 1), maxLine);
				}),
			page: z.coerce
				.number()
				.int()
				.default(1)
				// clamp between 1 and maxPage
				.transform((n) => {
					// guard NaN from z.coerce; default to 1
					const v = Number.isFinite(n) ? n : 1;
					return Math.min(Math.max(v, minPage), maxPage);
				})
		})
	);

	// --- Collect Loaded Units in Array ---------------------------

	// Contains all loaded units, starting with current unit
	let loadedUnits = $state([{ ...data.unit, element: undefined }]);

	// Add unit to the end or beginning of the array when data.unit changes
	$effect(() => {
		// Insert unit if it's not there yet
		if (loadedUnits.findIndex((u) => u.slug === data.unit.slug) === -1) {
			const nextUnit = loadedUnits.findIndex((u) => u.nextSlug === data.unit.slug);
			const prevUnit = loadedUnits.findIndex((u) => u.prevSlug === data.unit.slug);
			if (prevUnit !== -1 && nextUnit !== -1) {
				// both neighbors are there -> so unit itself should also be there
				return;
			} else if (nextUnit >= 0) {
				// insert the unit last
				loadedUnits.push({ ...data.unit, element: undefined });
			} else if (prevUnit >= 0) {
				// insert the unit first
				loadedUnits.unshift({ ...data.unit, element: undefined });
			} else {
				// no neighbors are present -> reset
				loadedUnits = [{ ...data.unit, element: undefined }];
			}
		}
	});

	// --- Handle Loading new Units ---------------------------
	// Runed ElementRect for Main Text
	let mainTextContainer = $state<HTMLElement>();
	const rectMainText = new ElementRect(() => mainTextContainer);

	// Handlers
	// --> They take care of...
	// 		- navigation via goto (changing URL will update data.unit)
	// 		- update scroll position
	// 		- re-position all notes

	const handleAddPrevUnit = async () => {
		if (!loadedUnits[0].prevSlug) return;
		const oldHeight = rectMainText.height;
		await goto(`${base}/edition/${data.slug_vol}/${data.slug_doc}/${loadedUnits[0].prevSlug}`, {
			noScroll: true,
			keepFocus: true,
			replaceState: true
		});
		await tick();

		// Update scrollposition to where user was before new unit was loaded
		const newHeight =
			document.querySelector('.containerText')?.getBoundingClientRect().height || oldHeight;
		elContainerContent.scrollTo({ top: newHeight - oldHeight, behavior: 'instant' });

		// Re-position of all notes
		loadedUnits.forEach((unit) => {
			placeNotes(extractNoteIds(unit.text).filter((slug) => slug !== 'TODO'));
		});
	};

	const handleAddNextUnit = async () => {
		if (!loadedUnits[loadedUnits.length - 1].nextSlug) return;
		await goto(
			`${base}/edition/${data.slug_vol}/${data.slug_doc}/${loadedUnits[loadedUnits.length - 1].nextSlug}`,
			{
				noScroll: true,
				keepFocus: true,
				replaceState: true
			}
		);
	};

	// --- Trigger Unit-Load when loadButton gets into view ---------------------------

	// Runed inViewportObservers for LoadButtons
	let elPrevButton = $state<HTMLElement>()!;
	let elNextButton = $state<HTMLElement>()!;
	let inViewportPrev = new IsInViewport(() => elPrevButton);
	let inViewportNext = new IsInViewport(() => elNextButton);

	// Navigate to oldURL
	async function restoreURL_and_rerunloadMore(oldURL: string) {
		await goto(oldURL, {
			replaceState: true,
			noScroll: true,
			keepFocus: true
		});

		// Load again
		// (if loaded text was very short, button may still be visible)
		loadMore(oldURL);
	}

	async function loadMore(oldURL: string | undefined = undefined) {
		// if-if (instead of if-elseif) is important since
		// 	(1) both buttons can be visible
		//  (2) inViewportNext can stay get stuck 'true' after scrolling to the bottom, which leads to button element being destroyed.
		if (inViewportNext.current) {
			await handleAddNextUnit();
			if (oldURL) {
				await restoreURL_and_rerunloadMore(oldURL);
			}
		}
		if (inViewportPrev.current) {
			await handleAddPrevUnit();
			if (oldURL) await restoreURL_and_rerunloadMore(oldURL);
		}
		if (!inViewportNext.current && !inViewportPrev.current) {
			finishedInitLoading = true;
		}
	}

	$effect.pre(() => {
		inViewportPrev.current; // track changes for effect
		inViewportNext.current; // track changes for effect
		tick().then(() => {
			if (finishedInitScroll && finishedInitLoading) {
				loadMore();
			}
		});
	});

	// --- Update URL on scroll within already loaded units ---------------------------

	useIntersectionObserver(
		() => loadedUnits.map((u) => u.element).filter((el) => el !== undefined) as HTMLElement[],
		async (entries) => {
			let newSlugUnit;
			entries.forEach((entry) => {
				const name = (entry.target as HTMLElement).dataset.unit;
				if (entry.isIntersecting && !visibleUnits.some((item) => item === name)) {
					// add name if its unit entered container and prevent double-entries (can happen on fast scroll)
					visibleUnits.push(name);
					newSlugUnit = name;
				} else if (!entry.isIntersecting) {
					// remove name when its unit left container
					visibleUnits = visibleUnits.filter((item) => item !== name);
					newSlugUnit = visibleUnits[visibleUnits.length - 1] || null;
				}
			});

			if (!newSlugUnit) return;
			if (!finishedInitScroll) return;
			goto(`${base}/edition/${data.slug_vol}/${data.slug_doc}/${newSlugUnit}`, {
				replaceState: true,
				noScroll: true,
				keepFocus: true
			});
		},
		{ root: () => elContainerContent, rootMargin: '-15% 0px -15% 0px' }
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

	// --- Handle Initial Scroll of window and content (depending on Search Params) ---------------------------

	// Runed ScrollState for Initial Scroll of Window
	const scrollStateInitWindow = new ScrollState({
		element: () => window,
		behavior: 'smooth',
		onStop: async () => {
			if (finishedInitScroll) return;
			const oldURL = `${page.url.pathname}${page.url.search}`;
			await loadMore(oldURL);
			await tick();
			finishedInitScroll = true;
		}
	});

	function initialScroll() {
		if (page.url.searchParams.get('line') || page.url.searchParams.get('page')) {
			// scroll window to document content
			scrollStateInitWindow.scrollTo(
				scrollStateInitWindow.x,
				(elContainerContent?.offsetTop || 11) - 10
			);

			// scroll content
			const elContainer = document.querySelector('.containerContent');
			if (page.url.searchParams.get('line')) {
				const elLine = document.querySelector(
					`[data-unit='${data.slug_unit}'] [data-line='${params.line}']`
				);
				// elLine.scrollIntoView({ behavior: 'smooth', block: 'start' });
				elContainer?.scrollTo({
					top: elLine?.offsetTop - 900, //! Quickfix only for CV166. Must be changed!
					behavior: 'smooth'
				});
			} else if (page.url.searchParams.get('page')) {
				const elPage = document.querySelector(
					`[data-unit='${data.slug_unit}'] [data-page='${params.page}']`
				);
				// elPage.scrollIntoView({ behavior: 'smooth', block:'center'});
				elContainer?.scrollTo({
					top: elPage?.offsetTop - 900, //! Quickfix only for CV166. Must be changed!
					behavior: 'smooth'
				});
			}
		} else {
			finishedInitScroll = true;
			finishedInitLoading = true;
		}
	}

	onMount(() => {
		initialScroll();
	});
</script>

<svelte:body
	onclick={(ev) => {
		handleResetMultiMark(ev);
	}}
/>
<svelte:document
	onvisibilitychange={() => {
		// trigger initialScroll if tab that has been loaded in background gets visible
		if (!document.hidden && !finishedInitScroll) {
			initialScroll();
		}
	}}
/>

<div
	bind:this={elContainerContent}
	class="containerContent h-[calc(100vh*0.8)] w-full overflow-x-scroll bg-[var(--aco-gray-2)] p-10 pb-24"
>
	<div class="grid h-full grid-rows-[1fr_auto_1fr]">
		<!-- Load Button -->
		{#if loadedUnits[0].prevSlug}
			<LoadButton
				bind:node={elPrevButton}
				type="prev"
				{data}
				{loadedUnits}
				clickHandler={handleAddPrevUnit}
				classes="row-span-1 row-start-1"
			/>
		{/if}
		<!-- Units -->
		<div
			class="row-span-1 row-start-2 grid grid-cols-[70px_70px_1fr] gap-6 lg:grid-cols-[70px_70px_auto_1fr]"
		>
			<!-- Page Numbers -->
			<div class="containerPageNums col-span-1 col-start-1" data-sveltekit-noscroll>
				{#each loadedUnits as unit (unit.slug)}
					{@const path = `${base}/edition/${data.slug_vol}/${data.slug_doc}/${unit.slug}`}
					{@html generatePageNumbers(unit.text, path)}
				{/each}
			</div>

			<!-- Line Numbers -->
			<div class="containerLineNums col-span-1 col-start-2" data-sveltekit-noscroll>
				{#each loadedUnits as unit (unit.slug)}
					{@const path = `${base}/edition/${data.slug_vol}/${data.slug_doc}/${unit.slug}`}
					{@html generateLineNumbers(unit.text, path)}
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
				{#each loadedUnits as unit (unit.slug)}
					<TextUnit
						bind:el={unit.element}
						slug={unit.slug}
						text={generateMainText(unit.text)}
						unitlabel={unit.label}
						bind:selectedNote
						{multiMarkPopupStore}
					></TextUnit>
				{/each}
			</div>

			<!-- Notes -->
			<div
				class={[
					'containerNotes relative col-span-3 col-start-1 transition-all duration-1000 lg:col-span-1 lg:col-start-4 lg:row-span-2 lg:row-start-1',
					copyWithoutLinebreaks.value && 'copyWithoutLinebreaks'
				]}
			>
				{#each loadedUnits as unit (unit.slug)}
					{#each extractNoteIds(unit.text).filter((slug) => slug !== 'TODO') as noteSlug (noteSlug)}
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
		{#if loadedUnits[loadedUnits.length - 1].nextSlug}
			<LoadButton
				bind:node={elNextButton}
				type="next"
				{data}
				{loadedUnits}
				clickHandler={handleAddNextUnit}
				classes="row-span-1 row-start-3"
			/>
			<!-- Fake padding (since 'pb' on container did not work). 
			 This makes sure that any line that the container scrolls to will 
			 be displayed close to the top of the container, even if it is at the end
			 of the last visible unit. -->
			<!-- <div
				class="block"
				style={`height: ${elContainerContent?.clientHeight - 200 || 500}px;`}
			></div> -->
		{/if}
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
