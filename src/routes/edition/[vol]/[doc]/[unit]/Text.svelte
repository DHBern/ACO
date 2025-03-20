<script>
	import { handleMarkClick, resetMarkSelection } from '$lib/functions/floatingApparatus';
	import { onMount } from 'svelte';
	import { marksVisible } from '../../../globals.svelte.js';

	let { text, selectedNote, multiMarkPopupIds } = $props();

	function handleResetMarkSelection(ev) {
		if (
			selectedNote.id &&
			!ev.target.closest('[data-type="mark"]') &&
			!ev.target.closest('.notebox')
		) {
			console.log('foooo');
			resetMarkSelection(selectedNote, multiMarkPopupIds);
		}
	}

	function handleMarkerClick(ev) {
		handleMarkClick(ev, selectedNote, multiMarkPopupIds);
	}

	function handleMarkerKeyDown(ev) {
		ev.key === 'Enter' || ev.key === ' '
			? handleMarkClick(ev, selectedNote, multiMarkPopupIds)
			: null;
	}

	onMount(() => {
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
<div class={['truncate', marksVisible.value && 'marksVisible']} use:addSpanHandlers>
	{@html text}
</div>
