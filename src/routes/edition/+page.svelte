<script>
	import TOC from './TOC.svelte';
	let { data } = $props();
</script>

<div class="mx-auto max-w-[1500px] py-24">
	<TOC metaData={data.metaData} />
</div>
