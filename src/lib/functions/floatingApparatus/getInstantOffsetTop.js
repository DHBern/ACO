import { getInstantTranslateY } from './getInstantTranslateY';

export function getInstantOffsetTop(el, edge) {
	if (!el) return null; // safety guard
	switch (edge) {
		case 'attop':
			return el.offsetTop + getInstantTranslateY(el) || 0;
		case 'atbottom':
			const computedStyles = window.getComputedStyle(el);
			return (
				el.offsetTop +
					getInstantTranslateY(el) +
					el?.offsetHeight +
					parseFloat(computedStyles.marginTop) +
					parseFloat(computedStyles.marginBottom) || 0
			);
		default:
			return null;
	}
}
