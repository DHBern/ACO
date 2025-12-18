export const prerender = true;

import { registerData as rData } from '$lib/data/aco-register.json';
const registerData = await rData;

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
