export function createNoteReferenceString(lineStart, lineEnd, textStart, textEnd) {
	// Superscripts as references for multiple words on one line
	function convertSubToSup(text) {
		let parts = text.split('_');
		return parts.length > 1 ? parts[0] + '<sup>' + parts[1] + '</sup>' : text;
	}
	textStart = convertSubToSup(textStart);
	textEnd = convertSubToSup(textEnd);

	if (lineStart == lineEnd) {
		// Print LIne number only once if identical
		return `<span data-type='noteRefString-lines'>${lineStart}</span> <span data-type='noteRefString-text'>${textStart}&nbsp;&hellip;&nbsp;${textEnd}]</ span>`;
	} else {
		// Print both line numbers
		return `<span data-type='noteRefString-lines'>${lineStart}&ndash;${lineEnd}</span> <span data-type='noteRefString-text'>${textStart}&nbsp;&hellip;&nbsp;${textEnd}]</ span>`;
	}
}
