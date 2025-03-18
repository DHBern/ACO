import { textData as tData } from '$lib/data/content';

/** @type {import('./$types').PageLoad} */
export async function load({ fetch, params }) {
	const textData = await tData;

	// URL Parameters
	const slug_vol = params.vol;
	const slug_doc = params.doc;
	
	// Get corresponding data
	const document = textData.find(({ slug: s }) => s === slug_doc);
	const dochead = document.content.head;
	const doctitle = document.content.title;

	return {
		dochead,
		doctitle
	};
}
