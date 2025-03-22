import { unselectMarks } from './unselectMarks';

export function resetMarkSelection(selectedNote, multiMarkPopupStore) {
	multiMarkPopupStore.slugs = [];
	selectedNote.slug = '';
	unselectMarks();
}