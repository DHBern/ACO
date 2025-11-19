import { transformAnchorsNewTab } from './transformAnchorsNewTab';
// Transform footnotes (sort by number and modify text)
export function transformFootnotesIntroduction(object) {
	return Object.keys(object)
		.map((key) => {
			// console.log(key)
			const parts = key.split('-');
			const num = parseInt(parts[1], 10);
			return { key, number: num, text: transformAnchorsNewTab(object[key]) };
		})
		.sort((a, b) => a.number - b.number);
}
