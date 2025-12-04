import type { PageLoad } from './$types';

import type { EntryGenerator } from './$types';
export const prerender = true;

import { metaData as mData } from '$lib/data/aco-metadata.json';
const metaData = await mData;

export const entries: EntryGenerator = () => {
    return metaData.flatMap((m) => {
        return m.unitSlugs.map((s) => {
            return { vol: 'vol1', doc: m.schwartzSlug, unit: s };
        });
    });
};


export const load: PageLoad = ({ params }) => {
	return {vol : params.vol}
};