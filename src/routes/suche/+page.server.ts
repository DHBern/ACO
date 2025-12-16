export const prerender = true;

import { metaData } from '$lib/data/aco-metadata.json';
import type { PageServerLoad } from './$types';

const types = ['CV', 'CPal', 'CVer', 'CU'];
const schwartzSlugs = types.reduce((acc, type) => {
	const slugs = metaData
		.filter(({ type: t }) => t === type)
		.sort((a, b) => a.schwartzNum - b.schwartzNum)
		.map((item) => item.schwartzSlug);
	return acc.concat(slugs);
}, []);

const docNums = metaData
	.map((m) => {
		return m.acoDocNum;
	})
	.sort((a, b) => a - b);

export const load: PageServerLoad = async () => {
	return {
		schwartzSlugs,
		docNums
	};
};
