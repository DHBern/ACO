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
	:global(span[data-type='head_key']) {
		font-weight: 800;
		margin-right: 4px;
	}
	:global(span[data-ids]) {
		background-color: rgb(255, 255, 221);
		cursor: pointer;

		&.multiple-ids {
			background-color: rgb(255, 255, 153);
		}
	}
	:global(span[data-type=mark].highlighted) {
		background-color: rgba(148, 255, 207, 0.491);
	}
	:global([data-type=note-start]::before, [data-type=note-end]::before) {
		color: blue;
		margin-right: 1px;
		margin-left: 3px;
	}
	:global([data-type=note-start]::before) {
		/* content: '[●'; */
	}
	:global([data-type=note-end]::before) {
		/* content: '●]'; */
	}
	:global([data-type=note-start].highlighted::before, [data-type=note-end].highlighted::before) {
		color: red;
	}

	:global(.multimark-popup a) {
		cursor: pointer;
	}
</style>
