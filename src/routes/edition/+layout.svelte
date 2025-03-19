<script lang="ts">
	let { children } = $props();
</script>

<!-- Content -->
<div class="left-0 top-[80px] h-[calc(100%-80px)] px-[10%] p-5">
	{@render children()}
</div>
