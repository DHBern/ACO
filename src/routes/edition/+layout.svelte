<script lang="ts">
	let { children } = $props();
</script>

<!-- Content -->
<div class="left-0 top-[80px] mx-auto h-[calc(100%-80px)] w-[80%] bg-white p-5">
	{@render children()}
</div>
