<script>
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';

	let { data } = $props();

	onMount(() => {
		goto(`./${data.slug_doc}/${data.docMetadata.slugs?.[0]}`);
	});
</script>
