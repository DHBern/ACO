import { metaData, notesData } from '$lib/data/get_alldata_testing.ts';
import { base } from '$app/paths';

/** @type {import('./$types').PageLoad} */
export async function load({ fetch, url, params }) {
	
	// URL Parameters
	const slug_doc = params.doc;
	const slug_unit = params.unit;

	// Get metadata
	const metadataDoc = metaData[slug_doc];

	// Load data from +server.ts
	const unitData = await fetch(
		`${base}/edition/${params.vol}/${params.doc}/data/${params.unit}`
	).then((r) => {
		return r.json();
	});
	const unitText = unitData.unitText;
	const unitNotes = unitData.unitNotes;

	// Bundle as unit
	const indexPrev = metadataDoc?.unitSlugs.findIndex((unit) => unit === slug_unit) - 1;
	const indexNext = metadataDoc?.unitSlugs.findIndex((unit) => unit === slug_unit) + 1;
	let unit = {
		slug: slug_unit,
		prevSlug: metadataDoc?.unitSlugs[indexPrev] || null,
		nextSlug: metadataDoc?.unitSlugs[indexNext] || null,
		prevLabel: metadataDoc?.unitLabels?.[indexPrev] || null,
		nextLabel: metadataDoc?.unitLabels?.[indexNext] || null,
		text: unitText || '',
		notes: unitNotes || [],
		labelInline: undefined
	};

	return {
		slug_unit,
		slug_doc,
		unit,
		notesData,
		unitText,
		unitNotes
	};
}
