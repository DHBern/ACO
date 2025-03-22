import { textData, notesData } from '$lib/data/get_data';

/** @type {import('./$types').PageLoad} */
export async function load({ fetch, params }) {
	// URL Parameters
	const slug_doc = params.doc;
	const slug_unit = params.unit;
	
	// Get corresponding data
	const doc = textData.find(({ slug: s }) => s === slug_doc);
	
	const slug_next_unit = doc?.unitSlugs[doc?.unitSlugs.findIndex(unit => unit === slug_unit) + 1] || null

	let groupedUnits = [slug_unit, slug_next_unit].map((slug)=>{
		const indexPrev = doc?.unitSlugs.findIndex(unit => unit === slug) - 1;
		const indexNext = doc?.unitSlugs.findIndex(unit => unit === slug) + 1;
		return {
			slug: slug,
			prevSlug: doc?.unitSlugs[indexPrev] || null,
			nextSlug: doc?.unitSlugs[indexNext] || null,
			prevLabel: doc?.unitLabels?.[indexPrev] || null,
			nextLabel: doc?.unitLabels?.[indexNext] || null,
			text: doc?.content?.[slug] || '',
			notes: notesData[slug_doc]?.[slug] || []
		}
	})

	return {
		slug_unit,
		slug_doc,
		groupedUnits,
		notesData
	};
}
