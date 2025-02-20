import { unselectMarks } from './unselectMarks';

export function selectMark(id) {
	// Remove old highlights
	unselectMarks();
	const elSpan = document.querySelectorAll(`span.mark[note_ids*=${id}]`);
	elSpan.forEach((el) => {
		el.classList.add('highlighted');
	});
}
