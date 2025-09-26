import { setTranslateY } from './setTranslateY';
import { getInstantTranslateY } from './getInstantTranslateY';
import { getInstantOffsetTop } from './getInstantOffsetTop';

export function moveNote(id) {
	const elNoteBox = document.querySelector(`.notebox[data-id=${id}]`);
	
	// Move noteboxe to reference position (i.e. reset translateY)
	setTranslateY(elNoteBox, 0);

	// Detect Overlap and move other boxes up or down until there is no overlap
	let el = elNoteBox;
	let elPrev = elNoteBox?.previousElementSibling;
	let overlapTop = getInstantOffsetTop(elPrev, 'atbottom') - getInstantOffsetTop(el, 'attop');
	while (overlapTop > 0 && elPrev) {
		setTranslateY(elPrev, getInstantTranslateY(elPrev) - overlapTop); // move up
		el = elPrev;
		elPrev = el.previousElementSibling;
		overlapTop = getInstantOffsetTop(elPrev, 'atbottom') - getInstantOffsetTop(el, 'attop');
	}

	el = elNoteBox;
	let elNext = elNoteBox?.nextElementSibling;
	let overlapBottom = getInstantOffsetTop(el, 'atbottom') - getInstantOffsetTop(elNext, 'attop');
	while (overlapBottom > 0 && elNext) {
		setTranslateY(elNext, getInstantTranslateY(elNext) + overlapBottom); // move down
		el = elNext;
		elNext = el.nextElementSibling;
		overlapBottom = getInstantOffsetTop(el, 'atbottom') - getInstantOffsetTop(elNext, 'attop');
	}
}
