export const prerender = true;
import { metaData } from '$lib/data/aco-metadata.json';

export async function load() {
	return { metaData };
}
