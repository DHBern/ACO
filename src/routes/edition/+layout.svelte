<script lang="ts">
	let { children } = $props();
</script>

<!-- Content -->
<div class="absolute left-0 top-[80px] h-[calc(100%-80px)]">
	{@render children()}
</div>
