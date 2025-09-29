import containerQueries from '@tailwindcss/container-queries';
import typography from '@tailwindcss/typography';
import type { Config } from 'tailwindcss';

export default {
	theme: {
		extend: {}
	},

	plugins: [typography, containerQueries]
} satisfies Config;
