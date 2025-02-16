import { api, apiLocal } from '$lib/constants';

export const acoText = fetch(`${apiLocal}/json/aco-text.json`).then((r) => {
	return r.json();
});

export const acoNotes = fetch(`${apiLocal}/json/aco-notes.json`).then((r) => {
	return r.json();
});
