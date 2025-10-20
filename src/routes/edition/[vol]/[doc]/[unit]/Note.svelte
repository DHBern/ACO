<script>
	import { MARGIN_NOTEBOX } from '$lib/constants/constants';
	import { handleNoteClick } from '$lib/functions/floatingApparatus';
	import { createNoteReferenceString } from '$lib/functions/protoHTMLconversion/createNoteReferenceString';

	let { noteSlug, noteMetadata, selectedNote = $bindable() } = $props();
</script>

<div
	data-id={noteSlug}
	class={[
		`notebox word-wrap bg-surface-50-950 absolute max-w-[700px]
		border-4 transition-transform duration-500`,
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
	<div class="note-header p-1">
		{@html createNoteReferenceString(
			noteMetadata.line_start,
			noteMetadata.line_end,
			noteMetadata.text_start,
			noteMetadata.text_end
		)}
	</div>
	<div
		class="bg-primary-400-600/10 in-[&.highlighted]:border-primary-400-600 in-[&.highlighted]:bg-secondary-200-800/40 **:[&_a]:text-primary-200-800 h-full w-full p-3 **:pt-4"
	>
		<p>{@html noteMetadata.note_content}</p>
	</div>
</div>

<style>
	@reference "tailwindcss";
</style>
