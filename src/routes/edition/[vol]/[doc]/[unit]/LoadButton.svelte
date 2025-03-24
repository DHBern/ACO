<script>
	let { type, data, groupedUnits, classes } = $props();
</script>

{#if type == 'prev'}
    <div class={`flex justify-start containerLoadButtonsTop ${classes}`}>
		<button
			class="shadow-4xl m-3 mx-110 block min-w-[50px] bg-red-300 px-5 py-1"
			type="button"
			onclick={(ev) => {
				const firstUnit = groupedUnits[0];
				groupedUnits.unshift({
					slug: firstUnit.prevSlug,
					prevSlug:
						data.docMetadata.slugs[
							data.docMetadata.slugs.findIndex((unit) => unit === firstUnit.prevSlug) - 1 || null
						] || null,
					nextSlug:
						data.docMetadata.slugs[
							data.docMetadata.slugs.findIndex((unit) => unit === firstUnit.prevSlug) + 1 || null
						] || null,
					prevLabel:
						data.docMetadata.labels[
							data.docMetadata.slugs.findIndex((unit) => unit === firstUnit.prevSlug) - 1 || null
						] || null,
					nextLabel:
						data.docMetadata.labels[
							data.docMetadata.slugs.findIndex((unit) => unit === firstUnit.prevSlug) + 1 || null
						] || null,
					text: data.docContent[firstUnit.prevSlug] || '',
					notes: data.notesData[data.slug_doc]?.[firstUnit.prevSlug] || []
				});
			}}><span class="font-bold">{groupedUnits[0].prevLabel}</span> laden</button
		>
	</div>
{:else if type == 'next'}
	<div class={`flex justify-start containerLoadButtonsBottom ${classes}`}>
		{#if data.docMetadata.slugs.findIndex((unit) => unit === groupedUnits[groupedUnits.length - 1].nextSlug) + 1}
			<button
				class="shadow-4xl m-3 mx-110 block min-w-[50px] bg-red-300 px-5 py-1"
				type="button"
				onclick={(ev) => {
					const lastUnit = groupedUnits[groupedUnits.length - 1];
					groupedUnits.push({
						slug: lastUnit.nextSlug,
						prevSlug:
							data.docMetadata.slugs[
								data.docMetadata.slugs.findIndex((unit) => unit === lastUnit.nextSlug) - 1 || null
							] || null,
						nextSlug:
							data.docMetadata.slugs[
								data.docMetadata.slugs.findIndex((unit) => unit === lastUnit.nextSlug) + 1 || null
							] || null,
						prevLabel:
							data.docMetadata.labels[
								data.docMetadata.slugs.findIndex((unit) => unit === lastUnit.nextSlug) - 1 || null
							] || null,
						nextLabel:
							data.docMetadata.labels[
								data.docMetadata.slugs.findIndex((unit) => unit === lastUnit.nextSlug) + 1 || null
							] || null,
						text: data.docContent[lastUnit.nextSlug] || '',
						notes: data.notesData[data.slug_doc]?.[lastUnit.nextSlug] || []
					});
				}}
				><span class="font-bold">{groupedUnits[groupedUnits.length - 1].nextLabel}</span> laden</button
			>
		{/if}
	</div>
{/if}
