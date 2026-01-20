export const prerender = true;

import { metaDocs } from '$lib/data/aco-meta-docs.json';

import { linkifyFootnoteSuperscripts } from '$lib/functions/protoHTMLconversion/linkifyFootnoteSuperscripts';
import { transformFootnotesIntroduction } from '$lib/functions/protoHTMLconversion/transformFootnotesIntroduction';
import type { PageServerLoad } from './$types';

const introData = metaDocs.Einleitung;

// Modify protoHTML
const intro = {
    text: linkifyFootnoteSuperscripts(introData.text),
    footnotes: transformFootnotesIntroduction(introData.footnotes)
};

export const load: PageServerLoad = async () => {
    return { intro };
};
