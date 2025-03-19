<script>
	import { MARGIN_NOTEBOX } from '$lib/constants/constants';
	import { handleNoteClick } from '$lib/functions/floatingApparatus';
	let { note, selectedNote } = $props();
</script>

<div
	data-id={note.id}
	class={[
		`notebox word-wrap absolute max-w-[700px] rounded-md border-4 bg-white transition-transform  
		duration-500 dark:bg-[var(--aco-teal-light)] dark:bg-slate-400`,
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
	<div
		class="h-full w-full bg-[var(--aco-teal-light)]/10 p-3 **:pt-4 **:text-gray-200 **:[&_a]:text-[var(--aco-link)] in-[&.highlighted]:border-[var(--aco-teal-light)] in-[&.highlighted]:bg-[var(--aco-teal-light)]"
	>
		{@html note.content}
	</div>
</div>

<style>
	@reference "tailwindcss";
</style>
