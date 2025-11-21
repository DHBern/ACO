import { setTranslateY } from './setTranslateY';
import { getInstantTranslateY } from './getInstantTranslateY';
import { getInstantOffsetTop } from './getInstantOffsetTop';

export function placeNotes(ids) {

	const elNoteBoxFirst = document.querySelector(`.notebox[data-id=${ids[0]}]`) as HTMLElement;
	const elNoteBoxLast = document.querySelector(
		`.notebox[data-id=${ids[ids.length - 1]}]`
	) as HTMLElement;

	// Decide on order of placing notes depending on where they are inserted
	let insertAboveExistingNotes = elNoteBoxLast.nextElementSibling ? true : false;
	let insertBelowExistingNotes = elNoteBoxFirst.previousElementSibling ? true : false;
	if (!(insertAboveExistingNotes || insertBelowExistingNotes)) {
		insertBelowExistingNotes = true;
	}
	const orderedIds = insertAboveExistingNotes ? ids.reverse() : ids;

	// Place notes
	orderedIds.forEach((id) => {
		const elNoteBox = document.querySelector(`.notebox[data-id=${id}]`) as HTMLElement;
		const elNoteRef = document.querySelector(
			`[data-type=note-start][data-id=${id}]`
		) as HTMLElement;
		const offsetRef = elNoteRef?.offsetTop;

		// Move to reference height
		if (elNoteBox) {
			elNoteBox.style.top = `${offsetRef}px`;
		}

		// Detect sibling notes
		const el = document.querySelector(`.notebox[data-id=${id}]`);
		const elPrev = el?.previousElementSibling;
		const elNext = el?.nextElementSibling;

		// Detect overlaps
		const overlapTop = elPrev
			? getInstantOffsetTop(elPrev, 'atbottom') - getInstantOffsetTop(el, 'attop')
			: null;
		const overlapBottom = elNext
			? getInstantOffsetTop(el, 'atbottom') - getInstantOffsetTop(elNext, 'attop')
			: null;

		// Move down if overlap with previous sibling note
		if (insertBelowExistingNotes && overlapTop > 0) {
			// console.log('TOP', id, overlapTop);
			setTranslateY(el, getInstantTranslateY(el) + overlapTop); // move down
		}

		// Move up if overlap with next sibling note
		if (insertAboveExistingNotes && overlapBottom > 0) {
			console.log('BOTTOM', id, getInstantTranslateY(el), overlapBottom, getInstantOffsetTop(el, 'atbottom'), getInstantOffsetTop(elNext, 'attop'));
			setTranslateY(el, getInstantTranslateY(el) - overlapBottom); // move up
		}
	});
}
