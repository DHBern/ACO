export function transformAnchorsNewTab(htmlstring) {
	return htmlstring.replace(/<a\b([^>]*)>/gi, (m, attrs) => {
		// Add attributes to opening <a ...> tags that don't already have target
		const hasTarget = /(\btarget\s*=)/i.test(attrs);
		const hasRel = /(\brel\s*=)/i.test(attrs);
		const addTarget = hasTarget ? '' : ' target="_blank"';
		const addRel = hasRel ? '' : ' rel="noopener noreferrer"';
		return `<a${attrs}${addTarget}${addRel}>`;
	});
}
