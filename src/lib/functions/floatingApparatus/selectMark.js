import { unselectMarks } from './unselectMarks';

export function selectMark(id) {
	// Remove old highlights
	unselectMarks();
	const elSpan = document.querySelectorAll(`span[data-type=mark][data-ids*=${id}]`);
	elSpan.forEach((el) => {
		el.classList.add('highlighted');
	});
}
