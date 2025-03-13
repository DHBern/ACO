import containerQueries from '@tailwindcss/container-queries';
import typography from '@tailwindcss/typography';
import type { Config } from 'tailwindcss';

// Ensure contentPath is correctly resolved with `import.meta.url`
const content = ['./src/**/*.{html,js,svelte,ts}', contentPath(import.meta.url, 'svelte')];

export default {
	content,
	theme: {
		extend: {}
	},

	plugins: [
		typography,
		containerQueries
	]
} satisfies Config;
