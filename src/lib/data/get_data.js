// Import local JSON files
import { textData as tData } from './aco-text.json';
import { notesData as nData } from './aco-notes.json';

const textData = await tData;
const notesData = await nData;

export {textData};
export {notesData};


// Get JSON from Web-API
// import { api } from '$lib/constants/constants';

// export const { textData } = fetch(`${api}/json/aco-text.json`).then((r) => {
// 	return r.json();
// });

// export const { notesData } = fetch(`${api}/json/aco-notes.json`).then((r) => {
// 	return r.json();
// });
