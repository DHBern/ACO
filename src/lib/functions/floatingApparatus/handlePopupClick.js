import { selectMark } from './selectMark';
import { moveNote } from './moveNote';

export function handlePopupClick(id, selectedNote, multiMarkPopupSlugs) {
	selectMark(id);
	moveNote(id);
	multiMarkPopupSlugs.slugs = [];
	selectedNote.slug = id;
}
