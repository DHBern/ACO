<script lang="ts">
	import TOC from '../TOC.svelte';
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	import { resolve } from '$app/paths';
	import { page } from '$app/state';
	import { getFirstUnitOfPage } from '$lib/functions/protoHTMLconversion/getFirstUnitOfPage';
	import { metaData } from '$lib/data/aco-metadata.json';

	let { data } = $props();

	onMount(() => {
		const pageParam = page.url.searchParams.get('page');
		if (pageParam) {
			const redirect = getFirstUnitOfPage(pageParam, metaData);
			if (redirect.found) {
				goto(
					resolve(
						`/dokumente/${data.vol}/${redirect.schwartzSlug}/${redirect.unitSlug}?page=${redirect.page}`
					),
					{ replaceState: true }
				);
			}
		}
	});
</script>

<TOC metaData={data.metaData} accordionStateInit={data.vol} />
