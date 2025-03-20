import { OFFSET_POPUP } from './constants';
import { tick } from 'svelte';

export function showMultiMarkPopup(ids, multiMarkPopupIds, elMark) {
	// Feed ids to state, which will trigger popup-component
	multiMarkPopupIds.ids = ids;

	// Make sure that popup exists
	tick().then(() => {
		const elPopup = document.querySelector('.multimark-popup');
		const elContainer = document.querySelector(`.containerText`);
		const rectMark = elMark.getBoundingClientRect();
		const rectContainer = elContainer.getBoundingClientRect();

		//! Replace this with propper Skeleton Popover Component
		elPopup.style.display = 'none';
		elPopup.style.top = `${rectMark.top - rectContainer.top + OFFSET_POPUP}px`;
		elPopup.style.left = `${rectMark.left + window.scrollX}px`;
		elPopup.style.display = 'block';
	});
}
