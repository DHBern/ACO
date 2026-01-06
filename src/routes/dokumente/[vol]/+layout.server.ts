export const prerender = true;

import { metaDocs } from '$lib/data/aco-meta-docs.json';
import type { LayoutServerLoad } from './$types';

import { linkifyFootnoteSuperscripts } from '$lib/functions/protoHTMLconversion/linkifyFootnoteSuperscripts';
import { transformFootnotesIntroduction } from '$lib/functions/protoHTMLconversion/transformFootnotesIntroduction';

const litData = metaDocs.Literaturverzeichnis.text;
const abbData = metaDocs.Abkürzungsverzeichnis.text;
const prefData = metaDocs.Vorwort;
const introData = metaDocs.Einleitung;

// Modify protoHTML
const preface = prefData;
const intro = {
    text: linkifyFootnoteSuperscripts(introData.text),
    footnotes: transformFootnotesIntroduction(introData.footnotes)
};

export const load: LayoutServerLoad = async () => {
    return { intro, preface, abbData, litData };
};
