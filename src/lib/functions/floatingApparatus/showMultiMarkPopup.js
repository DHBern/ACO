import { tick } from 'svelte';

export function showMultiMarkPopup(ids, multiMarkPopupIds, elMark) {
	// Feed ids to state, which will trigger popup-component
	multiMarkPopupIds.ids = ids;
	multiMarkPopupIds.target = elMark;

	// Make sure that popup exists
	tick().then(() => {
		const elPopup = document.querySelector('.multimark-popup');
		// (updateFunctionFloatingPopover(elMark, elPopup)) // not needed
	});
}
