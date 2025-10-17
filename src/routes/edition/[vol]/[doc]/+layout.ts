import { metaData } from '$lib/data/get_alldata_testing.js';

/** @type {import('./$types').PageLoad} */
export async function load({ params }) {
	// URL Parameters
	const slug_vol = params.vol;
	const slug_doc = params.doc;
		
	// Get corresponding data
	const doc = metaData.find(({ slug: s }) => s === slug_doc);

	const docMetadata = {
		slugs: doc?.unitSlugs || [],
		labels: doc?.unitLabelsLong || [],
		meta: doc?.content.head || '',
		inhalt: doc?.content.inhalt || '',
		toc_title: doc?.title || ''
	};

	return {
		slug_vol,
		slug_doc,
		docMetadata,
	};
}
