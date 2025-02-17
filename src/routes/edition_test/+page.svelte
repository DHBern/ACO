<script>
	// import { SlideToggle } from '@skeletonlabs/skeleton';
	import { Switch } from '@skeletonlabs/skeleton-svelte';
	import { onMount } from 'svelte';
	import TextWithNotes from './TextWithNotes.svelte';
	import Comments from './Comments.svelte';
	// import { acoText, acoNotes } from '$lib/data/content';

	/** @type {{data: import('./$types').PageData}} */
	let { data } = $props();

	let head = $derived(data.head);
	let title = $derived(data.title);
	let units = $derived(data.units);
	let notes = $derived(data.notes);

	const MARGIN_NOTEBOX = 10; // in px
	let selectedNote = $state('');
	let popupNoteIds = $state([]);
	let copyWithoutLinebreaks = $state(false);

	// Measuring Offsets and Overlaps
	// Note: .offsetTop and .style.top are measured relative to the next *positioned* parent. So make sure that this is the parent column.
	// Note: .offsetTop contains a snapshot and is unreliable, when using css-transitions on the .top property! To work around this, instead use transform.translateY() and restrict the css-transition to the transform property.
	function setTranslateY(el, value) {
		if (!el) return;
		el.style.transform = `translateY(${value}px)`;
		el.setAttribute('instantTranslateY', value);
	}
	function getInstantTranslateY(el) {
		if (!el) return null;
		return Number(el?.getAttribute('instantTranslateY')) || 0;
	}

	function getInstantOffsetTopAtTop(el) {
		if (!el) return null;
		return el.offsetTop + getInstantTranslateY(el);
	}
	function getInstantOffsetTopAtBottom(el) {
		if (!el) return null;
		return getInstantOffsetTopAtTop(el) + el.offsetHeight + 2 * MARGIN_NOTEBOX;
	}

	function getOffsetTopAtTop(el) {
		if (!el) return null;
		return el.offsetTop || 0;
	}
	function getOffsetTopAtBottom(el) {
		if (!el) return null;
		return getOffsetTopAtTop(el) + el?.offsetHeight + 2 * MARGIN_NOTEBOX;
	}

	function generateMainText(text) {
		// Transform lib-number
		// text = text.replace(/<a\ lib='(I+)'><\/a>/g, (match, libNumber) => {
		// 	return `<a class="lib-number" lib="${libNumber}">Buch ${libNumber}</a>`;
		// });

		// Remove line numbers
		return text.replace(/<a[^>]*[line|page]="[^"]*"[^>]*><\/a>/g, '').trim();
	}

	function extractNotes(text) {
		// Match noteIds
		let matchingNotes = [];
		let match;

		const regex = /<note_start\s+note_id='([^']*)'><\/note_start>/g;
		while ((match = regex.exec(text)) !== null) {
			// This is necessary to avoid infinite loops with zero-width matches
			if (match.index === regex.lastIndex) {
				regex.lastIndex++;
			}
			// Return note content
			matchingNotes.push({ id: match[1], content: notes[match[1]]?.note_content });
		}
		return matchingNotes;
	}

	function generateLineNumbers(text) {
		// Match a-line, p and br tags
		const matches = text.match(/(<a\ line='\d+'><\/a>)|(<\/?p>)|(<br\s*\/?>)/g);
		const linesText = matches ? matches.join('') : '';

		// Insert line-number as text at every 5th line
		const numbersText = linesText.replace(/<a line='(\d+)'><\/a>/g, (match, lineNumber) => {
			return `<a class="line-number" href="${lineNumber}" line="${lineNumber}">${!(lineNumber % 5) ? lineNumber : "<span class='buffer'>___</span>"}</a>`;
			// return `<a class="line-number ${lineNumber % 5 ? 'line-number-hidden' : ''}" href="${lineNumber}" line="${lineNumber}">${lineNumber}<span class='buffer'>___</span></a>`;
		});

		return numbersText;
	}
	function generatePageNumbers(text) {
		// Match a-page, p and br tags
		const matches = text.match(/(<a\ page='\d+'><\/a>)|(<br\s*\/?>)/g);
		const pageText = matches ? matches.join('') : '';

		// Insert page-number as text and add class
		const numbersText = pageText.replace(/<a page='(\d+)'><\/a>/g, (match, pageNumber) => {
			return `<a class="page-number" page="${pageNumber}">Seite ${pageNumber}</a>`;
		});
		return numbersText;
	}

	function handleMarkClick(ev) {
		if (!ev.target.hasAttribute('note_id')) return;

		// accepted `note_id`s:
		// - 1: string,
		// - 2: stringified array of strings

		let ids = [];
		try {
			ids = JSON.parse(ev.target.getAttribute('note_id'));
		} catch (error) {
			ids = [ev.target.getAttribute('note_id')];
		}

		switch (ids.length) {
			case 0:
				return;
			case 1:
				changeSelectedNote(ids[0]);
				moveNote(ids[0]);
				break;
			default:
				popupNoteIds = ids;
		}
	}

	function handleNoteClick(id) {
		changeSelectedNote(id);
		moveNote(id);
		insertNoteSpan(mainTexts, id);
	}
	function handlePopupClick(id) {
		changeSelectedNote(id);
		moveNote(id);
		popupNoteIds = [];
	}

	function changeSelectedNote(id) {
		// Remove old highlights
		if (selectedNote) {
			const elNoteRefPrev = document.querySelector(`note_start[note_id=${selectedNote}]`);
			const elNoteEndPrev = document.querySelector(`note_end[note_id=${selectedNote}]`);
			elNoteRefPrev?.classList.remove('highlighted');
			elNoteEndPrev?.classList.remove('highlighted');
		}

		// Change highlight of notebox
		const elNoteRefNew = document.querySelector(`note_start[note_id=${id}]`);
		const elNoteEndNew = document.querySelector(`note_end[note_id=${id}]`);
		elNoteRefNew?.classList.add('highlighted');
		elNoteEndNew?.classList.add('highlighted');

		// Mark note (with span)
		// -- step 1: Remove existing spans
		const spans = document.querySelectorAll(`span[type='note']`);
		spans.forEach((span) => {
			if (span) {
				while (span.firstChild) {
					span.parentNode.insertBefore(span.firstChild, span); // Move content out
				}
				span.remove(); // Remove the empty span
			}
		});

		// -- step 2: Insert new span
		const noteStart = document.querySelector(`note_start[note_id='${id}']`);
		const noteEnd = document.querySelector(`note_end[note_id='${id}']`);
		if (noteStart && noteEnd) {
			// Create the span wrapper
			const wrapper = document.createElement('span');
			wrapper.setAttribute('type', 'note');
			wrapper.setAttribute('note_id', id);

			// Get all content between note_start and note_end
			let currentNode = noteStart.nextSibling;

			while (currentNode && currentNode !== noteEnd) {
				let nextNode = currentNode.nextSibling; // Store next sibling before moving
				wrapper.appendChild(currentNode); // Move current node inside span
				currentNode = nextNode;
			}

			// Insert the wrapper after note_start
			noteStart.insertAdjacentElement('afterend', wrapper);
		}

		// Update state
		selectedNote = id;
	}

	function moveNote(id) {
		const elNoteRef = document.querySelector(`note_start[note_id=${id}]`);
		const elNoteBox = document.querySelector(`.notebox[note_id=${id}]`);
		const elContainerMainText = document.querySelector('#containerMainText');
		const elContainer = document.querySelector('#scrollContainer');

		// Move entire column (via marginTop)
		// const elContainerNotes = document.querySelector('#containerNotes');
		// elContainerNotes.style.marginTop = `${offset}px`;

		// Move noteboxe to reference position (i.e. reset translateY)
		setTranslateY(elNoteBox, 0);

		// Detect Overlap and move other boxes up or down until there is no overlap
		let el = elNoteBox;
		let elPrev = elNoteBox?.previousElementSibling;
		let overlapTop = getInstantOffsetTopAtBottom(elPrev) - getInstantOffsetTopAtTop(el);
		while (overlapTop > 0 && elPrev) {
			setTranslateY(elPrev, getInstantTranslateY(elPrev) - overlapTop); // move up
			el = elPrev;
			elPrev = el.previousElementSibling;
			overlapTop = getInstantOffsetTopAtBottom(elPrev) - getInstantOffsetTopAtTop(el);
			console.log(!elPrev, overlapTop);
		}

		el = elNoteBox;
		let elNext = elNoteBox?.nextElementSibling;
		let overlapBottom = getInstantOffsetTopAtBottom(el) - getInstantOffsetTopAtTop(elNext);
		while (overlapBottom > 0 && elNext) {
			setTranslateY(elNext, getInstantTranslateY(elNext) + overlapBottom); // move down
			el = elNext;
			elNext = el.nextElementSibling;
			overlapBottom = getInstantOffsetTopAtBottom(el) - getInstantOffsetTopAtTop(elNext);
			console.log(!elNext, overlapBottom);
		}

		// Scroll to note
		elContainer.scrollTo({
			// Important: offsetTop is measured relative to the next *positioned* parent!
			top: elContainerMainText.offsetTop + elNoteRef.offsetTop - window.innerHeight * 0.3,
			behavior: 'smooth'
		});
	}

	let mainTexts = $state(
		units.map((unit) => {
			return generateMainText(unit);
		})
	);
	onMount(() => {
		units.forEach((unit) => {
			// Generate main text

			// Position notes
			let offsetSum = 0;
			extractNotes(unit).forEach((note) => {
				const elNoteBox = document.querySelector(`.notebox[note_id=${note.id}]`);
				const elNoteRef = document.querySelector(`note_start[note_id=${note.id}]`);
				const offsetRef = elNoteRef?.offsetTop;

				// Move to reference height
				elNoteBox.style.top = `${offsetRef}px`;

				// Adjust visual height if overlap with previous notebox
				const elNoteBoxPrev = elNoteBox?.previousElementSibling;
				if (elNoteBoxPrev) {
					const overlapTop = getOffsetTopAtBottom(elNoteBoxPrev) - offsetRef; // overlap if positive
					offsetSum += Math.max(0, overlapTop);
					if (overlapTop > 0) {
						setTranslateY(elNoteBox, offsetSum);
					}
				}
			});
		});
	});
</script>

<div class="flex justify-center align-middle">
	<div class="flex justify-center align-middle">
		<Switch
			name="toggleCopyWithoutLinebreaks"
			active="bg-primary-500"
			bind:checked={copyWithoutLinebreaks}
			onCheckedChange={console.log}
		/>
		<p>Mit Zeilenumbrüchen kopieren</p>
	</div>
</div>

{#if popupNoteIds.length > 0}
	<div class="absolute bottom-0 top-0">
		<ul>
			{#each popupNotesIds as id}
				<li>
					<a
						onclick={(id) => {
							handlePopupClick(id);
						}}>{id}</a
					>
				</li>
			{/each}
		</ul>
	</div>
{/if}

<div
	id="scrollContainer"
	class="grid h-screen w-full grid-cols-[90px,750px,60px,600px] overflow-x-hidden overflow-y-scroll border border-r-black"
>
	<!-- Metadata -->
	<div
		id="containerMetadata"
		class="col-span-3 col-start-1 rounded-md border-2 border-black bg-slate-200 p-5"
	>
		<div class="head">{@html head}</div>
	</div>

	<!-- Title -->
	<div id="containerTitle" class="col-span-1 col-start-2">
		<div class="title">{@html title}</div>
	</div>

	<!-- Page Numbers -->
	<div id="containerPageNums" class="col-span-1 col-start-1">
		{#each units as unit}
			{@html generatePageNumbers(unit)}
		{/each}
	</div>

	<!-- Main Text -->
	<div
		id="containerMainText"
		class={['maintext relative col-span-1 col-start-2', { copyWithoutLinebreaks }]}
		onclick={(ev) => {
			// console.log(ev.target);
			handleMarkClick(ev);
		}}
	>
		{#each units as unit, idx}
			{@html mainTexts[idx]}
		{/each}
	</div>

	<!-- Line Numbers -->
	<div id="containerLineNums" class="col-span-1 col-start-3">
		{#each units as unit}
			{@html generateLineNumbers(unit)}
		{/each}
	</div>

	<!-- Notes -->
	<div
		id="containerNotes"
		class={[
			'relative col-span-1 col-start-4 mt-0 transition-all duration-1000',
			{ copyWithoutLinebreaks }
		]}
	>
		{#each units as unit}
			{@const notes = extractNotes(unit)}
			{#each notes as note}
				<div
					note_id={note.id}
					class={[
						`notebox absolute my-[${MARGIN_NOTEBOX}px] rounded-md border-2 p-3 transition-transform duration-500`,
						// `notebox absolute my-[${MARGIN_NOTEBOX}px] rounded-md border-2 p-3`,
						selectedNote === note.id && 'highlighted'
					]}
					onclick={() => {
						handleNoteClick(note.id);
					}}
				>
					{@html note.content}
				</div>
			{/each}
		{/each}
	</div>
</div>

<style>
	:global(.title) {
		margin-top: 50px;
		margin-bottom: 50px;
		:global(p) {
			font-weight: 700;
			text-align: center;
		}
	}

	:global(p) {
		padding-top: 15px;
	}

	:global(.maintext p) {
		white-space: nowrap;
	}

	:global(.maintext p span) {
		background-color: yellow;
		color: red;
	}
	:global(.lib-number) {
		text-align: center;
		font-weight: 600;
	}
	:global(a.line-number, a.page-number) {
		user-select: none;
		margin-right: 8px;
	}
	:global(a.line-number-hidden) {
		color: white;
		&:hover {
			color: grey;
		}
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
	:global(.buffer) {
		user-select: none;
		color: white;
	}
	/* Prevent selecting <br /> on copy-paste */
	:global(.copyWithoutLinebreaks br) {
		user-select: none;
	}

	:global(span[type='head_key']) {
		font-weight: 800;
		margin-right: 4px;
	}
	:global(note_start::before, note_end::before) {
		color: blue;
		margin-right: 1px;
		margin-left: 3px;
	}
	:global(note_start::before) {
		content: '[●';
	}
	:global(note_end::before) {
		content: '●]';
	}
	:global(note_start.highlighted::before, note_end.highlighted::before) {
		color: red;
	}
	:global(.notebox.highlighted) {
		border-color: orange;
	}
</style>
