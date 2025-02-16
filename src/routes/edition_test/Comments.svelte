<script>
	let { notes, notePositions, text = $bindable() } = $props();

	function handleHighlight(id) {
		text = text.replace(`<note note_id="${id}" />`, '<mark>');
		text = text.replace(`<note_end note_id="${id}" />`, '</mark>');
	}
</script>

<div class="comments-container">
	{#each notePositions as { id, index }}
		<div
			class="relative mb-2 max-h-[50vh] w-[300px] overflow-y-scroll border border-lime-100 bg-[#f9f9f9] p-2"
			style="position: absolute; top: {index * 20}px;"
		>
			<div
				class="mb-2 font-bold"
				onclick={(id) => {
					handleHighlight(id);
				}}
			>
				<strong>Note {id}</strong>
			</div>
			<div class="size-[14px]">
				{notes[id].note_text}
			</div>
		</div>
	{/each}
</div>
