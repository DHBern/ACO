import { setTranslateY } from './setTranslateY';
import { getInstantTranslateY } from './getInstantTranslateY';
import { getInstantOffsetTop } from './getInstantOffsetTop';
import { ID_CONTAINER_TEXT } from './constants';

export function moveNote(id) {
	const elNoteRef = document.querySelector(`note_start[note_id=${id}]`);
	const elNoteBox = document.querySelector(`.notebox[note_id=${id}]`);
	const elContainerText = document.querySelector(`#${ID_CONTAINER_TEXT}`);
	const elContainer = document.querySelector('#scrollContainer');

	// Move entire column (via marginTop)
	// const elContainerNotes = document.querySelector('#containerNotes');
	// elContainerNotes.style.marginTop = `${offset}px`;

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

	// Scroll to note
	elContainer.scrollTo({
		// Important: offsetTop is measured relative to the next *positioned* parent!
		top: elContainerText.offsetTop + elNoteRef.offsetTop - window.innerHeight * 0.3,
		behavior: 'smooth'
	});
}
