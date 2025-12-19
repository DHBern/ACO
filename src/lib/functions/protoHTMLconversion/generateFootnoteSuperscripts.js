export function generateFootnoteSuperscripts(text) {
	// Guard
	if (!text) {
		// console.warn(
		// 	'!!!!!!\n\nUNDEFINED TEXT FOUND in generateFootnoteSuperscripts.js\n\n!!!!!!!!!!!'
		// );
		return text;
	}
    
	return text.replace(/<span data-note='(\d+)'>\u200B?<\/span>/g, '<sup>$1</sup>');
}
