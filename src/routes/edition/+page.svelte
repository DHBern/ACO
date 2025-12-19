<script>
	import TOC from './TOC.svelte';
	let { data } = $props();
</script>

	<TOC metaData={data.metaData} />
