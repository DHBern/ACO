<script>
	import { litData } from '$lib/data/get_alldata_testing.js';
	let { openState = $bindable(false) } = $props();
</script>

<div class="mx-auto max-w-[1500px] py-24">
	{@html litData}
</div>

<style>
	@reference "tailwindcss";

	:global(.rp-heading_1) {
		@apply mt-10 text-5xl leading-tight font-semibold;
	}
	:global(.rp-heading_2) {
		@apply mt-10 text-4xl leading-tight font-semibold;
	}
	:global(li) {
		@apply mt-4 text-2xl;
	}
</style>
