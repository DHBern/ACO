export function createNoteReferenceString(lineStart, lineEnd, refstring_text, textStart, textEnd) {
	// Superscripts as references for multiple words on one line
	function convertSubToSup(text) {
		let parts = text.split('_');
		return parts.length > 1 ? parts[0] + '<sup>' + parts[1] + '</sup>' : text;
	}
	textStart = convertSubToSup(textStart);
	textEnd = convertSubToSup(textEnd);

	// Fallback if refstring is empty
	refstring_text = refstring_text ? refstring_text : textStart + '&nbsp;&hellip;&nbsp' + textEnd + ']'

	if (lineStart == lineEnd) {
		// Print LIne number only once if identical
		return `<span data-type='noteRefString-lines'>${lineStart}</span> <span data-type='noteRefString-text'>${refstring_text}</ span>`;
	} else {
		// Print both line numbers
		return `<span data-type='noteRefString-lines'>${lineStart}&ndash;${lineEnd}</span> <span data-type='noteRefString-text'>${refstring_text}</ span>`;
	}
}
