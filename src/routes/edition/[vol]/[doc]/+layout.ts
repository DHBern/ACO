import { metaData } from '$lib/data/get_alldata_testing.js';

/** @type {import('./$types').PageLoad} */
export async function load({ fetch, params, url }) {
	// URL Parameters
	const slug_vol = params.vol;
	const slug_doc = params.doc;
	
	const line = url.searchParams.get('line') || 1;

	// Get corresponding data
	const doc = metaData.find(({ slug: s }) => s === slug_doc);
	
	const docMetadata = {
		slugs: doc?.unitSlugs || [],
		labels: doc?.unitLabels || [],
		meta: doc?.content.head || "",
		inhalt: doc?.content.inhalt || "",
		toc_title: doc?.title || ""
	}

	return {
		slug_doc,
		line,
		docMetadata,
	};
}
