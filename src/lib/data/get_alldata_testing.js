// Import local JSON files
import { metaData as mData } from './aco-metadata.json';
import { textData as tData } from './aco-text.json';
import { metaDocs as mDocs } from '$lib/data/aco-meta-docs.json';
import { notesData as nData } from './aco-notes.json';
import { registerData as rData } from './aco-register.json';

const metaData = await mData;
const textData = await tData;
const metaDocs = await mDocs;
const litData = metaDocs.Literaturverzeichnis.text;
const abbData = metaDocs.Abkürzungsverzeichnis.text;
const intro = metaDocs.Einleitung.text;
const preface = metaDocs.Vorwort.text;

const notesData = await nData;
const registerData = await rData;

export { metaData, textData, litData, abbData, intro, preface, notesData, registerData };

// Get JSON from Web-API
// import { api } from '$lib/constants/constants';

// export const { textData } = fetch(`${api}/json/aco-text.json`).then((r) => {
// 	return r.json();
// });

// export const { notesData } = fetch(`${api}/json/aco-notes.json`).then((r) => {
// 	return r.json();
// });
