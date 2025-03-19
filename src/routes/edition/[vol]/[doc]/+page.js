import { textData } from '$lib/data/get_data';

/** @type {import('./$types').PageLoad} */
export async function load({ fetch, params }) {
	// URL Parameters
    const slug_vol = params.vol;
	const slug_doc = params.doc;
    
    // Get corresponding data
    const document = textData.find(({ slug: s }) => s === slug_doc);
    const dochead = document?.content.head;
    const doctitle = document?.content.title;
	
    // Get first unit of current document for redirect
    const firstUnit = document?.units[0];

	return {
        dochead,
        doctitle,
		firstUnit,
        slug_doc
	};
}
