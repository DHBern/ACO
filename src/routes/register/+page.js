import { registerData } from '$lib/data/get_data';

/** @type {import('./$types').PageLoad} */
export async function load({ fetch, params }) {
	// Get corresponding data
    const places = registerData.Orte;
    const people = registerData.Personen;

	return {
		places,
        people
	};
}
