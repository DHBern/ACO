export function setTranslateY(el, value) {
	if (!el) return; // safety guard
	el.style.transform = `translateY(${value}px)`;
	el.setAttribute('instantTranslateY', value);
}
