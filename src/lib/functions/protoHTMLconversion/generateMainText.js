function insertNoteSpans(text) {
	let openIds = [];
	let result = '';
	let lastIndex = 0;

	text.replace(
		/<span\s+class=['"]note-start['"]\s+data-id=['"]([^']*)['"]><\/span>|<span\s+class=['"]note-end['"]\s+data-id=['"]([^']*)['"]><\/span>/g,
		(match, startId, endId, offset) => {
			// Capture text before this match
			let precedingText = text.slice(lastIndex, offset);
			if (precedingText.trim()) {
				let idsAttribute = JSON.stringify(openIds);
				if (openIds.length > 0) {
					let multiIdsClass = openIds.length > 1 ? 'multiple-ids' : '';
					let myclass = ['mark', multiIdsClass].filter(Boolean).join(' ');
					result += `<span class='${myclass}' data-ids=${idsAttribute}>${precedingText}</span>`;
				} else {
					result += precedingText; // Preserve text without wrapping
				}
			}

			if (startId) {
				// Handle note-start tag
				openIds.push(startId);
				result += `<span class='note-start' data-id='${startId}'></span>`;
			} else if (endId) {
				// Handle note-end tag
				result += `</span><span class='note-end' data-id='${endId}'></span>`;
				openIds = openIds.filter((id) => id !== endId); // Remove closed ID
			}

			lastIndex = offset + match.length;
		}
	);

	// Append remaining text after last match
	let remainingText = text.slice(lastIndex);
	if (remainingText.trim()) {
		result += remainingText;
	}

	return result;
}

export function generateMainText(text) {
	// Remove line numbers
	text = text.replace(/<a[^>]*[line|page]="[^"]*"[^>]*><\/a>/g, '');
	// Insert spans
	text = insertNoteSpans(text);
	// Transform lib-number
	text = text.replace(/<a\ lib='(I+)'><\/a>/g, (match, libNumber) => {
		return `<a class="lib-number" lib="${libNumber}">Buch ${libNumber}</a>`;
	});
	return text.trim();
}
