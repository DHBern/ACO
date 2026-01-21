import { JSDOM } from 'jsdom';
import { base } from '$app/paths';

export function transformAnchors(html, refDocument = null) {
	// Wrap in a container to preserve fragment structure
	const dom = new JSDOM(`<div id="__ta_container__">${html}</div>`);
	const doc = dom.window.document;
	const container = doc.getElementById('__ta_container__');

	// Update <a> elements
	container.querySelectorAll('a').forEach((a) => {
		if (!refDocument || a.getAttribute('document') !== refDocument){
			if (!a.hasAttribute('target')) a.setAttribute('target', '_blank');
			if (!a.hasAttribute('rel')) a.setAttribute('rel', 'noopener noreferrer');
		}
		const orig = a.getAttribute('href');
		if (orig && orig.startsWith('/')) {
			a.setAttribute('href', base + orig);
		}
	});

	return container.innerHTML;
}
