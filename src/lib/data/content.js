import { api, apiLocalhost } from '$lib/constants/constants';

export const { textData } = fetch(`${apiLocalhost}/json/aco-text.json`).then((r) => {
	return r.json();
});

export const { notesData } = fetch(`${apiLocalhost}/json/aco-notes.json`).then((r) => {
	return r.json();
});
