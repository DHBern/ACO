import { selectMark } from './selectMark';
import { moveNote } from './moveNote';
import { showMultiMarkPopup } from './showMultiMarkPopup';

export function handleMarkClick(ev, selectedNote, multiMarkPopupIds) {
	let ids = [];
	try {
		//!FIX
		ids = JSON.parse(ev.currentTarget.dataset.ids);
	} catch (error) {
		ids = [ev.currentTarget.dataset.ids];
	}

	switch (ids.length) {
		case 0:
			return;
		case 1:
			selectMark(ids[0]);
			moveNote(ids[0]);
			selectedNote.slug = ids[0];
			break;
		default:
			showMultiMarkPopup(ids, multiMarkPopupIds, ev.target);
	}
}
