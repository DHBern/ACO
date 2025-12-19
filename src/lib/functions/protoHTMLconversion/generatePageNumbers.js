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
	const numbersText = pageText.replace(
		/<a data-page='(\d+)'>\u200B?<\/a>/g,
		(match, pageNumber) => {
			return `<a class="page-number" href="${path}?page=${pageNumber}" page="${pageNumber}">S. ${pageNumber}</a>`;
		}
	);

	return numbersText;
}
