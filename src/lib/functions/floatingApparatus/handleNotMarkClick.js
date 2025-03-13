import { unselectMarks } from './unselectMarks';

export function handleNotMarkClick(selectedNote, multiMarkPopupIds) {
	multiMarkPopupIds.ids = [];
	selectedNote.id = '';
	unselectMarks();
}