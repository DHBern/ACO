import { ID_CONTAINER_TEXT, OFFSET_POPUP } from './constants';

export function showMultiMarkPopup(ids, multiMarkPopupIds, elMark) {
	// Feed ids to state, which will trigger popup-component
	multiMarkPopupIds.ids = ids;

	// Wait some time to make sure that popup exists
	setTimeout(() => {
		const elPopup = document.querySelector('.multimark-popup');
		const elContainer = document.querySelector(`#${ID_CONTAINER_TEXT}`);
		const rectMark = elMark.getBoundingClientRect();
		const rectContainer = elContainer.getBoundingClientRect();

		//! Replace this with propper Skeleton Popover Component
		elPopup.style.display = 'none';
		elPopup.style.top = `${rectMark.top - rectContainer.top + window.scrollY + OFFSET_POPUP}px`;
		elPopup.style.left = `${rectMark.left + window.scrollX}px`;
		elPopup.style.display = 'block';
	}, 100);
}
