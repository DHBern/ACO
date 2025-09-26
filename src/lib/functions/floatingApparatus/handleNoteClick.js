import { selectMark } from './selectMark';
import { moveNote } from './moveNote';
import { scrollToNoteRef } from './scrollToNoteRef';

export function handleNoteClick(id) {
	selectMark(id);
	moveNote(id);
	scrollToNoteRef(id);
}
