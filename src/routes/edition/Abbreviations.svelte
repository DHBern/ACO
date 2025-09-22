<script>
	import { abbData } from '$lib/data/get_alldata_testing.js';
	import { Accordion } from '@skeletonlabs/skeleton-svelte';
	let accordionStateAbb = $state(['abb']);
	let abbs = abbData;
</script>

<div class="flex-row flex-wrap bg-[var(--aco-gray-2)] dark:bg-[var(--aco-gray-3)]">
	<Accordion
		{accordionStateAbb}
		onValueChange={(e) => (accordionStateAbb = e.value)}
		collapsible
		classes="containerAbbreviations shadow-md mb-4"
	>
		<Accordion.Item value="abb" classes="">
			{#snippet lead()}{/snippet}
			{#snippet control()}<span class="text-xl font-bold text-black dark:text-black"
					>Abkürzungsverzeichnis</span
				>{/snippet}
			{#snippet panel()}
				<div class="grid grid-cols-[150px_auto] gap-4 pb-5 pl-13">
					{#each Object.keys(abbs) as key}
						<span class="col-span-1 col-start-1 font-bold">{key}</span>
						<span class="col-span-1 col-start-2">{abbs[key]}</span>
					{/each}
				</div>
			{/snippet}
		</Accordion.Item>
	</Accordion>
</div>
