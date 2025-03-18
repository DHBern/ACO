import { textData as tData, notesData as nData } from '$lib/data/content';

/** @type {import('./$types').PageLoad} */
export async function load({ fetch, params }) {
	const textData = await tData;
	const notesData = await nData;
	
	// URL Parameters
	const slug_doc = params.doc;
	const slug_unit = params.unit;
	
	// Get corresponding data
	const document = textData.find(({ slug: s }) => s === slug_doc);
	const note = notesData[slug_doc];
	const textunit = document[slug_unit] || '';
	const notes = note[slug_unit] || {};

	// Workaround until dynamic unit-loading is in place (delete later)
	const allunits = document.units.map((unit) => {
		return document.content[unit];
	});

	return {
		textunit,
		allunits,
		notes
	};
}
