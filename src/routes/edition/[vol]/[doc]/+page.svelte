<script>
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	import { replaceState } from '$app/navigation';

	let { data } = $props();

	onMount(() => {
		goto(`./${data.slug_doc}/${data.docMetadata.slugs?.[0]}`);
		// replaceState(`./${data.slug_doc}/${data.docMetadata.slugs?.[0]}`, ()=>{});
	});
</script>
