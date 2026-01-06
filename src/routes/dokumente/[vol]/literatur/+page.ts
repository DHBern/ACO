export const prerender = true;
import { metaDocs } from '$lib/data/aco-meta-docs.json';

const litData = metaDocs.Literaturverzeichnis.text;

export async function load() {
	return { litData };
}
