import { setTranslateY } from './setTranslateY';
import { getInstantTranslateY } from './getInstantTranslateY';
import { getInstantOffsetTop } from './getInstantOffsetTop';

export function moveNote(id) {
	// Determine DOMelement of moved box as well as moving direction
	const elNoteBox = document.querySelector(`.notebox[data-id=${id}]`);
	const direction = getInstantTranslateY(elNoteBox) > 0 ? 'up' : 'down';

	// Move noteboxe to reference position (i.e. reset translateY)
	setTranslateY(elNoteBox, 0);

	// Push and suck other notes
	if (direction === 'up') {
		let el = elNoteBox;
		let elPrev = elNoteBox?.previousElementSibling;
		let overlapTop = getInstantOffsetTop(elPrev, 'atbottom') - getInstantOffsetTop(el, 'attop');

		// Push as many of the prev notes up until there is no overlap
		while (overlapTop > 0 && elPrev) {
			setTranslateY(elPrev, getInstantTranslateY(elPrev) - overlapTop); // move up
			el = elPrev;
			elPrev = el.previousElementSibling;
			overlapTop = getInstantOffsetTop(elPrev, 'atbottom') - getInstantOffsetTop(el, 'attop');
		}

		// Suck next notes up -- if possible up to their reference position
		el = elNoteBox;
		let elNext = elNoteBox?.nextElementSibling;
		while (elNext) {
			setTranslateY(elNext, 0); // set to reference position
			let overlap = getInstantOffsetTop(el, 'atbottom') - getInstantOffsetTop(elNext, 'attop');
			setTranslateY(elNext, Math.max(overlap, 0)); // correct overshoot
			el = elNext;
			elNext = el.nextElementSibling;
		}
	} else if (direction === 'down') {
		let el = elNoteBox;
		let elNext = elNoteBox?.nextElementSibling;
		let overlapBottom = getInstantOffsetTop(el, 'atbottom') - getInstantOffsetTop(elNext, 'attop');

		// Push as many of the next notes down until there is no overlap
		while (overlapBottom > 0 && elNext) {
			setTranslateY(elNext, getInstantTranslateY(elNext) + overlapBottom); // move down
			el = elNext;
			elNext = el.nextElementSibling;
			overlapBottom = getInstantOffsetTop(el, 'atbottom') - getInstantOffsetTop(elNext, 'attop');
		}

		// Suck prev notes down -- if possible down to their reference position
		el = elNoteBox;
		let elPrev = elNoteBox?.previousElementSibling;
		while (elPrev) {
			setTranslateY(elPrev, 0); // set to reference position
			let overlap = getInstantOffsetTop(elPrev, 'atbottom') - getInstantOffsetTop(el, 'attop');
			setTranslateY(elPrev, -Math.max(overlap, 0)); // correct overshoot
			el = elPrev;
			elPrev = el.previousElementSibling;
		}
	}
}
