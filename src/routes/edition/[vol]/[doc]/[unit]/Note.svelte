<script>
	import { MARGIN_NOTEBOX } from '$lib/constants/constants';
	import { handleNoteClick } from '$lib/functions/floatingApparatus';
	let { note, selectedNote } = $props();
</script>

<div
	data-id={note.id}
	class={[
		`notebox word-wrap absolute max-w-[700px] rounded-md border-4 bg-white p-3 
		[&.highlighted]:border-green-400 [&.highlighted]:bg-green-200 
		transition-transform duration-500`,
		selectedNote.id === note.id && 'highlighted'
	]}
	style={`margin-top:${MARGIN_NOTEBOX}px; margin-bottom:${MARGIN_NOTEBOX}px`}
	onclick={() => {
		handleNoteClick(note.id);
		selectedNote.id = note.id;
	}}
	onkeydown={(e) => (e.key === 'Enter' || e.key === ' ' ? handleNoteClick(note.id) : null)}
	role="button"
	tabindex="0"
	aria-pressed={selectedNote.id === note.id}
	aria-label="Focus note"
>
	{@html note.content}
</div>

<style>
	@reference "tailwindcss";

	.notebox {
		:global(p) {
			@apply pt-4 text-gray-600;
		}
		:global(a) {
			@apply text-blue-700;
		}
	}
</style>
