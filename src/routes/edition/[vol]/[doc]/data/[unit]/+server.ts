import type { EntryGenerator } from './$types';
export const prerender = true;

// Import local JSON files
import { metaData as mData } from '$lib/data/aco-metadata.json';
import { textData as tData } from '$lib/data/aco-text.json';
import { notesData as nData } from '$lib/data/aco-notes.json';
import { json } from '@sveltejs/kit';

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
	return json({ unitText, unitNotes });
}
