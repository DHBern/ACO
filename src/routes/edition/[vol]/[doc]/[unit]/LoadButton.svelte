<script>
	let { node = $bindable(), isDisabled, type, data, myUnits, loadfunction, classes } = $props();
</script>

{#if type == 'prev'}
	<div class={`containerLoadButtonsTop flex justify-start ${classes}`} bind:this={node}>
		<button
			disabled={isDisabled}
			class="shadow-4xl m-3 mx-110 block min-w-[50px] bg-red-300 px-5 py-1"
			type="button"
			onclick={() => {
				loadfunction(myUnits);
			}}
		>
			{#if isDisabled}
				end reached
			{:else}
				<span class="font-bold">{myUnits[0].prevLabel}</span> laden
			{/if}
		</button>
	</div>
{:else if type == 'next'}
	<div class={`containerLoadButtonsBottom flex justify-start ${classes}`} bind:this={node}>
		{#if data.docMetadata.slugs.findIndex((unit) => unit === myUnits[myUnits.length - 1].nextSlug) + 1}
			<button
				disabled={isDisabled}
				class="shadow-4xl m-3 mx-110 block min-w-[50px] bg-red-300 px-5 py-1"
				type="button"
				onclick={() => {
					loadfunction(myUnits);
				}}
			>
				{#if isDisabled}
					end reached
				{:else}
					<span class="font-bold">{myUnits[myUnits.length - 1].nextLabel}</span> laden
				{/if}
			</button>
		{/if}
	</div>
{/if}
