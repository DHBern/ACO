export const prerender = true;

import { metaDocs } from '$lib/data/aco-meta-docs.json';
import type { LayoutServerLoad } from './$types';

const litData = metaDocs.Literaturverzeichnis.text;
const abbData = metaDocs.Abkürzungsverzeichnis.text;
const prefData = metaDocs.Vorwort;

// Modify protoHTML
const preface = prefData;


export const load: LayoutServerLoad = async () => {
    return { preface, abbData, litData };
};
