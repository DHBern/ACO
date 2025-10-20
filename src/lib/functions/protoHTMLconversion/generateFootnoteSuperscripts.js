export function generateFootnoteSuperscripts(text) {
    return text.replace(/<span data-note='(\d+)'>\u200B?<\/span>/g, "<sup>$1</sup>");
}
