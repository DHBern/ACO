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
	<h1 class="text-4xl">Erster Band</h1>
	{#each types as type}
		<h2 class="mt-10 text-2xl">{type}</h2>
		<ul>
			{#each docs[type] as doc}
				<li class="hover:regular mb-1 text-[var(--aco-secondary)] hover:text-[var(--aco-teal)]">
					<button
						onclick={() => {
							goto(`edition/1/${doc.slug}/${doc.units[0]}`);
						}}
					>
						<span class="text-lg italic">"{doc.title}"</span>

						<span class="ml-2 text-sm">
							(
							<span class="text-[var(--aco-teal)]">{doc.slug}</span> |
							<span class="">{doc.num}</span>
							)
						</span>
					</button>
				</li>
			{/each}
		</ul>
	{/each}
</div>
