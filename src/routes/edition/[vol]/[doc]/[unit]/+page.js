// import { textData, notesData } from '$lib/data/content';
import { textData } from '$lib/data/aco-text.json';
import { notesData } from '$lib/data/aco-notes.json';

/** @type {import('./$types').PageLoad} */
export function load({ fetch, params }) {
	// For later
	//!! Now this leads to: "Cannot use relative URL (/json/aco-text.json) with global fetch — use `event.fetch` instead: https://svelte.dev/docs/kit/web-standards#fetch-apis"
	// const textData = await textData;
	// const notesData = await notesData;

	// Alternative for localhost
	// const { textData } = await fetch(`/json/aco-text.json`).then((r) => {
	// 	return r.json();
	// });
	// const { notesData } = await fetch(`/json/aco-notes.json`).then((r) => {
	// 	return r.json();
	// });

	// URL Parameters
	const doc = params.doc;
	const unit = params.unit;

	// Get corresponding data
	const textunit = textData?.[doc]?.[unit] || '';
	const notes = notesData?.[doc]?.[unit] || {};

	// Workaround until dynamic unit-loading is in place (delete later)
	const allunits = textData?.[doc].units.map((unit) => {
		return textData?.[doc][unit];
	});

	return {
		textunit,
		allunits,
		notes
	};
}
