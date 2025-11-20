export const prerender = true;

import { metaDocs as mDocs } from '$lib/data/aco-meta-docs.json';
import type { LayoutServerLoad } from './$types';

import { transformAnchorsNewTab } from '$lib/functions/protoHTMLconversion';

const metaDocs = await mDocs;
const litData = metaDocs.Literaturverzeichnis.text;
const abbData = metaDocs.Abkürzungsverzeichnis.text;
const intro = metaDocs.Einleitung;
const preface = metaDocs.Vorwort;

export const load: LayoutServerLoad = async () => {
	// Modify anchors in introduction
	intro.text = transformAnchorsNewTab(intro.text);

	return {
		intro,
		preface,
		abbData,
		litData
	};
};
