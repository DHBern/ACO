import { textData } from '$lib/data/get_data';

/** @type {import('./$types').PageLoad} */
export async function load({ fetch, params }) {
	// URL Parameters
	const slug_doc = params.doc;
	
    // Get first unit of current document for redirect
    const firstUnit = textData.find(({ slug: s }) => s === slug_doc).units[0];

	return {
		firstUnit,
        slug_doc
	};
}
