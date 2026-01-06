export const prerender = true;
import { metaDocs } from '$lib/data/aco-meta-docs.json';

const abbData = metaDocs.Abkürzungsverzeichnis.text;

export async function load() {
	return { abbData };
}
