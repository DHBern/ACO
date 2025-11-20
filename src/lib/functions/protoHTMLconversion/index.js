// Generate html for mainText, lineNumbers, pageNumbers and footnotes
export { generateMainText } from './generateMainText';
export { generateLineNumbers } from './generateLineNumbers';
export { generatePageNumbers } from './generatePageNumbers';
export {generateFootnoteSuperscripts} from './generateFootnoteSuperscripts';

// Extract NoteIds
// This will extract all referenced data-ids for a text.
// This is useful if text.json and notes.json don't match or don't follow the same structure.
// However, this could be dropped completely, if the json files match.
export { extractNoteIds } from './extractNoteIds';
