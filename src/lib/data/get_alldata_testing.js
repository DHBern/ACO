// Import local JSON files
import { metaData as mData } from './aco-metadata.json';
import { textData as tData } from './aco-text.json';
import { abbData as aData } from './aco-abbreviations.json';
import { notesData as nData } from './aco-notes.json';
import { registerData as rData } from './aco-register.json';

const metaData = await mData;
const textData = await tData;
const abbData = await aData;
const notesData = await nData;
const registerData = await rData;

export { metaData, textData, abbData, notesData, registerData };

// Get JSON from Web-API
// import { api } from '$lib/constants/constants';

// export const { textData } = fetch(`${api}/json/aco-text.json`).then((r) => {
// 	return r.json();
// });

// export const { notesData } = fetch(`${api}/json/aco-notes.json`).then((r) => {
// 	return r.json();
// });
