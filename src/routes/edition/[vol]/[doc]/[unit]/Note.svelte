<script>
	import { MARGIN_NOTEBOX } from '$lib/constants/constants';
	import { handleNoteClick } from '$lib/functions/floatingApparatus';
	import { createNoteReferenceString } from '$lib/functions/protoHTMLconversion/createNoteReferenceString';

	let { noteSlug, noteData, selectedNote = $bindable() } = $props();
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
	<div class="bg-primary-50-950/20 in-[&.highlighted]:bg-error-200-800/20">
		<div class="note-header p-1">
			{@html createNoteReferenceString(
				noteData.line_start,
				noteData.line_end,
				noteData.text_start,
				noteData.text_end
			)}
		</div>
		<div
			class={[
				'bg-primary-400-600/10 h-full w-full px-2 py-1 **:pt-2',
				' in-[&.highlighted]:border-primary-400-600 in-[&.highlighted]:bg-error-200-800 ',
				'**:[&_a]:text-secondary-600-400'
			]}
		>
			<p>{@html noteData.note_content}</p>
		</div>
	</div>
</div>
