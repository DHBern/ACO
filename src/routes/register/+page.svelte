<script>
	import { base } from '$app/paths';
	import { Accordion } from '@skeletonlabs/skeleton-svelte';
	let { data } = $props();

	const placeLabels = data.places.map((el) => el.label);
	const peopleLabels = data.people.map((el) => el.label);

	let accordionPlaces = $state({ value: '' });
	let accordionPeople = $state({ value: '' });

	$inspect(accordionPlaces);

	// Grouping the array by the first entry
	function groupByDoc(loc) {
		return loc.reduce((acc, [key, value]) => {
			if (!acc[key]) {
				acc[key] = [];
			}
			acc[key].push(value);
			return acc;
		}, {});
	}

	function convertUnit(unit) {
		if (unit[0] === 'Z') {
			return `?line=${unit.slice(2)}`;
		} else {
			return `/${unit}`;
		}
	}

	const peopleGrouped = data.people.map((person) => {
		return groupByDoc(person['loc-s']);
	});
	const placesGrouped = data.places.map((place) => {
		return groupByDoc(place['loc-s']);
	});

	console.log(peopleGrouped, placesGrouped);
</script>

{#snippet accordion(labelsList, groupedList, accordionState)}
	<Accordion {accordionState} onValueChange={(e) => (accordionState.value = e.value)} collapsible>
		{#each labelsList as label, idx}
			<Accordion.Item value={label}>
				{#snippet lead()}{/snippet}
				{#snippet control()}<span class="text-xl font-bold">{label}</span>{/snippet}
				{#snippet panel()}
					<div class="prose">
						<ul>
							{#each Object.keys(groupedList[idx]) as docKey}
								<li>
									<span data-type="register-doc-key">{docKey}</span>
									{#each groupedList[idx][docKey] as unit}
										<a
											href={`${base}/edition/1/${docKey}${convertUnit(unit)}`}
											data-type="register-unit">{unit}</a
										>
									{/each}
								</li>
							{/each}
						</ul>
					</div>
				{/snippet}
			</Accordion.Item>
		{/each}
	</Accordion>
{/snippet}

<div class="grid w-full grid-cols-2 gap-5 py-24 max-w-[1500px] mx-auto">
	<h1 class="text-3xl font-bold text-[var(--aco-orange)]">Register</h1>
	<div class="col-span-2 mb-4">
		<p class="">Vgl. für detailliertere Angaben den Index bei Schwartz.</p>
		<p class="">Ortsspeziﬁsche Adjektive sind unter Ortsnamen subsumiert</p>
	</div>
	<div class="col-span-1 col-start-1">
		<h2 class="mb-4 text-3xl font-bold">Orte</h2>
		<div class="h-[70vh] overflow-y-scroll bg-[var(--aco-gray-2)] p-3">
			{@render accordion(placeLabels, placesGrouped, accordionPlaces)}
		</div>
	</div>
	<div class="col-span-1 col-start-2">
		<h2 class="mb-4 text-3xl font-bold">Personen</h2>
		<div class="h-[70vh] overflow-y-scroll bg-[var(--aco-gray-2)] p-3">
			{@render accordion(peopleLabels, peopleGrouped, accordionPeople)}
		</div>
	</div>
</div>

<style>
	@reference "tailwindcss";

	:global([data-type='register-doc-key']) {
		@apply font-bold;
	}
	:global([data-type='register-unit']) {
		@apply ml-2;
	}
</style>
