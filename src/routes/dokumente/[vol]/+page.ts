export const prerender = true;
import type { EntryGenerator } from './$types';

export const entries: EntryGenerator = () => {
	return [{ vol: 'vol1' }, { vol: 'vol2' }, { vol: 'vol3' }];
};
