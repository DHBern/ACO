export function generatePageNumbers(text, path) {
	// Guard
	if (!text) {
		// console.warn('!!!!!!\n\nUNDEFINED TEXT FOUND in generatePageNumbers.js\n\n!!!!!!!!!!!');
		return text;
	}

	// Match a-page, p and br tags
	const matches = text.match(
		/(<a\ data-page='\d+'>\u200B?<\/a>)|(<a\ data-line='\d+'>\u200B?<\/a>)|(<\/?p[^>]*>)|(<br\s*\/?>)|(<\/?section[^>]*>)/g
	);
	const pageText = matches ? matches.join('') : '';

	// Insert page-number as text and add class
	let numbersText = pageText.replace(
		/<a data-page='(\d+)'>\u200B?<\/a>/g,
		(match, pageNumber) => {
			return `<a class="page-number" href="${path}?page=${pageNumber}" page="${pageNumber}">S. ${pageNumber}</a>`;
		}
	);

	// Escape-Hatch: Fill empty <p> with a non-breaking whitespace such that they don't collapse to zero-height
	// This is needed in irregular/inconsistent situations, where <p> does not contain a line-break ancor-tag.
	numbersText = numbersText.replace(/<p>\s*<\/p>/g, '<p>&nbsp;</p>');

	return numbersText;
}
