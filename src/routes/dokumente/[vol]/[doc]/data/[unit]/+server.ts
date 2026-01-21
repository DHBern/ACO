import type { EntryGenerator } from './$types';
export const prerender = true;

import { metaData } from '$lib/data/aco-metadata.json';
import { textData } from '$lib/data/aco-text.json';
import { notesData } from '$lib/data/aco-notes.json';

import { transformAnchors } from '$lib/functions/protoHTMLconversion/transformAnchors';

import { json } from '@sveltejs/kit';

export const entries: EntryGenerator = () => {
	return metaData.flatMap((m) => {
		return m.unitSlugs.map((s) => {
			return { vol: 'vol1', doc: m.schwartzSlug, unit: s };
		});
	});
};

export async function GET({ params, fetch }) {
	const unitText = textData?.[params.doc]?.[params.unit] || null;
	let unitNotes = notesData?.[params.doc]?.[params.unit] || null;

	// Transform note content
	if (unitNotes && Object.keys(unitNotes)) {
		Object.keys(unitNotes).forEach((key) => {
			// transform anchors such that links to *other* documents open in new tab
			unitNotes[key].note_content = transformAnchors(
				unitNotes[key].note_content,
				unitNotes[key].document
			);

			// ad-hoc replacement bullet points -> greek colons
			unitNotes[key].note_content = unitNotes[key].note_content.replace('∙', '·');
		});
	}

	if (unitText === null) {
		// console.error(`\n\n!!!!!!!!!!!!!!!!!!!!!!!!!\n\nNo text found for ${params.doc}/${params.unit}. Check consistency accross datasets!\n\n!!!!!!!!!!!!!!!!!!!!!!!!!`)
	}
	if (unitNotes === null) {
		// console.error(`\n\n!!!!!!!!!!!!!!!!!!!!!!!!!\n\nNo notes found for ${params.doc}/${params.unit}. Check consistency accross datasets!\n\n!!!!!!!!!!!!!!!!!!!!!!!!!`)
	}
	return json({ unitText, unitNotes });
}
