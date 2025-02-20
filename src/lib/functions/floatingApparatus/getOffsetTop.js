export function getOffsetTop(el, edge) {
	if (!el) return null; // safety guard
	switch (edge) {
		case 'attop':
			return el.offsetTop || 0;
		case 'atbottom':
			const computedStyles = window.getComputedStyle(el);
			return (
				el.offsetTop +
					el?.offsetHeight +
					parseFloat(computedStyles.marginTop) +
					parseFloat(computedStyles.marginBottom) || 0
			);
	}
}
