<script>
	import { Accordion } from '@skeletonlabs/skeleton-svelte';
	import { generateFootnoteSuperscripts } from '$lib/functions/protoHTMLconversion';

	let value = $state(['metadata']);

	let { data } = $props();
</script>

<Accordion {value} onValueChange={(e) => (value = e.value)} collapsible class="mb-4 shadow-md">
	<Accordion.Item value="metadata">
		<Accordion.ItemTrigger class="bg-primary-200-800/60 hover:bg-primary-200-800"
			><span class="text-2xl font-bold">Metadaten</span></Accordion.ItemTrigger
		>
		<Accordion.ItemContent>
			<div class="col-span-4 col-start-1 pl-13">
				{@html generateFootnoteSuperscripts(data.docMetadata?.content?.head)}
			</div>
			<div class="col-span-4 col-start-1 pl-13">
				{#each data.docMetadata?.content?.footnotes_head as footnote}
					<p class="!text-base">
						<sup>{@html footnote.note_id}</sup>{@html footnote.note_content}
					</p>
				{/each}
			</div>
		</Accordion.ItemContent>
	</Accordion.Item>
</Accordion>
