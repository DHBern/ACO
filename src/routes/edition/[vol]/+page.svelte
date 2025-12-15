<script lang="ts">
	import TOC from '../TOC.svelte';
	let { data } = $props();
</script>

<TOC accordionStateInit={data.vol} />
