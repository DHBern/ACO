import { page } from '$app/state';

export function generatePageNumbers(text) {
	// Match a-page, p and br tags
	const matches = text.match(/(<a\ data-page='\d+'><\/a>)|(<\/?p[^>]*>)|(<br\s*\/?>)/g);
	const pageText = matches ? matches.join('') : '';

	// Insert page-number as text and add class
	let href = page.url.searchParams;
	const numbersText = pageText.replace(/<a data-page='(\d+)'><\/a>/g, (match, pageNumber) => {
		href.set('page', pageNumber);
		return `<a class="page-number" href="?${page.url.searchParams.toString()}" page="${pageNumber}">Seite ${pageNumber}</a>`;
	});

	return numbersText;
}
