import { unselectMarks } from './unselectMarks';

export function resetMarkSelection(selectedNote, multiMarkPopupSlugs) {
	multiMarkPopupSlugs.slugs = [];
	selectedNote.slug = '';
	unselectMarks();
}