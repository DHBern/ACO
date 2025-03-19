<script>
	import { goto } from '$app/navigation';
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
	{#each types as type}
		<h2 class="mt-10 mb-4 text-2xl font-bold">{type}</h2>
		<ul>
			{#each docs[type] as doc}
				<li
					class="mb-2 font-semibold text-[var(--aco-teal-secondary)] hover:text-[var(--aco-orange)]"
				>
					<a
						href="#"
						onclick={() => {
							goto(`edition/1/${doc.slug}/${doc.units[0]}`);
						}}
					>
						<span class="text-lg italic">"{doc.title}"</span>

						<span class="ml-2 text-sm text-[var(--aco-orange)]">
							(
							<span class="text-[var(--aco-orange-secondary)]">{doc.slug}</span> |
							<span class="">{doc.num}</span>
							)
						</span>
					</a>
				</li>
			{/each}
		</ul>
	{/each}
</div>
