// Generate html for mainText, lineNumbers and pageNumbers
export { generateMainText } from './generateMainText';
export { generateLineNumbers } from './generateLineNumbers';
export { generatePageNumbers } from './generatePageNumbers';

// Extract NoteIds
// This will extract all referenced data-ids for a text.
// This is useful if text.json and notes.json don't match or don't follow the same structure.
// However, this could be dropped completely, if the json files match.
export { extractNoteIds } from './extractNoteIds';
