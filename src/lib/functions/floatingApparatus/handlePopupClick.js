import { selectMark } from './selectMark';
import { moveNote } from './moveNote';

export function handlePopupClick(id, selectedNote, multiMarkPopupIds) {
	selectMark(id);
	moveNote(id);
	multiMarkPopupIds.ids = [];
	selectedNote.slug = id;
}
