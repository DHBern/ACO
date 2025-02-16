<script>
	let { text, notePositions } = $props();
	let hoveredNote = null;

	function highlightText(id) {
		hoveredNote = id;
	}

	function clearHighlight() {
		hoveredNote = null;
	}
</script>

<p class="mb-8">{@html text}</p>

<!-- <div class="relative">
	{#each notePositions as { id, index }}
		<div
			class="text-part relative inline-block"
			onmouseenter={() => highlightText(id)}
			onmouseleave={clearHighlight}
		>
			{#if hoveredNote === id}
				<mark class="bg-sky-200">
					{@html text.slice(index, text.indexOf('<note_end note_id="' + id + '" />'))}
				</mark>
			{:else}
				{@html text.slice(index, text.indexOf('<note_end note_id="' + id + '" />'))}
			{/if}
		</div>
	{/each}
</div>

<div class="relative">
	{#each notePositions as { id, index }}
		<div class="absolute right-0 h-full w-1 bg-red-200" style="top: {index * 20}px;"></div>
	{/each}
</div> -->
