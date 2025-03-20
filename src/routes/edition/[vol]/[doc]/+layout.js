import { textData } from '$lib/data/get_data';

/** @type {import('./$types').PageLoad} */
export async function load({ fetch, params, url }) {
	// URL Parameters
	const slug_vol = params.vol;
	const slug_doc = params.doc;
	
	const line = url.searchParams.get('line') || 1;

	// Get corresponding data
	const doc = textData.find(({ slug: s }) => s === slug_doc);
	const dochead = doc.content.head;
	const doctitle = doc.content.title;

	const units = doc?.units || [];

	return {
		slug_doc,
		dochead,
		doctitle,
		units, 
		line
	};
}
