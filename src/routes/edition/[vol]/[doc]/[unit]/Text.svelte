<script>
	let { text } = $props();
</script>

<!-- 'whitespace-nowrap' instead of 'truncate' would make text overflow -->
<div class="truncate">
	{@html text}
</div>

<style>
	:global(span[type='head_key']) {
		font-weight: 800;
		margin-right: 4px;
	}
	:global(span[data-ids]) {
		background-color: rgb(255, 255, 221);
		cursor: pointer;

		&.multiple-ids {
			background-color: rgb(255, 255, 153);
		}
	}
	:global(span.mark.highlighted) {
		background-color: rgba(148, 255, 207, 0.491);
	}
	:global(.note-start::before, .note-end::before) {
		color: blue;
		margin-right: 1px;
		margin-left: 3px;
	}
	:global(.note-start::before) {
		/* content: '[●'; */
	}
	:global(.note-end::before) {
		/* content: '●]'; */
	}
	:global(.note-start.highlighted::before, .note-end.highlighted::before) {
		color: red;
	}

	:global(.multimark-popup a) {
		cursor: pointer;
	}
</style>
