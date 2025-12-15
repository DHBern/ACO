<script>
	import { litData } from '$lib/data/get_alldata_testing.js';
	let { openState = $bindable(false) } = $props();
</script>

<div class="literatureList mx-auto max-w-[1500px] py-24">
	{@html litData}
</div>

<style>
	@reference "tailwindcss";
	.literatureList {
		:global(.rp-heading_1) {
			@apply mt-10 text-5xl leading-tight font-semibold;
		}
		:global(section):not(:first-of-type) {
			@apply mt-20;
		}
		:global(.rp-heading_2) {
			@apply text-4xl leading-tight font-semibold;
		}
		:global(li) {
			@apply mt-8 pl-6 -indent-6 text-2xl;
		}
	}
</style>
