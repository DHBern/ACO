<script>
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	import { base } from '$app/paths';
	import { page } from '$app/state';

	let { data } = $props();

	onMount(() => {
		goto(`${base}/dokumente/${data.slug_vol}/${data.slug_doc}/${data.docMetadata.slugs?.[0]}?${page.url.searchParams.toString()}`);
	});
</script>
