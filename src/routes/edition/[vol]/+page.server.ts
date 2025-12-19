import type { PageServerLoad } from './$types';
import type { EntryGenerator } from './$types';
import { getFirstUnitOfPage } from '$lib/functions/protoHTMLconversion/getFirstUnitOfPage';

import { metaData } from '$lib/data/aco-metadata.json';

export const entries: EntryGenerator = () => {
    return metaData.flatMap((m) => {
        return m.unitSlugs.map((s) => {
            return { vol: 'vol1', doc: m.schwartzSlug, unit: s };
        });
    });
};

export const load: PageServerLoad = async ({ url, params }) => {
    const pageParam = url.searchParams.get('page');
    let pageParamRedirect = getFirstUnitOfPage(pageParam, metaData);
    return {pageParamRedirect, pageParam, vol : params.vol}
};