export const prerender = true;
import { metaDocs as mDocs } from '$lib/data/aco-meta-docs.json';

const metaDocs = await mDocs;
const abbData = metaDocs.Abkürzungsverzeichnis.text;

export async function load() {
	return { abbData };
}
