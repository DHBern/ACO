<script>
	import {
		handleMarkClick,
		resetMarkSelection,
		placeNotes
	} from '$lib/functions/floatingApparatus';
	import { extractNoteIds } from '$lib/functions/protoHTMLconversion/extractNoteIds.js';
	import { onMount } from 'svelte';
	import { marksVisible } from '../../../globals.svelte.js';

	let {
		slug,
		text,
		unitLabelInline,
		selectedNote,
		multiMarkPopupStore,
		el = $bindable()
	} = $props();

	function handleResetMarkSelection(ev) {
		if (
			selectedNote.slug &&
			!ev.target.closest('[data-type="mark"]') &&
			!ev.target.closest('.multimark-popup') &&
			!ev.target.closest('.notebox')
		) {
			resetMarkSelection(selectedNote, multiMarkPopupStore);
		}
	}

	function handleMarkerClick(ev) {
		handleMarkClick(ev, selectedNote, multiMarkPopupStore);
	}

	function handleMarkerKeyDown(ev) {
		ev.key === 'Enter' || ev.key === ' '
			? handleMarkClick(ev, selectedNote, multiMarkPopupStore)
			: null;
	}

	onMount(() => {
		// Place note-boxes at initial positions
		placeNotes(extractNoteIds(text));

		//! Move to +page.svelte?!
		document.body.addEventListener('click', handleResetMarkSelection);

		return () => {
			document.body.removeEventListener('click', handleResetMarkSelection);
		};
	});

	function addSpanHandlers(node) {
		node.querySelectorAll(`span`).forEach((n) => n.addEventListener('click', handleMarkerClick));
		node
			.querySelectorAll(`span`)
			.forEach((n) => n.addEventListener('keydown', handleMarkerKeyDown));
		return () => {
			node
				.querySelectorAll(`span`)
				.forEach((n) => n.removeEventListener('click', handleMarkerClick));
			node
				.querySelectorAll(`span`)
				.forEach((n) => n.removeEventListener('keydown', handleMarkerKeyDown));
		};
	}
</script>

<!-- 'whitespace-nowrap' instead of 'truncate' would make text overflow -->
<div
	class={['truncate', marksVisible.value && 'marksVisible']}
	data-unit={slug}
	use:addSpanHandlers
	bind:this={el}
>
	{unitLabelInline}
	{@html text}
</div>
