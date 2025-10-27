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
<p>Nachfolgend die Dokumente geordnet nach Band und Dokumententyp.</p>

<div class="bg-surface-50-950 mt-10 flex-row flex-wrap">
	<Accordion
		value={accordionState}
		onValueChange={(e) => (accordionState = e.value)}
		multiple
		class="mb-4 shadow-md"
	>
		<Accordion.Item value="Band 1">
			<h3>
				<Accordion.ItemTrigger class="bg-primary-200-800/60 hover:bg-primary-200-800"
					><span class="text-surface-950-50 text-2xl font-bold">Band 1</span>
				</Accordion.ItemTrigger>
			</h3>
			<Accordion.ItemContent>
				<div class="p-10">
					<a
						href="{base}/edition/1/vorwort"
						class="hover:text-secondary-700-300 text-surface-950-50 text-xl"
						>Vorwort zum ersten Band</a
					>
				</div>
				<div class="grid grid-cols-2 gap-20 p-10">
					<!-- ACO order -->
					<div class="col-span-1 col-start-1">
						<h2 class="h2 mb-4">Dokumente ACO</h2>
						<div class="pb-10 text-xl">
							<ul class="">
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
						<h2 class="h2 mb-4">Konkordanz Schwartz</h2>
						{#each types as type (type)}
							<div class="pb-10 text-xl">
								<ul class="">
									{#each docs[type]
										.slice()
										.sort((a, b) => a.schwartzNum - b.schwartzNum) as doc (doc.slug)}
										<li class="hover:**:text-secondary-700-300 mb-1">
											<a href="{base}/edition/1/{doc.slug}/{doc.unitSlugs[0]}">
												<span class="text-surface-950-50 font-bold">{doc.slug}:</span>
												<span class="text-surface-950-50">{@html doc.title}</span>
												<span class="ml-1">
													<span class="text-secondary-600-400">({doc.acoDocLabel})</span>
												</span>
											</a>
										</li>
									{/each}
								</ul>
							</div>
						{/each}
					</div>
				</div>
			</Accordion.ItemContent>
		</Accordion.Item>
		{#each volumes as volume}
			<Accordion.Item value={volume.label}>
				<h3>
					<Accordion.ItemTrigger class="bg-primary-200-800/60 hover:bg-primary-200-800"
						><span class="text-surface-950-50 text-2xl font-bold">{volume.label}</span>
					</Accordion.ItemTrigger>
				</h3>
				<Accordion.ItemContent
					><div class="py-5 pl-8">
						<p class="hover:text-primary-400-600 text-surface-950-50">Band in Bearbeitung</p>
					</div>
				</Accordion.ItemContent>
			</Accordion.Item>
		{/each}
	</Accordion>
</div>
