export const prerender = false;

import { metaDocs } from '$lib/data/aco-meta-docs.json';
import type { LayoutLoad } from '../$types';

import { linkifyFootnoteSuperscripts } from '$lib/functions/protoHTMLconversion/linkifyFootnoteSuperscripts';
import { transformFootnotesIntroduction } from '$lib/functions/protoHTMLconversion/transformFootnotesIntroduction';

const litData = metaDocs.Literaturverzeichnis.text;
const abbData = metaDocs.Abkürzungsverzeichnis.text;
const introData = metaDocs.Einleitung;
const prefData = metaDocs.Vorwort;

// Modify protoHTML
const preface = prefData;
const intro = {
	text: linkifyFootnoteSuperscripts(introData.text),
	footnotes: transformFootnotesIntroduction(introData.footnotes)
};

export const load: LayoutLoad = async ({ params }) => {
	return { vol: params.vol, intro, preface, abbData, litData };
};
