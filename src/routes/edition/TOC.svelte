<script>
	import { base } from '$app/paths';
	import { metaData } from '$lib/data/get_alldata_testing.js';
	import { Accordion } from '@skeletonlabs/skeleton-svelte';

	let accordionState = $state(['Band 1']);
	let volumes = [
		{ label: 'Band 2', number: 2 },
		{ label: 'Band 3', number: 3 }
	];

	const types = ['CV', 'CPal', 'CVer', 'CU'];
	let docs = {};
	docs.CV = metaData.filter(({ type: t }) => t === 'CV');
	docs.CPal = metaData.filter(({ type: t }) => t === 'CPal');
	docs.CVer = metaData.filter(({ type: t }) => t === 'CVer');
	docs.CU = metaData.filter(({ type: t }) => t === 'CU');
</script>

<h1 class="h1">Dokumente</h1>

<div class="bg-surface-50-950 flex-row flex-wrap">
	<Accordion
		value={accordionState}
		onValueChange={(e) => (accordionState = e.value)}
		collapsible
		classes="shadow-md mb-4"
	>
		<Accordion.Item value="Band 1" classes="">
			{#snippet lead()}{/snippet}
			{#snippet control()}<span class="text-surface-950-50 text-xl font-bold">Band 1</span
				>{/snippet}
			{#snippet panel()}
				<div class="p-10">
					<a
						href="{base}/edition/1/vorwort"
						class="hover:text-secondary-700-300 text-surface-950-50 text-lg"
						>Vorwort zum ersten Band</a
					>
				</div>
				<div class="grid grid-cols-2 gap-20 p-10">
					<!-- ACO order -->
					<div class="col-span-1 col-start-1">
						<h2 class="mb-4">Dokumente ACO</h2>
						<div class="pb-10 text-lg">
							<ul>
								{#each metaData.slice().sort((a, b) => a.acoDocNum - b.acoDocNum) as doc (doc.slug)}
									<li class="hover:**:text-secondary-700-300 mb-1">
										<a href="{base}/edition/1/{doc.slug}/{doc.unitSlugs[0]}">
											<span class="text-surface-950-50 font-bold">{doc.acoDocLabel}:</span>
											<span class="text-surface-950-50">{@html doc.title}</span>
											<span class="ml-1">
												<span class="text-secondary-600-400">({doc.slug})</span>
											</span>
										</a>
									</li>
								{/each}
							</ul>
						</div>
					</div>

					<!-- Schwartz order -->
					<div class="col-span-1 col-start-2">
						<h2 class="mb-4">Konkordanz Schwartz</h2>
						{#each types as type (type)}
							<div class="pb-10 text-lg">
								<ul>
									{#each docs[type]
										.slice()
										.sort((a, b) => a.schwartzNum - b.schwartzNum) as doc (doc.slug)}
										<li class="hover:**:text-secondary-700-300 mb-1">
											<a href="{base}/edition/1/{doc.slug}/{doc.unitSlugs[0]}">
												<span class="text-surface-950-50 font-bold">{doc.slug}:</span>
												<span class="text-surface-950-50">{@html doc.title}</span>
												<span class="ml-1">
													<span class="text-primary-600-400">({doc.acoDocLabel})</span>
												</span>
											</a>
										</li>
									{/each}
								</ul>
							</div>
						{/each}
					</div>
				</div>
			{/snippet}
		</Accordion.Item>

		{#each volumes as volume}
			<Accordion.Item value={volume.label}>
				{#snippet lead()}{/snippet}
				{#snippet control()}<span class="text-surface-950-50 text-xl font-bold">{volume.label}</span
					>{/snippet}
				{#snippet panel()}
					<div class="pb-10 pl-8">
						<p class="hover:text-primary-400-600 text-surface-950-50 font-bold">
							<a href="{base}/edition/1/vorwort"
								>Vorwort zum {volume.number == 2 ? 'zweiten Band' : 'dritten Band'}</a
							>
						</p>
					</div>
					<div class="grid grid-cols-2 gap-20">
						<!-- ACO order -->
						<div class="col-span-1 col-start-1 p-5">
							<h2>Dokumente</h2>
							<div class="pb-10 pl-8">
								<ul>
									<li class="hover:**:text-secondary-400-600 mb-1">...</li>
								</ul>
							</div>
						</div>
						<!-- Schwartz order -->
						<div class="col-span-1 col-start-2 p-5">
							<h2>Konkordanz Schwartz</h2>
							{#each types as type (type)}
								<div class="pb-10 pl-8">
									<ul>
										<li class="hover:**:text-secondary-400-600 mb-1">...</li>
									</ul>
								</div>
							{/each}
						</div>
					</div>
				{/snippet}
			</Accordion.Item>
		{/each}
	</Accordion>
</div>

<style>
	@reference "tailwindcss";
	@reference "@skeletonlabs/skeleton";
	h1 {
		@apply text-secondary-700-300 mb-2 text-3xl font-bold;
	}
	h2 {
		@apply text-xl font-bold;
	}
	h3 {
		@apply text-lg font-bold;
	}
</style>
