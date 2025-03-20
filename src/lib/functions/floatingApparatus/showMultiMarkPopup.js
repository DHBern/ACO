import { tick } from 'svelte';
import { computePosition, shift, flip, offset } from '@floating-ui/dom';

export function showMultiMarkPopup(ids, multiMarkPopupIds, elMark) {
	// Feed ids to state, which will trigger popup-component
	multiMarkPopupIds.ids = ids;
	multiMarkPopupIds.target = elMark;

	// Make sure that popup exists
	tick().then(() => {
		const elPopup = document.querySelector('.multimark-popup');

		computePosition(elMark, elPopup, {
			placement: 'top',
			middleware: [offset(5), flip(), shift()],
			strategy: 'absolute'
		}).then(({ x, y }) => {
			elPopup.style.top = `${y}px`;
			elPopup.style.left = `${x}px`;
			elPopup.style.display = 'block';
		});
	});
}
