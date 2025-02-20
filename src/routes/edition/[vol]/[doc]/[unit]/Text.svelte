<script>
	let { text } = $props();
</script>

<!-- 'whitespace-nowrap' instead of 'truncate' would make text overflow -->
<div class="truncate">
	{@html text}
</div>

<style>
	/* :global(.nowrap p) {
		white-space: nowrap;
	} */

	/* Prevent selecting <br /> on copy-paste */
	:global(.copyWithoutLinebreaks br) {
		user-select: none;
	}

	:global(span[type='head_key']) {
		font-weight: 800;
		margin-right: 4px;
	}
	:global(span[note_ids]) {
		background-color: rgb(255, 255, 221);
		cursor: pointer;

		&.multiple-ids {
			background-color: rgb(255, 255, 153);
		}
	}
	:global(span.mark.highlighted) {
		background-color: rgba(148, 255, 207, 0.491);
	}
	:global(note_start::before, note_end::before) {
		color: blue;
		margin-right: 1px;
		margin-left: 3px;
	}
	:global(note_start::before) {
		/* content: '[●'; */
	}
	:global(note_end::before) {
		/* content: '●]'; */
	}
	:global(note_start.highlighted::before, note_end.highlighted::before) {
		color: red;
	}

	:global(.multimark-popup a) {
		cursor: pointer;
	}
	:global(reg_link) {
		color: red;
	}
</style>
