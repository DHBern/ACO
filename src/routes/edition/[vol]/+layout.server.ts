export const prerender = true;

import { metaDocs as mDocs } from '$lib/data/aco-meta-docs.json';
import type { LayoutServerLoad } from './$types';

import {
	linkifyFootnoteSuperscripts,
	transformFootnotesIntroduction
} from '$lib/functions/protoHTMLconversion';

const metaDocs = await mDocs;
const litData = metaDocs.Literaturverzeichnis.text;
const abbData = metaDocs.Abkürzungsverzeichnis.text;
const intro = metaDocs.Einleitung;
const preface = metaDocs.Vorwort;

// Modify protoHTML
intro.text = linkifyFootnoteSuperscripts(intro.text);
intro.foot = transformFootnotesIntroduction(intro.footnotes); // renaming prevents confusion with HMR

export const load: LayoutServerLoad = async () => {
	return {
		intro,
		preface,
		abbData,
		litData
	};
};
