import { selectMark } from './selectMark';
import { unselectMarks } from './unselectMarks';
import { moveNote } from './moveNote';
import { showMultiMarkPopup } from './showMultiMarkPopup';

export function handleMarkClick(ev, selectedNote, multiMarkPopupIds) {
	// no mark clicked
	if (!ev.target.classList.contains('mark')) {
		multiMarkPopupIds.ids = [];
		selectedNote.id = '';
		unselectMarks();
		return;
	}

	let ids = [];
	try {
		//!FIX
		ids = JSON.parse(ev.target.dataset.ids);
	} catch (error) {
		ids = [ev.target.dataset.ids];
	}

	switch (ids.length) {
		case 0:
			return;
		case 1:
			selectMark(ids[0]);
			moveNote(ids[0]);
			selectedNote.id = ids[0];
			break;
		default:
			showMultiMarkPopup(ids, multiMarkPopupIds, ev.target);
	}
}
