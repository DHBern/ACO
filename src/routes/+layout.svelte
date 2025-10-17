<script lang="ts">
	import { goto } from '$app/navigation';
	import { base } from '$app/paths';
	import { Switch, Slider } from '@skeletonlabs/skeleton-svelte';
	import '../app.css';
	import Abbreviations from './edition/Abbreviations.svelte';

	// Icons
	import IconMoon from '@lucide/svelte/icons/moon';
	import IconSun from '@lucide/svelte/icons/sun';

	let { children } = $props();
	let openStateAbbreviations = $state(false);
</script>

<div class="flex min-h-screen flex-col">
	<!-- Menu -->
	<header class="flex flex-none gap-10 bg-[#105766] text-lg text-slate-50">
		<!-- ACO-Logo -->
		<button
			onclick={() => {
				goto(base + '/.');
			}}
		>
			<img src="{base}/logos/logo-aco.png" alt="ACO" class="max-h-full max-w-[100px]" />
		</button>

		<!-- Top Navigation Bar -->
		<nav class="flex w-full items-center justify-around *:mr-10">
			<div class="flex gap-12">
				<a href={`${base}/ueber`}>Über das Projekt</a>
				<a href={`${base}/edition`}>Bände</a>
				<a href={`${base}/register`}>Register</a>
				<a href={`${base}/suche`}>Suche</a>
				<a href={`${base}/impressum`}>Impressum</a>
			</div>
			<div class="flex-grow"></div>

			<!-- Abbreviations -->
			<Abbreviations bind:openState={openStateAbbreviations} />
			<button
				onclick={() => {
					openStateAbbreviations = !openStateAbbreviations;
				}}>Abkürzungsverzeichnis</button
			>

			<!-- Lightswitch -->
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
	<div class="flex-1 overflow-auto px-5">
		{@render children()}
	</div>

	<footer class="flex-none bg-[var(--aco-teal-light)] py-5 align-middle text-slate-50">
		<div class="p-5">
			<h1 class="text-lg font-bold text-black dark:text-black">
				Die Akten des Konzils von Ephesus 431. Übersetzung, Einleitung, Kommentar
			</h1>
			<p class="text-md mt-5 ml-5 font-bold text-black dark:text-black">
				<strong>Empfohlene Zitierung: </strong> ACO..........
			</p>
		</div>

		<div class="my-2 flex w-full justify-around">
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
</div>
