<script lang="ts">
	import { goto } from '$app/navigation';
	import { base } from '$app/paths';
	import { Switch, Slider } from '@skeletonlabs/skeleton-svelte';
	import '../app.css';

	// Icons
	import IconMoon from '@lucide/svelte/icons/moon';
	import IconSun from '@lucide/svelte/icons/sun';

	let { children } = $props();
</script>

<!-- Menu -->
<header class="flex gap-10 bg-[#105766] text-lg text-slate-50">
	<!-- ACO-Logo -->
	<button
		onclick={() => {
			goto(base + '/.');
		}}
	>
		<img src="{base}/logos/logo-aco.png" alt="ACO" class="max-h-full max-w-[100px]" />
	</button>

	<!-- Top Navigation Bar -->
	<nav class="flex flex-row justify-start gap-12">
		<button
			onclick={() => {
				goto(base + '/ueber');
			}}>Über das Projekt</button
		>
		<button
			onclick={() => {
				goto(base + '/edition');
			}}>Bände</button
		>

		<button
		onclick={() => {
			goto(base + '/register');
		}}>Register</button
		>
		<button
		onclick={() => {
			goto(base + '/suche');
		}}>Suche</button
		>
		<button
			onclick={() => {
				goto(base + '/impressum');
			}}>Impressum</button
		>

		<Switch
			name="mode"
			controlActive="bg-surface-700"
			onCheckedChange={(e) => {
				document.documentElement.classList.toggle('dark');
			}}
		>
			{#snippet inactiveChild()}<IconMoon size="14" />{/snippet}
			{#snippet activeChild()}<IconSun size="14" />{/snippet}
		</Switch>
	</nav>
</header>

<!-- Content -->
<div class="px-5">
	{@render children()}
</div>

<footer class="bg-[var(--aco-teal-light)] align-middle text-slate-50 py-5">
	<div class="p-5">
		<h1 class="text-black dark:text-black text-lg font-bold">Die Akten des Konzils von Ephesus 431. Übersetzung, Einleitung, Kommentar</h1>
		<p class="text-black dark:text-black font-bold text-md mt-5 ml-5"><strong>Empfohlene Zitierung: </strong> ACO..........</p>
	</div>

	<div class="w-full flex justify-around my-2">
		<div>
			<img
			src="{base}/images-legacy/logos/dfg_logo_foerderung/dfg_logo_schriftzug_blau_foerderung_4c.gif"
			alt="Logo DFG"
			class="max-h-[100px] max-w-[200px]"
			/>
		</div>
		<div>
			<img
			src="{base}/images-legacy/logos/UBo_Logo_Standard/UNI_Bonn_Logo_Standard_RZ_Office.jpg"
			alt="Logo Universität Bonn"
			class="max-h-[100px] max-w-[200px]"
			/>
		</div>
		<div>
			<img
			src="{base}/images-legacy/logos/Logo_Uni_Bern.png"
			alt="Logo Universität Bern"
			class="max-h-[100px] max-w-[200px]"
			/>
		</div>
	</div>
	</footer>
