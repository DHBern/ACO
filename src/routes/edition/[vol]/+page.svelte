<script lang="ts">
	import TOC from '../TOC.svelte';
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	import { base } from '$app/paths';

	let { data } = $props();

	onMount(() => {
		if (data.pageInfo.found) {
			goto(
				`${base}/edition/${data.vol}/${data.pageInfo.schwartzSlug}/${data.pageInfo.unitSlug}?page=${data.pageInfo.page}`
			);
		}
	});
</script>

<div class="mx-auto max-w-[1500px] py-24">
	<TOC accordionStateInit={data.vol} />
</div>
