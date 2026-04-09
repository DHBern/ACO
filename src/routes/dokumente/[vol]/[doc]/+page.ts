export const prerender = true;
import type { EntryGenerator } from './$types';

import { metaData } from '$lib/data/aco-metadata.json';

export const entries: EntryGenerator = () => {
	return metaData.map((m) => ({ vol: 'vol1', doc: m.schwartzSlug }));
};