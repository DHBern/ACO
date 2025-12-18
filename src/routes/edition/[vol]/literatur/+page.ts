    import { metaDocs as mDocs } from '$lib/data/aco-meta-docs.json';
    const metaDocs = await mDocs;
    const litData = metaDocs.Literaturverzeichnis.text;

    export async function load() {
        return { litData };
    }