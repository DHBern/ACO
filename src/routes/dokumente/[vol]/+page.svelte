<script lang="ts">
	import TOC from '../TOC.svelte';
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	import { resolve } from '$app/paths';
	import { page } from '$app/state';
	import { getFirstUnitOfPage } from '$lib/functions/protoHTMLconversion/getFirstUnitOfPage';


	let { data } = $props();

	const pageParam = $derived(page.url.searchParams.get('page'));
	let pageParamRedirect = $derived(getFirstUnitOfPage(pageParam, data.metaData));
	
	onMount(() => {
		// Redirect to first unit on requested page
		if (pageParam && pageParamRedirect.found) {
			goto(
				resolve(`/dokumente/${data.vol}/${pageParamRedirect.schwartzSlug}/${pageParamRedirect.unitSlug}?page=${pageParamRedirect.page}`),
				{ replaceState: true }
			);
		}
	});
</script>

<TOC metaData={data.metaData} accordionStateInit={data.vol} />
