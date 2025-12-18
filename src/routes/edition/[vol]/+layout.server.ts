export const prerender = true;

import { metaDocs as mDocs } from '$lib/data/aco-meta-docs.json';
import type { LayoutServerLoad } from './$types';

import { linkifyFootnoteSuperscripts } from '$lib/functions/protoHTMLconversion/linkifyFootnoteSuperscripts';
import { transformFootnotesIntroduction } from '$lib/functions/protoHTMLconversion/transformFootnotesIntroduction';

const metaDocs = await mDocs;
const litData = metaDocs.Literaturverzeichnis.text;
const abbData = metaDocs.Abkürzungsverzeichnis.text;
const intro = metaDocs.Einleitung;
const preface = metaDocs.Vorwort;

// Modify protoHTML
intro.text = linkifyFootnoteSuperscripts(intro.text);
intro.footnotes = transformFootnotesIntroduction(intro.footnotes);

export const load: LayoutServerLoad = async ({ url, params }) => {
	return {vol : params.vol, intro, preface, abbData, litData };
};
