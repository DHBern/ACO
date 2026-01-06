export const prerender = false;

import type { LayoutLoad } from './[doc]/$types';

export const load: LayoutLoad = async ({ params }) => {
	return { vol: params.vol };
};
