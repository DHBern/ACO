export const prerender = true;

import { metaDocs as mDocs } from '$lib/data/aco-meta-docs.json';
import { metaData as mData } from '$lib/data/aco-metadata.json';
import type { LayoutServerLoad } from './$types';

import { linkifyFootnoteSuperscripts } from '$lib/functions/protoHTMLconversion/linkifyFootnoteSuperscripts';
import { transformFootnotesIntroduction } from '$lib/functions/protoHTMLconversion/transformFootnotesIntroduction';

const metaData = await mData;
const metaDocs = await mDocs;
const litData = metaDocs.Literaturverzeichnis.text;
const abbData = metaDocs.Abkürzungsverzeichnis.text;
const intro = metaDocs.Einleitung;
const preface = metaDocs.Vorwort;

// Modify protoHTML
intro.text = linkifyFootnoteSuperscripts(intro.text);
intro.footnotes = transformFootnotesIntroduction(intro.footnotes);

// PageLimits
function getPageLimits(pageParam) {
	if (!pageParam) return { found: false};

	const requested = parseInt(pageParam, 10);
	if (Number.isNaN(requested)) return { found: false };

	// iterate documents (assuming JSON is ordered according to documents)
	for (const entry of metaData) {
		// iterate unit keys in natural order of unitSlugs to respect ordering

		for (const unitSlug of entry.unitSlugs) {
			const limits = entry.pageLimits[unitSlug];
			if (!limits) continue;
			const lower = parseInt(limits[0], 10);
			const upper = parseInt(limits[1], 10);
			if (
				!Number.isNaN(lower) &&
				!Number.isNaN(upper) &&
				requested >= lower &&
				requested <= upper
			) {
				return {
					found: true,
					schwartzSlug: entry.schwartzSlug,
					unitSlug,
					page:requested
				};
			}
		}
	}
	return { found: false, a:3 };
}

export const load: LayoutServerLoad = async ({ url, params }) => {
	const pageParam = url.searchParams.get('page');
	let pageInfo = getPageLimits(pageParam);
	return {vol : params.vol, pageInfo, intro, preface, abbData, litData };
};
