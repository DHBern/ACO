<script>
	import { base } from '$app/paths';
	import { textData } from '$lib/data/get_data';
	import { Accordion } from '@skeletonlabs/skeleton-svelte';

	let accordionState = $state('Band 1');
	let volumeLabels = ['Band 2', 'Band 3', 'Band 4', 'Band 5', 'Band 6', 'Band 7'];
	const types = ['CV', 'CPal', 'CVer', 'CU'];
	let docs = {};
	docs.CV = textData.filter(({ type: t }) => t === 'CV');
	docs.CPal = textData.filter(({ type: t }) => t === 'CPal');
	docs.CVer = textData.filter(({ type: t }) => t === 'CVer');
	docs.CU = textData.filter(({ type: t }) => t === 'CU');
</script>

<h1>Dokumente</h1>

<div class="flex-row flex-wrap bg-[var(--aco-gray-2)]">
	<Accordion
		{accordionState}
		onValueChange={(e) => (accordionState = e.value)}
		collapsible
		classes="containerDocHead shadow-md mb-4"
	>
		<Accordion.Item value="Band 1">
			{#snippet lead()}{/snippet}
			{#snippet control()}<span class="text-xl font-bold">Band 1</span>{/snippet}
			{#snippet panel()}
				{#each types as type (type)}
					<h2 class="mt-10 mb-4">{type}</h2>
					<ul>
						{#each docs[type] as doc (doc.slug)}
							<li
								class="mb-2 font-semibold text-[var(--aco-teal-light)] hover:text-[var(--aco-orange)]"
							>
								<a href="{base}/edition/1/{doc.slug}/{doc.unitSlugs[0]}">
									<span class="text-lg italic">"{doc.title}"</span>
									<span class="ml-2 text-sm text-[var(--aco-orange)]">
										<span class="mr-1 text-[var(--aco-orange-light)]">{doc.slug}</span>
										|
										<span class="">{doc.num}</span>
									</span>
								</a>
							</li>
						{/each}
					</ul>
				{/each}
			{/snippet}
		</Accordion.Item>
		{#each volumeLabels as volumeLabel}
			<Accordion.Item value={volumeLabel}>
				{#snippet lead()}{/snippet}
				{#snippet control()}<span class="text-xl font-bold">{volumeLabel}</span>{/snippet}
				{#snippet panel()}
					<p>...</p>
				{/snippet}
			</Accordion.Item>
		{/each}
	</Accordion>
</div>

<style>
	@reference "tailwindcss";
	h1 {
		@apply mb-2 text-3xl font-bold text-[var(--aco-orange)];
	}
	h2 {
		@apply text-xl font-bold;
	}
	h3 {
		@apply text-lg font-bold;
	}
</style>
