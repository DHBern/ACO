import { tick } from 'svelte';

export function showMultiMarkPopup(ids, multiMarkPopupStore, elMark) {
	// Feed ids to state, which will trigger popup-component
	multiMarkPopupStore.slugs = ids;
	multiMarkPopupStore.target = elMark;
	multiMarkPopupStore.slugUnitTarget = elMark.closest('[data-unit]').dataset.unit;

	// Make sure that popup exists
	tick().then(() => {
		const elPopup = document.querySelector('.multimark-popup');
		// (updateFunctionFloatingPopover(elMark, elPopup)) // not needed
	});
}
