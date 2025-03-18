<script>
	import { handleMarkClick, handleNotMarkClick } from '$lib/functions/floatingApparatus';

	let { text, selectedNote, multiMarkPopupIds } = $props();

	function handleTextClick(ev) {
		if (selectedNote.id && !ev.target.closest('[data-type="mark"]')) {
			handleNotMarkClick(selectedNote, multiMarkPopupIds)
		}
	}
	
	function handleMarkerClick(ev) {
		handleMarkClick(ev, selectedNote, multiMarkPopupIds)
	}

	function handleMarkerKeyDown(ev) {
		ev.key === 'Enter' || ev.key === ' '
		? handleMarkClick(ev, selectedNote, multiMarkPopupIds)
		: null
	}

	function addSpanHandlers(node) {
		// the node has been mounted in the DOM

		$effect(() => {
			node.addEventListener("click", handleTextClick)
			node.querySelectorAll(`span`).forEach(n => n.addEventListener("click",handleMarkerClick))
			node.querySelectorAll(`span`).forEach(n => n.addEventListener("keydown",handleMarkerKeyDown))
			return () => {
				node.addEventListener("click", handleTextClick)
				node.querySelectorAll(`span`).forEach(n => n.removeEventListener("click", handleMarkerClick))
				node.querySelectorAll(`span`).forEach(n => n.removeEventListener("keydown", handleMarkerKeyDown))
			};
		});
	};
</script>


<!-- 'whitespace-nowrap' instead of 'truncate' would make text overflow -->
<div class="truncate" use:addSpanHandlers>
	{@html text}
</div>

<style>
	@reference "tailwindcss"

	:global(span[data-type='head_key']) {
		@apply weight-bold mr-1;
	}
	:global(span[data-ids]) {
		@apply cursor-pointer bg-[#ffffdd] [&.multiple-ids]:bg-[#ffff99];
	}
	:global(span[data-type=mark].highlighted) {
		@apply bg-[#94ffcf7d];
	}
	:global([data-type=note-start]::before, [data-type=note-end]::before) {
		@apply text-blue-600 mr-[1px] ml-[3px];
	}
	:global([data-type=note-start]::before) {
		/* @apply content-["[●"]; */
	}
	:global([data-type=note-end]::before) {
		/* @apply content-["●]"]; */
	}
	:global([data-type=note-start].highlighted::before, [data-type=note-end].highlighted::before) {
		@apply text-red-500;
	}
	:global(.multimark-popup a) {
		@apply cursor-pointer;
	}
</style>
