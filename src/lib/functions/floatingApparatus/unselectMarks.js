export function unselectMarks() {
	const elSpan = document.querySelectorAll(`span.mark`);
	elSpan.forEach((el) => {
		el.classList.remove('highlighted');
	});
}
