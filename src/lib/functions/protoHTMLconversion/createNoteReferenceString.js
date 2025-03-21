export function createNoteReferenceString(lineStart, lineEnd, textStart, textEnd) {
	if (lineStart == lineEnd) {
		return `<span data-type='noteRefString-lines'>${lineStart}</span> <span data-type='noteRefString-text'>${textStart}&nbsp;&hellip;&nbsp;${textEnd}]</ span>`;
	} else {
        return `<span data-type='noteRefString-lines'>${lineStart}&nbsp;&ndash;&nbsp;${lineEnd}</span><span data-type='noteRefString-text'>${textStart}&nbsp;&hellip;&nbsp;${textEnd}]</ span>`;
	}
}
