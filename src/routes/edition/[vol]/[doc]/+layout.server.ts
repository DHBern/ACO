export const prerender = true;

import { metaData } from '$lib/data/get_alldata_testing.js';

import type { LayoutServerLoad } from './$types';

export const load: LayoutServerLoad = async ({params}) => {
	// URL Parameters
	const slug_vol = params.vol;
	const slug_doc = params.doc;
		
	// Get corresponding data
	const doc = metaData.find(({ slug: s }) => s === slug_doc);

	const docMetadata = {
		slugs: doc?.unitSlugs || [],
		labels: doc?.unitLabelsLong || [],
		content: doc?.content || '',
		toc_title: doc?.title || ''
	};

	return {
		slug_vol,
		slug_doc,
		docMetadata,
	};
}
