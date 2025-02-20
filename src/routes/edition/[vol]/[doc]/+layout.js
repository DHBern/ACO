// import { textData } from '$lib/data/content';

/** @type {import('./$types').PageLoad} */
export async function load({ fetch, params }) {
	// For later
	//!! Now this leads to: "Cannot use relative URL (/json/aco-text.json) with global fetch — use `event.fetch` instead: https://svelte.dev/docs/kit/web-standards#fetch-apis"
	// const textData = await textData;

	// Alternative for localhost
	const { textData } = await fetch(`/json/aco-text.json`).then((r) => {
		return r.json();
	});

	// URL Parameters
	const doc = params.doc;

	// Get corresponding data
	const dochead = textData?.[doc].dochead;
	const doctitle = textData?.[doc].doctitle;

	return {
		dochead,
		doctitle
	};
}
