export const prerender = true;
import type { PageLoad } from './$types';
import type { EntryGenerator } from './$types';
import { getFirstUnitOfPage } from '$lib/functions/protoHTMLconversion/getFirstUnitOfPage';

import { metaData as mData } from '$lib/data/aco-metadata.json';
const metaData = await mData;

export const entries: EntryGenerator = () => {
    return metaData.flatMap((m) => {
        return m.unitSlugs.map((s) => {
            return { vol: 'vol1', doc: m.schwartzSlug, unit: s };
        });
    });
};
export const load: PageLoad = async ({ url, params }) => {
	const pageParam = url.searchParams.get('page');
	let pageParamRedirect = getFirstUnitOfPage(pageParam, metaData);
	return {pageParamRedirect, pageParam};
};
