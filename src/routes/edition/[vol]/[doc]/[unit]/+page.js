import { textData, notesData } from '$lib/data/get_data';

/** @type {import('./$types').PageLoad} */
export async function load({ fetch, params }) {
	// URL Parameters
	const slug_doc = params.doc;
	const slug_unit = params.unit;
	
	// Get corresponding data
	const doc = textData.find(({ slug: s }) => s === slug_doc);
	
	const slug_next_unit = doc?.unitSlugs[doc?.unitSlugs.findIndex(unit => unit === slug_unit) + 1] || null
	const slug_next_unit2 = doc?.unitSlugs[doc?.unitSlugs.findIndex(unit => unit === slug_unit) + 2] || null
	const slug_next_unit3 = doc?.unitSlugs[doc?.unitSlugs.findIndex(unit => unit === slug_unit) + 3] || null
	const slug_next_unit4 = doc?.unitSlugs[doc?.unitSlugs.findIndex(unit => unit === slug_unit) + 4] || null
	const slug_next_unit5 = doc?.unitSlugs[doc?.unitSlugs.findIndex(unit => unit === slug_unit) + 5] || null

	// let myUnits = [slug_unit, slug_next_unit, slug_next_unit2, slug_next_unit3, slug_next_unit4, slug_next_unit5].map((slug)=>{
	let myUnits = [slug_unit].map((slug)=>{
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
		myUnits,
		notesData
	};
}
