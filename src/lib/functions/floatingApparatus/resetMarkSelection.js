import { unselectMarks } from './unselectMarks';

export function resetMarkSelection(selectedNote, multiMarkPopupIds) {
	multiMarkPopupIds.ids = [];
	selectedNote.id = '';
	unselectMarks();
}