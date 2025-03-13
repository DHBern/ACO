export function unselectMarks() {
	const elSpan = document.querySelectorAll(`span[data-type=mark]`);
	elSpan.forEach((el) => {
		el.classList.remove('highlighted');
	});
}
