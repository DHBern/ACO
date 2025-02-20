<script>
	import { handlePopupClick } from '$lib/functions/floatingApparatus';
	let { multiMarkPopupIds, selectedNote } = $props();
</script>

<div
	class="multimark-popup absolute left-5 top-1/2 z-10 rounded-md border-2 border-[#94ffcf] border-white bg-[#e0fff1] p-5"
>
	<ul>
		{#each multiMarkPopupIds.ids as id}
			<li>
				<button
					onclick={() => {
						handlePopupClick(id, selectedNote, multiMarkPopupIds);
					}}><p class="color-sky-900">{id}</p></button
				>
			</li>
		{/each}
	</ul>
</div>

<style>
</style>
