<script>
	import { MARGIN_NOTEBOX } from '$lib/constants/constants';
	import { handleNoteClick } from '$lib/functions/floatingApparatus';
	import { createNoteReferenceString } from '$lib/functions/protoHTMLconversion/createNoteReferenceString';

	let { noteSlug, noteMetadata, selectedNote } = $props();
</script>

<div
	data-id={noteSlug}
	class={[
		`notebox word-wrap absolute max-w-[700px] border-4 transition-transform  
		duration-500 bg-[var(--aco-gray-1)] dark:bg-[var(--aco-teal)]`,
		selectedNote.slug === noteSlug && 'highlighted'
	]}
	style={`margin-top:${MARGIN_NOTEBOX}px; margin-bottom:${MARGIN_NOTEBOX}px`}
	onclick={() => {
		handleNoteClick(noteSlug);
		selectedNote.slug = noteSlug;
	}}
	onkeydown={(e) => (e.key === 'Enter' || e.key === ' ' ? handleNoteClick(noteSlug) : null)}
	role="button"
	tabindex="0"
	aria-pressed={selectedNote.slug === noteSlug}
	aria-label="Focus note"
>
	<div class="note-header p-1">{@html createNoteReferenceString(noteMetadata.line_start, noteMetadata.line_end, noteMetadata.text_start, noteMetadata.text_end)}</div>
	<div
		class="h-full w-full bg-[var(--aco-teal-light)]/10 p-3 **:pt-4 **:[&_a]:text-[var(--aco-link)] in-[&.highlighted]:border-[var(--aco-teal-light)] in-[&.highlighted]:bg-[var(--aco-orange-light)]/40">
		<p>{@html noteMetadata.note_content}</p>
	</div>
</div>

<style>
	@reference "tailwindcss";

</style>
