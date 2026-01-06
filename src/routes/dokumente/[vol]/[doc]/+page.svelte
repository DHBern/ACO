<script>
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	import { replaceState } from '$app/navigation';
	import { base } from '$app/paths';

	let { data } = $props();

	onMount(() => {
		goto(`${base}/dokumente/${data.slug_vol}/${data.slug_doc}/${data.docMetadata.slugs?.[0]}`);
		// replaceState(`./${data.slug_doc}/${data.docMetadata.slugs?.[0]}`, ()=>{});
	});
</script>
