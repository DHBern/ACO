// Import local JSON files
import { textData as tData } from '$lib/data/aco-text.json';
import { abbData as aData } from '$lib/data/aco-abbreviations.json';
import { notesData as nData } from '$lib/data/aco-notes.json';
import { registerData as rData } from '$lib/data/aco-register.json';
import { json } from '@sveltejs/kit';

const textData = await tData;
const notesData = await nData;
// const abbData = await aData;
// const registerData = await rData;
// export {textData, abbData, notesData, registerData};

export async function GET({ params, fetch }) {
    const unitText = textData?.[params.doc]?.[params.unit] || '';
    const unitNotes = notesData?.[params.doc]?.[params.unit] || [];
    return json({unitText, unitNotes});
}
