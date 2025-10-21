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
		<h1 class="text-secondary-400-600 mb-2 text-4xl">{@html data.docMetadata.toc_title}</h1>

		<!-- Document Metadata -->
		<div class="mb-5">
			{@html data.docMetadata?.content?.inhalt}
		</div>
		<DocumentMetadata {data} />

		<!-- Unit-Navigation -->
		<UnitNavigation {data} />

		<!-- Settings -->
		<div class="my-5 flex justify-center gap-5 align-middle">
			<Switch
				class="**:text-lx"
				name="toggleMarksVisible"
				checked={marksVisible.value}
				onCheckedChange={(e) => (marksVisible.value = e.checked)}
			>
				<Switch.Control class="data-[state=checked]:bg-secondary-600-400 bg-surface-200-800">
					<Switch.Thumb />
				</Switch.Control>
				<Switch.Label>Markierungen</Switch.Label>
				<Switch.HiddenInput />
			</Switch>

			<Switch
				class="**:text-lx"
				name="toggleCopyWithoutLinebreaks"
				checked={copyWithoutLinebreaks.value}
				onCheckedChange={(e) => (copyWithoutLinebreaks.value = e.checked)}
			>
				<Switch.Control class="data-[state=checked]:bg-secondary-600-400 bg-surface-200-800">
					<Switch.Thumb />
				</Switch.Control>
				<Switch.Label>Copy-Paste ohne Zeilenumbrüche</Switch.Label>
				<Switch.HiddenInput />
			</Switch>
		</div>
	</div>
	{@render children()}
</div>
