function insertNoteSpans(text) {
	let openIds = [];
	let result = '';
	let lastIndex = 0;

	text.replace(
		/<note_start note_id='([^']*)'><\/note_start>|<note_end note_id='([^']*)'><\/note_end>/g,
		(match, startId, endId, offset) => {
			// Capture text before this match
			let precedingText = text.slice(lastIndex, offset);
			if (precedingText.trim()) {
				let idsAttribute = JSON.stringify(openIds);
				if (openIds.length > 0) {
					let multiIdsClass = openIds.length > 1 ? 'multiple-ids' : '';
					result += `<span class='mark ${multiIdsClass}' note_ids=${idsAttribute}>${precedingText}</span>`;
				} else {
					result += precedingText; // Preserve text without wrapping
				}
			}

			if (startId) {
				// Handle <note_start> tag
				openIds.push(startId);
				result += `<note_start note_id='${startId}'></note_start>`;
			} else if (endId) {
				// Handle <note_end> tag
				result += `</span><note_end note_id='${endId}'></note_end>`;
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
