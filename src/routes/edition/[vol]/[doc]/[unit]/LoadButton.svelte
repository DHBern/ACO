<script>
	let { node = $bindable(), isDisabled, type, data, myUnits, clickHandler, classes } = $props();
</script>

{#if type == 'prev'}
	<div class={`containerLoadButtonsTop flex justify-start ${classes}`} bind:this={node}>
		{#if !isDisabled}
			<button
				disabled={isDisabled}
				class="shadow-4xl m-3 mx-110 block max-h-10 min-w-[50px] bg-red-300 px-5 py-1"
				type="button"
				onclick={() => {
					clickHandler(myUnits);
				}}
			>
				{#if isDisabled}
					end reached
				{:else}
					<span class="font-bold">{myUnits[0].prevLabel}</span> laden
				{/if}
			</button>
		{/if}
	</div>
{:else if type == 'next'}
	<div class={`containerLoadButtonsBottom flex justify-start ${classes}`} bind:this={node}>
		{#if data.docMetadata.slugs.findIndex((unit) => unit === myUnits[myUnits.length - 1].nextSlug) + 1}
			{#if !isDisabled}
				<button
					disabled={isDisabled}
					class="shadow-4xl m-3 mx-110 block max-h-10 min-w-[50px] bg-red-300 px-5 py-1"
					type="button"
					onclick={() => {
						clickHandler(myUnits);
					}}
				>
					{#if isDisabled}
						end reached
					{:else}
						<span class="font-bold">{myUnits[myUnits.length - 1].nextLabel}</span> laden
					{/if}
				</button>
			{/if}
		{/if}
	</div>
{/if}
