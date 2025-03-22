import { selectMark } from './selectMark';
import { moveNote } from './moveNote';

export function handlePopupClick(id, selectedNote, multiMarkPopupStore) {
	selectMark(id);
	moveNote(id);
	multiMarkPopupStore.slugs = [];
	selectedNote.slug = id;
}
