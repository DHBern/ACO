export function extractNoteIds(text) {
	let ids = [];
	let match;

	const regex = /<span\sdata-type=['"]note-start['"]\s+data-id='([^']*)'\/>/g;
	while ((match = regex.exec(text)) !== null) {
		// This is necessary to avoid infinite loops with zero-width matches
		if (match.index === regex.lastIndex) {
			regex.lastIndex++;
		}
		ids.push(match[1]);
	}
	return ids;
}
