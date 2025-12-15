<script>
	let { node = $bindable(), type, data, loadedUnits, clickHandler, classes } = $props();
</script>

{#if type == 'prev'}
	<div class={`containerLoadButtonsTop flex justify-start ${classes}`} bind:this={node}>
		<button
			class="bg-secondary-300-700 m-3 mx-110 block max-h-10 min-w-[200px] px-5 py-1"
			type="button"
			onclick={() => {
				clickHandler(loadedUnits);
			}}
		>
			Kapitel <span class="font-bold">{loadedUnits[0].prevLabel}</span> laden
		</button>
	</div>
{:else if type == 'next'}
	<div class={`containerLoadButtonsBottom flex justify-start ${classes}`} bind:this={node}>
		{#if data.docMetadata.slugs.findIndex((unit) => unit === loadedUnits[loadedUnits.length - 1].nextSlug) + 1}
			<button
				class="bg-secondary-300-700 m-3 mx-110 block max-h-10 min-w-[150px] px-5 py-1"
				type="button"
				onclick={() => {
					clickHandler(loadedUnits);
				}}
			>
				Kapitel <span class="font-bold">{loadedUnits[loadedUnits.length - 1].nextLabel}</span> laden
			</button>
		{/if}
	</div>
{/if}
