export const prerender = true;

import { metaData } from '$lib/data/aco-metadata.json';

import type { LayoutLoad } from '../../$types';

export const load: LayoutLoad = async ({params}) => {
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
