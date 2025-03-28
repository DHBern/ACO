<script>
	import { base } from '$app/paths';
	import { textData } from '$lib/data/get_data';
	import { Accordion } from '@skeletonlabs/skeleton-svelte';
	import Abbreviations from './Abbreviations.svelte';

	let accordionState = $state(['Band 1']);
	
	let volumes = [
		{ label: 'Band 2', number: 2 },
		{ label: 'Band 3', number: 3 }
	];

	const types = ['CV', 'CPal', 'CVer', 'CU'];
	let docs = {};
	docs.CV = textData.filter(({ type: t }) => t === 'CV');
	docs.CPal = textData.filter(({ type: t }) => t === 'CPal');
	docs.CVer = textData.filter(({ type: t }) => t === 'CVer');
	docs.CU = textData.filter(({ type: t }) => t === 'CU');

</script>

<h1>Dokumente</h1>

<div class="flex-row flex-wrap bg-[var(--aco-gray-2)] dark:bg-[var(--aco-gray-3)]">
	<Accordion
		{accordionState}
		onValueChange={(e) => (accordionState = e.value)}
		collapsible
		classes="containerDocHead shadow-md mb-4"
	>
		<Accordion.Item value="Band 1" classes="">
			{#snippet lead()}{/snippet}
			{#snippet control()}<span class="text-xl font-bold text-black dark:text-black">Band 1</span
				>{/snippet}
			{#snippet panel()}
				<div class="pb-5 pl-13">
					<a
						href="{base}/edition/1/vorwort"
						class="text-lg text-black hover:text-[var(--aco-orange)] dark:text-black"
						>Vorwort zum ersten Band</a
					>
				</div>
				<div class="grid grid-cols-2 gap-20">
					<!-- ACO order -->
					<div class="col-span-1 col-start-1 p-5">
						<h2 class="mb-4">Dokumente</h2>
						<div class="pb-10 pl-8">
							<ul>
								{#each textData.slice().sort((a, b) => a.acoNum - b.acoNum) as doc (doc.slug)}
									<li class="mb-1 hover:**:text-[var(--aco-orange)]">
										<a href="{base}/edition/1/{doc.slug}/{doc.unitSlugs[0]}">
											<span class="font-bold text-black dark:text-black">{doc.acoNumLabel}:</span>
											<span class="text-[var(--aco-gray-4)] italic dark:text-[var(--aco-gray-4)]"
												>{doc.title}</span
											>
											<span class="ml-1">
												<span class="text-[var(--aco-orange-light)]">({doc.slug})</span>
											</span>
										</a>
									</li>
								{/each}
							</ul>
						</div>
					</div>

					<!-- Schwartz order -->
					<div class="col-span-1 col-start-2 p-5">
						<h2 class="mb-4">Konkordanz Schwartz</h2>
						{#each types as type (type)}
							<div class="pb-10 pl-8">
								<ul>
									{#each docs[type]
										.slice()
										.sort((a, b) => a.schwartzSlugNum - b.schwartzSlugNum) as doc (doc.slug)}
										<li class="mb-1 hover:**:text-[var(--aco-orange)]">
											<a href="{base}/edition/1/{doc.slug}/{doc.unitSlugs[0]}">
												<span class="font-bold text-black dark:text-black">{doc.slug}:</span>
												<span class="text-[var(--aco-gray-4)] italic dark:text-[var(--aco-gray-4)]"
													>{doc.title}</span
												>
												<span class="ml-1">
													<span class="text-[var(--aco-orange-light)]">({doc.acoNumLabel})</span>
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
				{#snippet control()}<span class="text-xl font-bold text-black dark:text-black"
						>{volume.label}</span
					>{/snippet}
				{#snippet panel()}
					<div class="pb-10 pl-8">
						<p class="font-bold text-black hover:text-[var(--aco-teal)] dark:text-black">
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
									<li class="mb-1 hover:**:text-[var(--aco-orange)]">...</li>
								</ul>
							</div>
						</div>
						<!-- Schwartz order -->
						<div class="col-span-1 col-start-2 p-5">
							<h2>Konkordanz Schwartz</h2>
							{#each types as type (type)}
								<div class="pb-10 pl-8">
									<ul>
										<li class="mb-1 hover:**:text-[var(--aco-orange)]">...</li>
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

<!-- Abbreviations -->
<Abbreviations />

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
