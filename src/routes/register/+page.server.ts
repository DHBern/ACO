export const prerender = true;

import { registerData } from '$lib/data/get_alldata_testing.js';

import type { PageServerLoad } from './$types';

export const load: PageServerLoad = async ({ fetch, params }) => {

	// Get corresponding data
	const places = registerData.Orte;
	const people = registerData.Personen;

	return {
		places,
		people
	};
}
