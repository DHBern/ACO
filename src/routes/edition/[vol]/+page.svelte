<script>
	import { goto } from '$app/navigation';
	import { base } from '$app/paths';
	import { onMount } from 'svelte';

	let { data } = $props();

	onMount(() => {
		goto(`${base}/edition`);
	});
</script>
