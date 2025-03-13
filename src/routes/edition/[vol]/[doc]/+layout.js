import { textData as data } from '$lib/data/content';

/** @type {import('./$types').PageLoad} */
export async function load({ fetch, params }) {
	const textData = await data;

	// URL Parameters
	const doc = params.doc;

	// Get corresponding data
	const dochead = textData?.[doc].dochead;
	const doctitle = textData?.[doc].doctitle;

	return {
		dochead,
		doctitle
	};
}
