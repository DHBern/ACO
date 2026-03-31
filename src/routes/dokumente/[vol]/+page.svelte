<script lang="ts">
	import TOC from '../TOC.svelte';
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	import { base, resolve } from '$app/paths';

	let { data } = $props();

	onMount(() => {
		// Redirect to first unit on requested page
		console.log('HI');
		console.log('pageparam',data.pageParam);
		console.log('found',  data.pageParamRedirect.found);
		if (data.pageParam && data.pageParamRedirect.found) {
			console.log(data.pageParamRedirect.schwartzSlug);
			console.log(data.pageParamRedirect.unitSlug);
			console.log(data.pageParamRedirect.page);
			goto(
				resolve(`/dokumente/${data.vol}/${data.pageParamRedirect.schwartzSlug}/${data.pageParamRedirect.unitSlug}?page=${data.pageParamRedirect.page}`),
				{ replaceState: true }
			);
		}
	});
</script>

<TOC metaData={data.metaData} accordionStateInit={data.vol} />
