export function generatePageNumbers(text) {
	// Match a-page, p and br tags
	const matches = text.match(/(<a\ page='\d+'><\/a>)|(<\/?p>)|(<br\s*\/?>)/g);
	const pageText = matches ? matches.join('') : '';

	// Insert page-number as text and add class
	const numbersText = pageText.replace(/<a page='(\d+)'><\/a>/g, (match, pageNumber) => {
		return `<a class="page-number" page="${pageNumber}">Seite ${pageNumber}</a>`;
	});
	return numbersText;
}
