<script>
	import { base } from '$app/paths';
	import { textData } from '$lib/data/get_data';

	const types = ['CV', 'CPal', 'CVer', 'CU'];
	let docs = {};
	docs.CV = textData.filter(({ type: t }) => t === 'CV');
	docs.CPal = textData.filter(({ type: t }) => t === 'CPal');
	docs.CVer = textData.filter(({ type: t }) => t === 'CVer');
	docs.CU = textData.filter(({ type: t }) => t === 'CU');
</script>

<div class="flex-row flex-wrap pb-30">
	<h1 class="mb-2 text-4xl">Erster Band</h1>
	{#each types as type (type)}
		<h2 class="mt-10 mb-4 text-2xl font-bold">{type}</h2>
		<ul>
			{#each docs[type] as doc (doc.slug)}
				<li class="mb-2 font-semibold text-[var(--aco-teal-light)] hover:text-[var(--aco-orange)]">
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
</div>
