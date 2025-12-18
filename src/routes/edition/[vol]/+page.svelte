<script lang="ts">
	import TOC from '../TOC.svelte';
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	import { base } from '$app/paths';

	let { data } = $props();

	onMount(() => {
		// Redirect to first unit on requested page
		if (data.pageParam && data.pageParamRedirect.found) {
			goto(
				`${base}/edition/${data.vol}/${data.pageParamRedirect.schwartzSlug}/${data.pageParamRedirect.unitSlug}?page=${data.pageParamRedirect.page}`
			);
		}
	});
</script>

<div class="mx-auto max-w-[1500px] py-24">
	<TOC accordionStateInit={data.vol} />
</div>
