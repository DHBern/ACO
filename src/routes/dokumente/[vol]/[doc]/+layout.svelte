<script>
	import UnitNavigation from './UnitNavigation.svelte';
	import DocumentMetadata from './DocumentMetadata.svelte';
	import { Tooltip, Portal, Switch } from '@skeletonlabs/skeleton-svelte';
	import { copyWithoutLinebreaks, annotVisible } from '../../globals.svelte.js';
	import { InfoIcon } from '@lucide/svelte';

	let { data, children } = $props();
</script>

<div class="containerDocHead mx-auto max-w-[1500px]">
	<!-- Title -->
	<h1 class="text-secondary-400-600 mb-2 text-4xl font-bold">
		{@html data.slug_doc}:
		{@html data.docMetadata.toc_title}
	</h1>

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
			class="**:text-lg"
			name="toggleAnnotVisible"
			checked={annotVisible.value}
			onCheckedChange={(e) => (annotVisible.value = e.checked)}
		>
			<Switch.Control class="data-[state=checked]:bg-secondary-600-400 bg-surface-200-800">
				<Switch.Thumb />
			</Switch.Control>
			<Switch.Label>Anmerkungen</Switch.Label>
			<Switch.HiddenInput />
		</Switch>

		<Tooltip positioning={{ placement: 'bottom' }}>
			<Tooltip.Trigger>
				<Switch
					class="**:text-lg"
					name="toggleCopyWithoutLinebreaks"
					checked={copyWithoutLinebreaks.value}
					onCheckedChange={(e) => (copyWithoutLinebreaks.value = e.checked)}
				>
					<Switch.Control class="data-[state=checked]:bg-secondary-600-400 bg-surface-200-800">
						<Switch.Thumb />
					</Switch.Control>
					<Switch.Label
						>Kopiermodus
						<InfoIcon color="grey" class="ml-1 inline-block"></InfoIcon>
					</Switch.Label>

					<Switch.HiddenInput />
				</Switch>
			</Tooltip.Trigger>
			<Portal>
				<Tooltip.Positioner>
					<Tooltip.Content class="card preset-filled-surface-200-800 p-2">
						<span>Wenn eingeschaltet, werden beim Kopieren Zeilenumbrüche ignoriert.</span>
						<Tooltip.Arrow
							class="[--arrow-background:var(--color-surface-200-800)] [--arrow-size:--spacing(2)]"
						>
							<Tooltip.ArrowTip />
						</Tooltip.Arrow>
					</Tooltip.Content>
				</Tooltip.Positioner>
			</Portal>
		</Tooltip>
	</div>
</div>

<!-- Content -->
{@render children()}
