import { getOffsetTop } from './getOffsetTop';
import { setTranslateY } from './setTranslateY';
import { moveNote } from './moveNote';

export function placeNotes(ids) {
	let offsetSum = 0;
	ids.forEach((id) => {
		const elNoteBox = document.querySelector(`.notebox[data-id=${id}]`) as HTMLElement;
		const elNoteRef = document.querySelector(`[data-type=note-start][data-id=${id}]`) as HTMLElement;
		const offsetRef = elNoteRef?.offsetTop;

		// Move to reference height
		if (elNoteBox) {
			elNoteBox.style.top = `${offsetRef}px`;
		}

		// Adjust visual height if overlap with previous notebox
		// const elNoteBoxPrev = elNoteBox?.previousElementSibling;
		// if (elNoteBoxPrev) {
		// 	const overlapTop = getOffsetTop(elNoteBoxPrev, 'atbottom') - offsetRef; // overlap if positive
		// 	offsetSum += Math.max(0, overlapTop);
		// 	if (overlapTop > 0) {
		// 		setTranslateY(elNoteBox, offsetSum);
		// 	}
		// }
	});

	ids.reverse().forEach((id) => {
		moveNote(id);
	});
}
