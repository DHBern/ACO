import type { EntryGenerator } from './$types';
export const prerender = true;

import { metaData as mData } from '$lib/data/aco-metadata.json';
import { textData as tData } from '$lib/data/aco-text.json';
import { notesData as nData } from '$lib/data/aco-notes.json';

import { json } from '@sveltejs/kit';
import { transformAnchorsNewTab } from '$lib/functions/protoHTMLconversion/transformAnchorsNewTab';

const metaData = await mData;
const textData = await tData;
const notesData = await nData;

export const entries: EntryGenerator = () => {
	return metaData.flatMap((m) => {
		return m.unitSlugs.map((s) => {
			return { vol: '1', doc: m.schwartzSlug, unit: s };
		});
	});
};

export async function GET({ params, fetch }) {
	const unitText = textData?.[params.doc]?.[params.unit] || '';
	const unitNotes = notesData?.[params.doc]?.[params.unit] || [];

	// Modify anchors in unitNotes
	Object.keys(unitNotes).forEach((key) => {
		// if (!unitNotes[key] || !unitNotes[key].note_content) return;
		unitNotes[key].note_content = transformAnchorsNewTab(unitNotes[key].note_content);
	});

	return json({ unitText, unitNotes });
}

