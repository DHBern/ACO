import { tick } from 'svelte';

export function showMultiMarkPopup(ids, multiMarkPopupSlugs, elMark) {
	// Feed ids to state, which will trigger popup-component
	multiMarkPopupSlugs.slugs = ids;
	multiMarkPopupSlugs.target = elMark;

	// Make sure that popup exists
	tick().then(() => {
		const elPopup = document.querySelector('.multimark-popup');
		// (updateFunctionFloatingPopover(elMark, elPopup)) // not needed
	});
}
