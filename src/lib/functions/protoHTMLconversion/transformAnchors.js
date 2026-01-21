import { JSDOM } from 'jsdom';
import { base } from '$app/paths';

export function transformAnchors(html, refDocument = null) {
	// Wrap in a container to preserve fragment structure
	const dom = new JSDOM(`<div id="__ta_container__">${html}</div>`);
	const doc = dom.window.document;
	const container = doc.getElementById('__ta_container__');

	// Update <a> elements
	container.querySelectorAll('a').forEach((a) => {
		// prevent event propagation
		a.setAttribute('onclick', 'event.stopPropagation();');

		// open documents to *other* documents in new tab
		if (!refDocument || a.getAttribute('document') !== refDocument) {
			if (!a.hasAttribute('rel')) a.setAttribute('rel', 'noopener noreferrer');
			if (!a.hasAttribute('target')) a.setAttribute('target', '_blank');
		}

		// add base path to href
		const orig = a.getAttribute('href');
		if (orig && orig.startsWith('/')) {
			a.setAttribute('href', base + orig);
		}
	});

	return container.innerHTML;
}
