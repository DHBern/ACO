export const prerender = true;

import { registerData } from '$lib/data/aco-register.json';

import type { PageServerLoad } from './$types';

export const load: PageServerLoad = async () => {

	// Get corresponding data
	const places = registerData.Orte;
	const people = registerData.Personen;

	return {
		places,
		people
	};
}
