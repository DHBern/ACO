export function extractNoteIds(text) {
	let ids = [];
	let match;

	const regex = /<note_start\s+note_id='([^']*)'><\/note_start>/g;
	while ((match = regex.exec(text)) !== null) {
		// This is necessary to avoid infinite loops with zero-width matches
		if (match.index === regex.lastIndex) {
			regex.lastIndex++;
		}
		ids.push(match[1]);
	}
	return ids;
}
