export function generateLineNumbers(text, path) {
	// Match a-line, p and br tags
	const matches = text.match(/(<a\ data-page='\d+'>\u200B?<\/a>)|(<a\ data-line='\d+'>\u200B?<\/a>)|(<\/?p[^>]*>)|(<br\s*\/?>)|(<\/?section[^>]*>)/g);
	const linesText = matches ? matches.join('') : '';

	// Insert line-number as text at every 5th line
	const numbersText = linesText.replace(/<a data-line='(\d+)'>\u200B?<\/a>/g, (_match, lineNumber) => {
		return `<a class="line-number" href="${path}?line=${lineNumber}" data-line="${lineNumber}">${!(lineNumber % 5) ? lineNumber : "<span class='lineNumBuffer'>__</span>"}</a>`;
	});

	return numbersText;
}
