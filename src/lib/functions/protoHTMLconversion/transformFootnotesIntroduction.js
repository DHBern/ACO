import { transformAnchorsNewTab } from './transformAnchorsNewTab';
import { base } from '$app/paths';

// Transform footnotes (sort by number and modify text)
export function transformFootnotesIntroduction(object) {
	return Object.keys(object)
		.map((key) => {
			// console.log(key)
			const parts = key.split('-');
			const num = parseInt(parts[1], 10);
			const text = transformAnchorsNewTab(object[key]).replace(
				"href='/edition",
				`href='${base}/edition`
			);
			return { key, number: num, text: text };
		})
		.sort((a, b) => a.number - b.number);
}
