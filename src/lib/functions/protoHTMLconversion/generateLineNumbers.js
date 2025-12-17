export function generateLineNumbers(text, path) {
	// Guard
	if (!text) {
		console.warn('!!!!!!\n\nUNDEFINED TEXT FOUND in generateLineNumbers.js\n\n!!!!!!!!!!!');
		return text;
	}

	// Match a-line, p and br tags
	const matches = text.match(
		/(<a\ data-page='\d+'>\u200B?<\/a>)|(<a\ data-line='\d+'>\u200B?<\/a>)|(<\/?p[^>]*>)|(<br\s*\/?>)|(<\/?section[^>]*>)/g
	);
	const linesText = matches ? matches.join('') : '';

	// Insert line-number as text at every 5th line
	let numbersText = linesText.replace(
		/<a data-line='(\d+)'>\u200B?<\/a>/g,
		(_match, lineNumber) => {
			return `<a class="line-number" href="${path}?line=${lineNumber}" data-line="${lineNumber}">${!(lineNumber % 5) ? lineNumber : "<span class='lineNumBuffer'></span>"}</a>`;
		}
	);

	// Escape-Hatch: Fill empty <p> with a non-breaking whitespace such that they don't collapse to zero-height
	// This is needed in irregular/inconsistent situations, where <p> does not contain a line-break ancor-tag.
	numbersText = numbersText.replace(/<p>\s*<\/p>/g, '<p>&nbsp;</p>');
	return numbersText;
}
