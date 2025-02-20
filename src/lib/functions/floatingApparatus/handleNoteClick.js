import { selectMark } from './selectMark';
import { moveNote } from './moveNote';

export function handleNoteClick(id) {
	selectMark(id);
	moveNote(id);
}
