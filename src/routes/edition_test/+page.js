// import { acoText } from '$lib/data/content';

/** @type {import('./$types').PageLoad} */
export async function load({ fetch, params }) {
	// const { acoText } = await acoText;
	const { acoText } = await fetch(`/json/aco-text.json`).then((r) => {
		return r.json();
	});
	const { acoNotes } = await fetch(`/json/aco-notes.json`).then((r) => {
		return r.json();
	});
	// const doc = params?.doc;
	const doc = 'CV166';

	const notes = acoNotes?.[doc] || [];
	const head = acoText?.[doc].head;
	const title = acoText?.[doc].title;
	const units = acoText?.[doc].units.map((unit) => {
		return acoText?.[doc][unit];
	});

	return {
		head,
		title,
		units,
		notes
	};
}
