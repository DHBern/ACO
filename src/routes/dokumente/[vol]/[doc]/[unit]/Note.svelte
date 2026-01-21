<script lang="ts">
	import { MARGIN_NOTEBOX } from '$lib/constants/constants';
	import { handleNoteClick } from '$lib/functions/floatingApparatus';
	import { createNoteReferenceString } from '$lib/functions/protoHTMLconversion/createNoteReferenceString';
	import { annotVisible } from '../../../globals.svelte';
	type NoteType = 'floating' | 'bottom';

	let {
		docSlug,
		unitSlug,
		noteSlug,
		noteData,
		selectedNote = $bindable(),
		noteType
	}: {
		docSlug?: string;
		unitSlug?: string;
		noteSlug?: string;
		noteData?: any;
		selectedNote?: any;
		noteType?: NoteType;
	} = $props();
	// let { docSlug, unitSlug, noteSlug, noteData, selectedNote = $bindable(), noteType } = $props();
	const unit = unitSlug; // copy to prevent it from updating with URL

</script>

<div
	data-id={noteSlug}
	class={[
		!annotVisible.value && 'hidden',
		`notebox word-wrap bg-surface-50-950 border-surface-100-900 absolute
		max-w-[700px] border-4 transition-transform duration-500`,
		selectedNote.slug === noteSlug && 'highlighted'
	]}
	style={`margin-top:${MARGIN_NOTEBOX}px; margin-bottom:${MARGIN_NOTEBOX}px`}
	onclick={() => {
		if (noteType === 'floating') {
			handleNoteClick(noteSlug);
			selectedNote.slug = noteSlug;
		}
	}}
	onkeydown={(e) =>
		noteType === 'floating' && (e.key === 'Enter' || e.key === ' ')
			? handleNoteClick(noteSlug)
			: null}
	role="button"
	tabindex="0"
	aria-pressed={selectedNote.slug === noteSlug}
	aria-label="Focus note"
>
	<div
		class="bg-primary-50/20 dark:bg-primary-600 in-[&.highlighted]:bg-secondary-200/20 dark:in-[&.highlighted]:bg-secondary-700"
	>
		<div class="note-header p-1">
			<span class="font-bold">{@html unit !== 'text' ? `${unit} | ` : ''}</span>
			{@html createNoteReferenceString(
				noteData.line_start,
				noteData.line_end,
				noteData.refstring_text,
				noteData.text_start,
				noteData.text_end
			)}
		</div>
		<div
			class={[
				'bg-primary-400/10 dark:bg-primary-800 h-full w-full px-2 py-1 **:pt-2',
				' in-[&.highlighted]:border-primary-400-600 in-[&.highlighted]:bg-secondary-200 dark:in-[&.highlighted]:bg-secondary-500 ',
				'**:[&_a]:text-secondary-600-400'
			]}
		>
		<!-- //! Ad-hoc replace some of the content -->
			<p>{@html noteData.note_content.replace('∙','·')}</p>
		</div>
	</div>
</div>
