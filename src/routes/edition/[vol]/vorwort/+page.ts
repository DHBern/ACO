export const prerender = true;
import { metaDocs as mDocs } from '$lib/data/aco-meta-docs.json';

const metaDocs = await mDocs;
const preface = metaDocs.Vorwort.text;

export async function load() {
	return { preface };
}
