<script>
	import { base } from '$app/paths';
	import { Accordion } from '@skeletonlabs/skeleton-svelte';
	let { data } = $props();

	const placeLabels = data.places.map((el) => el.label);
	const peopleLabels = data.people.map((el) => el.label);

	let accordionPlaces = $state({ value: '' });
	let accordionPeople = $state({ value: '' });

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
</script>

{#snippet accordion(labelsList, groupedList, accordionState)}
	<Accordion {accordionState} onValueChange={(e) => (accordionState.value = e.value)} multiple>
		{#each labelsList as label, idx}
			<Accordion.Item value={label}>
				<h3>
					<Accordion.ItemTrigger
						><span class="text-2xl font-bold">{label}</span></Accordion.ItemTrigger
					>
				</h3>
				<Accordion.ItemContent>
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
				</Accordion.ItemContent>
			</Accordion.Item>
		{/each}
	</Accordion>
{/snippet}

<div class="mx-auto grid w-full max-w-[1500px] grid-cols-2 gap-5 py-24">
	<h1 class="h1">Register</h1>
	<div class="col-span-2">
		<p class="">Vgl. für detailliertere Angaben den Index bei Schwartz.</p>
		<p class="">Ortsspeziﬁsche Adjektive sind unter Ortsnamen subsumiert</p>
	</div>
	<div class="col-span-1 col-start-1">
		<h2 class="h2 mb-4">Orte</h2>
		<div class="bg-surface-100-900 h-[70vh] overflow-y-scroll p-3">
			{@render accordion(placeLabels, placesGrouped, accordionPlaces)}
		</div>
	</div>
	<div class="col-span-1 col-start-2">
		<h2 class="h2 mb-4">Personen</h2>
		<div class="bg-surface-100-900 h-[70vh] overflow-y-scroll p-3">
			{@render accordion(peopleLabels, peopleGrouped, accordionPeople)}
		</div>
	</div>
</div>

<style>
	@reference "tailwindcss";
	@reference "@skeletonlabs/skeleton";

	:global([data-type='register-doc-key']) {
		@apply font-bold;
	}
	:global([data-type='register-unit']) {
		@apply ml-2;
	}
</style>
