<script>
	import { base } from '$app/paths';
	import { Accordion } from '@skeletonlabs/skeleton-svelte';
	let { data } = $props();

	let accordionPlaces = $state({ value: '' });
	let accordionPeople = $state({ value: '' });

	function convertUnit(unit) {
		if (unit[0] === 'Z') {
			//! Beware: This assumes that line-references are only present in single-unit documents (i.e. unit="text"), which is true for Band I but may change in Band II/III
			return `/text?line=${unit.slice(2)}`;
		} else {
			return `/${unit}`;
		}
	}
</script>

{#snippet accordion(dataObject, accordionState)}
	<Accordion {accordionState} onValueChange={(e) => (accordionState.value = e.value)} multiple>
		{#each dataObject.map((el) => el.label) as label, idx}
			<Accordion.Item value={label}>
				<h3>
					<Accordion.ItemTrigger class="hover:bg-primary-200/60 hover:dark:bg-primary-500"
						><span class="text-2xl font-bold">{label}</span></Accordion.ItemTrigger
					>
				</h3>
				<Accordion.ItemContent>
					<div class="prose text-xl">
						<ul>
							{#each Object.keys(dataObject[idx]['loc-s']) as docKey}
								<li>
									<span data-type="register-doc-key">{docKey}</span>
									{#each dataObject[idx]['loc-s'][docKey] as unit}
										<a
											href={`${base}/dokumente/vol1/${docKey}${convertUnit(unit)}`}
											data-type="register-unit"
											target="_blank"
											rel="noopener noreferrer">{unit}</a
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

<div class="register">
	<h1 class="h1">Register</h1>

	<!-- Kommentar -->
	<div class="">
		<p class="">Vgl. für detailliertere Angaben den Index bei Schwartz.</p>
		<p class="">Ortsspeziﬁsche Adjektive sind unter Ortsnamen subsumiert</p>
	</div>

	<!-- Sitemap -->
	<nav class="lg:hidden">
		<ul>
			<li><p class="text-secondary-500!"><a href="#Orte">&rarr; Zum Ortsregister</a></p></li>
			<li>
				<p class="text-secondary-500!"><a href="#Personen">&rarr; Zum Personenregister</a></p>
			</li>
		</ul>
	</nav>

	<!-- Accordions with Registers -->
	<div class="mx-10 mt-10 grid grid-cols-2 gap-x-10 gap-y-15 lg:mx-2">
		<div class="col-span-2 col-start-1 shadow-md lg:col-span-1">
			<h2
				id="Orte"
				class="text-surface-950-50 bg-primary-200/60 dark:bg-primary-500 mt-0! rounded-t-lg p-2 pl-4 text-2xl font-bold"
			>
				Orte
			</h2>
			<div
				class="innerShadow bg-surface-50 dark:bg-surface-900 h-[70vh] overflow-y-scroll rounded-b-lg p-3"
			>
				{@render accordion(data.places, accordionPlaces)}
			</div>
		</div>
		<div class="col-span-2 col-start-1 shadow-md lg:col-span-1 lg:col-start-2">
			<h2
				id="Personen"
				class="text-surface-950-50 bg-primary-200/60 dark:bg-primary-500 mt-0! rounded-t-lg p-2 pl-4 text-2xl font-bold"
			>
				Personen
			</h2>
			<div
				class="innerShadow bg-surface-50 dark:bg-surface-900 h-[70vh] overflow-y-scroll rounded-b-lg p-3"
			>
				{@render accordion(data.people, accordionPeople)}
			</div>
		</div>
	</div>
</div>

<style>
	@reference "tailwindcss";
	@reference "@skeletonlabs/skeleton";

	.register :global([data-type='register-doc-key']) {
		@apply text-surface-950-50 font-bold;
	}
	.register :global([data-type='register-unit']) {
		@apply text-surface-950-50 ml-2;
	}
	.innerShadow {
		@apply shadow-[inset_0_4px_6px_-1px_rgba(0,0,0,0.1),inset_0_2px_4px_-1px_rgba(0,0,0,0.06)];
	}
</style>
