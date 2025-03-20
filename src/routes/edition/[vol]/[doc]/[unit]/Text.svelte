<script>
	import { handleMarkClick, handleNotMarkClick } from '$lib/functions/floatingApparatus';
		
	let { data, text, selectedNote, multiMarkPopupIds } = $props();

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

	$effect(()=>{
		console.log('newline', data.line)
		const elLine = document.querySelector(`[line="${data.line}"]`);
		if (elLine) {
			elLine.scrollIntoView({ behavior: 'smooth', block: 'start' });
		}
	})

</script>


<!-- 'whitespace-nowrap' instead of 'truncate' would make text overflow -->
<div class="truncate" use:addSpanHandlers>
	{@html text}
</div>
