import { page } from '$app/state';

export function generateLineNumbers(text) {
	// Match a-line, p and br tags
	const matches = text.match(/(<a data-line='\d+'><\/a>)|(<\/?p[^>]*>)|(<br\s*\/?>)/g);
	const linesText = matches ? matches.join('') : '';

	// Insert line-number as text at every 5th line
	let href = page.url.searchParams;
	const numbersText = linesText.replace(/<a data-line='(\d+)'><\/a>/g, (_match, lineNumber) => {
		href.set('line', lineNumber);
		return `<a class="line-number" href="?${page.url.searchParams.toString()}" data-line="${lineNumber}">${!(lineNumber % 5) ? lineNumber : "<span class='lineNumBuffer'>__</span>"}</a>`;
	});

	return numbersText;
}
