export const prerender = true;
import { metaDocs } from '$lib/data/aco-meta-docs.json';

const preface = metaDocs.Vorwort.text;

export async function load() {
	return { preface };
}
