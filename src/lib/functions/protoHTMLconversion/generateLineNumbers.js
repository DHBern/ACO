import { page } from '$app/state';

export function generateLineNumbers(text) {
	// Match a-line, p and br tags
	const matches = text.match(/(<a data-line='\d+'><\/a>)|(<\/?p[^>]*>)|(<br\s*\/?>)/g);
	const linesText = matches ? matches.join('') : '';

	// Insert line-number as text at every 5th line
	const numbersText = linesText.replace(/<a data-line='(\d+)'><\/a>/g, (_match, lineNumber) => {
		return `<a class="line-number" href="${page.url.pathname}?line=${lineNumber}" data-line="${lineNumber}">${!(lineNumber % 5) ? lineNumber : "<span class='lineNumBuffer'>__</span>"}</a>`;
	});

	return numbersText;
}
