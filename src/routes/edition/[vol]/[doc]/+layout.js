import { textData } from '$lib/data/get_data';

/** @type {import('./$types').PageLoad} */
export async function load({ fetch, params, url }) {
	// URL Parameters
	const slug_vol = params.vol;
	const slug_doc = params.doc;
	
	const line = url.searchParams.get('line') || 1;

	// Get corresponding data
	const doc = textData.find(({ slug: s }) => s === slug_doc);
	
	const docMetadata = {
		slugs: doc?.unitSlugs || [],
		labels: doc?.unitLabels || [],
		meta: doc?.content.head || "",
		inhalt: doc?.content.inhalt || "",
		title: doc?.content.title || "",
		toc_title: doc?.title || ""
	}
	const docContent = doc?.content || null

	return {
		slug_doc,
		line,
		docMetadata,
		docContent
	};
}
