<script>
	import { Accordion } from '@skeletonlabs/skeleton-svelte';
	import { generateFootnoteSuperscripts } from '$lib/functions/protoHTMLconversion';

	let value = $state(['metadata']);

	let { data } = $props();
</script>

<Accordion {value} onValueChange={(e) => (value = e.value)} collapsible classes="shadow-md mb-4">
	<Accordion.Item value="metadata">
		<Accordion.ItemTrigger><span class="text-xl font-bold">Metadaten</span></Accordion.ItemTrigger>
		<Accordion.ItemContent>
			<div class="col-span-4 col-start-1 pl-13">
				{@html generateFootnoteSuperscripts(data.docMetadata?.content?.head)}
			</div>
			<div class="col-span-4 col-start-1 pl-13">
				{#each data.docMetadata?.content?.footnotes_head as footnote}
					<p class="!text-sm">
						<sup>{@html footnote.note_id}</sup>{@html footnote.note_content}
					</p>
				{/each}
			</div>
		</Accordion.ItemContent>
	</Accordion.Item>
</Accordion>
