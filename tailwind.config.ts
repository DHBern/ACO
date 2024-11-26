import containerQueries from '@tailwindcss/container-queries';
import typography from '@tailwindcss/typography';
import type { Config } from 'tailwindcss';

import { skeleton, contentPath } from '@skeletonlabs/skeleton/plugin';
import * as themes from '@skeletonlabs/skeleton/themes';

// Ensure contentPath is correctly resolved with `import.meta.url`
const content = ['./src/**/*.{html,js,svelte,ts}', contentPath(import.meta.url, 'svelte')];

export default {
	content,
	theme: {
		extend: {}
	},

	plugins: [
		skeleton({
			// NOTE: each theme included will be added to your CSS bundle
			themes: [themes.cerberus, themes.rose]
		}),
		typography,
		containerQueries
	]
} satisfies Config;
