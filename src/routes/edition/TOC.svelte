<script>
	import { base } from '$app/paths';
	import { Accordion } from '@skeletonlabs/skeleton-svelte';

	let { metaData, accordionStateInit = 'vol1' } = $props();
	let accordionState = $state([accordionStateInit]);

	// The first volume is currently hardcoded
	let volumes = [
		{ slug: 'vol2', label: 'Band 2', number: 2 },
		{ slug: 'vol3', label: 'Band 3', number: 3 }
	];

	const types = ['CV', 'CPal', 'CVer', 'CU'];
	let docs = {};
	docs.CV = metaData.filter(({ type: t }) => t === 'CV');
	docs.CPal = metaData.filter(({ type: t }) => t === 'CPal');
	docs.CVer = metaData.filter(({ type: t }) => t === 'CVer');
	docs.CU = metaData.filter(({ type: t }) => t === 'CU');
</script>

<h1 class="h1">Edition</h1>
<p>Nachfolgend die Dokumente geordnet nach Band und Dokumententyp.</p>

<div class="toc bg-surface-50-950 mt-10 flex-row flex-wrap">
	<Accordion
		value={accordionState}
		onValueChange={(e) => (accordionState = e.value)}
		multiple
		class="innerShadow bg-surface-50 dark:bg-surface-900 mb-4"
	>
		<Accordion.Item value="vol1">
			<h3>
				<Accordion.ItemTrigger
					class="bg-primary-200/60 dark:bg-primary-500 hover:bg-primary-200 hover:dark:bg-primary-400"
					><span class="text-surface-950-50 text-2xl font-bold">Band 1</span>
				</Accordion.ItemTrigger>
			</h3>
			<Accordion.ItemContent>
				<div class="pt-5 pl-5">
					<p>
						<a
							href="{base}/edition/vol1/vorwort"
							class="hover:text-secondary-700-300 text-surface-950-50 text-xl font-bold">Vorwort</a
						>
					</p>
					<p>
						<a
							href="{base}/edition/vol1/einleitung"
							class="hover:text-secondary-700-300 text-surface-950-50 text-xl font-bold"
							>Einleitung</a
						>
					</p>
				</div>

				<!-- Sitemap -->
				<nav class="col-span-2 p-5 lg:hidden">
					<ul>
						<li>
							<p class="text-secondary-500!">
								<a href="#vol1_doc">&rarr; Sortierung nach ACO-Dokuenten</a>
							</p>
						</li>
						<li>
							<p class="text-secondary-500!">
								<a href="#vol1_schwartz">&rarr; Sortierung nach Schwartz</a>
							</p>
						</li>
					</ul>
				</nav>

				<div class="grid grid-cols-2 gap-x-20 gap-y-5 p-5">
					<!-- ACO order -->
					<div id="vol1_doc" class="col-span-2 col-start-1 lg:col-span-1">
						<h2 class="h2 mb-4">Dokumente ACO</h2>
						<div class="text-xl lg:pb-10">
							<ul class="">
								{#each metaData.slice().sort((a, b) => a.acoDocNum - b.acoDocNum) as doc (doc.slug)}
									<li class="hover:**:text-secondary-700-300 mb-1">
										<a href="{base}/edition/vol1/{doc.slug}/{doc.unitSlugs[0]}">
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
					<div id="vol1_schwartz" class="col-span-2 col-start-1 lg:col-span-1 lg:col-start-2">
						<h2 class="h2 mb-4">Konkordanz Schwartz</h2>
						{#each types as type (type)}
							<div class="text-xl lg:pb-10">
								<ul class="">
									{#each docs[type]
										.slice()
										.sort((a, b) => a.schwartzNum - b.schwartzNum) as doc (doc.slug)}
										<li class="hover:**:text-secondary-700-300 mb-1">
											<a href="{base}/edition/vol1/{doc.slug}/{doc.unitSlugs[0]}">
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
			<Accordion.Item value={volume.slug}>
				<h3>
					<Accordion.ItemTrigger
						class="bg-primary-200/60 dark:bg-primary-500 hover:bg-primary-200 hover:dark:bg-primary-400"
						><span class="text-surface-950-50 text-2xl font-bold">{volume.label}</span>
					</Accordion.ItemTrigger>
				</h3>
				<Accordion.ItemContent
					><div class="p-5">
						<p class="hover:text-primary-400-600 text-surface-950-50">Band in Bearbeitung</p>
					</div>
				</Accordion.ItemContent>
			</Accordion.Item>
		{/each}
	</Accordion>
</div>

<style>
	@reference "tailwindcss";
	@reference "@skeletonlabs/skeleton";

	.toc :global(.innerShadow) {
		@apply shadow-md;
	}
</style>
