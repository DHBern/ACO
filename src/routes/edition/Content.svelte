<script>
    import { goto } from '$app/navigation';
    import { textData } from '$lib/data/get_data';
    
    const types = ["CV","CPal","CVer","CU"];
    let docs = {};
    docs.CV = textData.filter(({ type: t }) => t === "CV");
    docs.CPal = textData.filter(({ type: t }) => t === "CPal");
    docs.CVer = textData.filter(({ type: t }) => t === "CVer");
    docs.CU = textData.filter(({ type: t }) => t === "CU");
</script>

<h1>docs</h1>
<p>These are the Documents of the first volume</p>

<div class="">
{#each types as type}
    <div class="mt-14">
        <h2 class="text-2xl">{type}</h2>
        {#each docs[type] as doc}
        <button onclick={()=>{goto(`edition/1/${doc.slug}/${doc.units[0]}`)}}>
            <p class="text-lg">
                <span class="font-bold">{doc.num}:</span> {doc.title} <span class="ml-1 text-sky-500 font-bold">({doc.slug})</span>
            </p>
        </button>        
        {/each}
    </div>
    {/each}
</div>
