import { getOffsetTop } from './getOffsetTop';
import { setTranslateY } from './setTranslateY';

export function placeNotes(ids) {
	let offsetSum = 0;
	ids.forEach((id) => {
		const elNoteBox = document.querySelector(`.notebox[note_id=${id}]`);
		const elNoteRef = document.querySelector(`note_start[note_id=${id}]`);
		const offsetRef = elNoteRef?.offsetTop;

		// Move to reference height
		elNoteBox.style.top = `${offsetRef}px`;

		// Adjust visual height if overlap with previous notebox
		const elNoteBoxPrev = elNoteBox?.previousElementSibling;
		if (elNoteBoxPrev) {
			const overlapTop = getOffsetTop(elNoteBoxPrev, 'atbottom') - offsetRef; // overlap if positive
			offsetSum += Math.max(0, overlapTop);
			if (overlapTop > 0) {
				setTranslateY(elNoteBox, offsetSum);
			}
		}
	});
}
