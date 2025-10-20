<script>
	import { Switch } from '@skeletonlabs/skeleton-svelte';
	import UnitNavigation from './UnitNavigation.svelte';
	import DocumentMetadata from './DocumentMetadata.svelte';

	import { copyWithoutLinebreaks, marksVisible } from '../../globals.svelte.js';

	let { data, children } = $props();
</script>

<div class="mx-auto max-w-[1800px] py-24">
	<div class="containerDocHead mx-auto max-w-[1200px]">
		<!-- Title -->
		<h1 class="mb-2 text-4xl text-[var(--aco-orange)]">{@html data.docMetadata.toc_title}</h1>

		<!-- Document Metadata -->
		<p class="mb-5">{@html data.docMetadata?.content?.inhalt}</p>
		<DocumentMetadata {data} />

		<!-- Unit-Navigation -->
		<UnitNavigation {data} />

		<!-- Settings -->
		<div class="my-5 flex justify-center gap-5 align-middle">
			<Switch
				name="toggleMarksVisible"
				classes="**:text-lx"
				checked={marksVisible.value}
				onCheckedChange={(e) => (marksVisible.value = e.checked)}
				controlActive="bg-surface-700"
				controlInactive="bg-surface-200"
			>
				Markierungen
			</Switch>
			<Switch
				name="toggleCopyWithoutLinebreaks"
				classes="**:text-lx"
				checked={copyWithoutLinebreaks.value}
				onCheckedChange={(e) => {
					copyWithoutLinebreaks.value = e.checked;
				}}
				controlActive="bg-surface-700"
				controlInactive="bg-surface-200"
				>Fluid-Copy
			</Switch>
		</div>
	</div>
	{@render children()}
</div>
