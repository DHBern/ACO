<script>
    import { goto } from "$app/navigation";
    import { onMount } from "svelte";
    
    let { data } = $props();

    onMount(() => {
        goto(`/edition`)
    })
</script>