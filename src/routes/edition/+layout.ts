export const prerender = true;
import { metaData as mData } from '$lib/data/aco-metadata.json';

const metaData = await mData;

export async function load() {
	return { metaData };
}
