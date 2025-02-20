<script>
	import { MARGIN_NOTEBOX } from '$lib/constants/constants';
	import { handleNoteClick } from '$lib/functions/floatingApparatus';
	let { note, selectedNote } = $props();
</script>

<!-- svelte-ignore a11y_click_events_have_key_events -->
<!-- svelte-ignore a11y_no_static_element_interactions -->
<div
	note_id={note.id}
	class={[
		`notebox word-wrap absolute max-w-[700px] rounded-md border-4 bg-white p-3 transition-transform duration-500`,
		selectedNote.id === note.id && 'highlighted'
	]}
	style={`margin-top:${MARGIN_NOTEBOX}px; margin-bottom:${MARGIN_NOTEBOX}px`}
	onclick={() => {
		handleNoteClick(note.id);
		selectedNote.id = note.id;
	}}
>
	{@html note.content}
</div>

<style>
	.notebox.highlighted {
		border-color: #94ffcf;
		background-color: #e0fff1;
	}
	:global(.notebox p) {
		padding-top: 15px;
	}
	:global(.notebox a) {
		color: blue;
	}
</style>
