<script lang="ts">
	import '../app.css';

	import { goto } from '$app/navigation';
	import { base } from '$app/paths';
	import { page } from '$app/state';
	import { AppBar, Dialog } from '@skeletonlabs/skeleton-svelte';
	import { Switch } from '@skeletonlabs/skeleton-svelte';
	import Abbreviations from './edition/Abbreviations.svelte';
	import { onMount } from 'svelte';
	import IconMoon from '@lucide/svelte/icons/moon';
	import IconSun from '@lucide/svelte/icons/sun';

	let { children } = $props();
	let openStateAbbreviations = $state(false);
	let openStateMenu = $state(false);

	let classesActive = $derived((href: string) =>
		base + href === `/${page.url.pathname.split('/')[1]}`
			? 'bg-primary-300 hover:bg-primary-300 hover:text-primary-700 text-primary-900'
			: 'hover:text-primary-600'
	);

	function modalClose() {
		openStateMenu = false;
	}

	// Lightswitch
	let isDark = $state(false);
	let darkModeState = $derived(isDark ? 'dark' : 'light');

	const handleToggleLightswitch = (force = '') => {
		if (force == 'dark') isDark = true;
		else if (force == 'light') isDark = false;
		else isDark = !isDark;
		document.documentElement.setAttribute('data-darkModeState', darkModeState);
	};

	const pages = [
		{ slug: 'Über das Projekt', path: '/ueber' },
		{ slug: 'Bände', path: '/edition' },
		{ slug: 'Register', path: '/register' },
		{ slug: 'Suche', path: '/suche' },
		{ slug: 'Bibelstellen', path: '/bibelstellen' },
		{ slug: 'Geovisualisierung', path: '/karte' },
		{ slug: 'Bibliographie', path: '/bibliographie' }
	];

	onMount(() => {
		// Check the user's preferred color scheme
		const prefersDarkScheme = window.matchMedia('(prefers-color-scheme: dark)').matches;
		if (prefersDarkScheme) {
			handleToggleLightswitch('dark');
		} else {
			handleToggleLightswitch('light');
		}
	});
</script>

<div class="flex min-h-screen flex-col">
	<!-- Modal Abbrev -->
	<Abbreviations bind:openState={openStateAbbreviations} />

	<!-- Snippet Abbrev -->
	{#snippet abbreviations()}
		<button
			onclick={() => {
				openStateAbbreviations = !openStateAbbreviations;
			}}>Abkürzungsverzeichnis</button
		>
	{/snippet}

	<!-- Snippet Lit -->
	{#snippet literaturverzeichnis()}
		<a href={`${base}/edition/1/literatur`}>Literaturverzeichnis</a>
	{/snippet}

	<!-- Snippet Lightswitch -->
	{#snippet lightswitch()}
		<Switch
			class="**:text-lx"
			name="mode"
			bind:checked={isDark.val}
			onCheckedChange={handleToggleLightswitch}
		>
			<Switch.Control class="data-[state=checked]:bg-secondary-300 bg-surface-200">
				<Switch.Thumb>
					<Switch.Context>
						{#snippet children(switch_)}
							{#if switch_().checked}
								<IconSun size="14" />
							{:else}
								<IconMoon size="14" />
							{/if}
						{/snippet}
					</Switch.Context>
				</Switch.Thumb>
			</Switch.Control>
			<Switch.HiddenInput />
		</Switch>
	{/snippet}

	<!-- Menu -->
	<AppBar classes="px-4 py-0">
		{#snippet lead()}
			<!-- bg-primary-400-600 flex flex-none gap-10 text-xl text-slate-50 -->
			<!-- ACO-Logo -->
			<button
				onclick={() => {
					goto(base + '/.');
				}}
			>
				<img src="{base}/logos/logo-aco.png" alt="ACO" class="max-h-full max-w-[100px]" />
			</button>
		{/snippet}

		<!-- Top Navigation Bar -->
		<nav>
			<ul class="flex w-full items-center justify-around *:mr-10">
				{#each pages as page}
					<li class="list-nav-item inline-block h-full p-4 {classesActive(page.path)}">
						<a href="{base}{page.path}">{page.slug}</a>
					</li>
				{/each}
			</ul>

			<!-- Literautre -->
			{@render literaturverzeichnis()}

			<!-- Abbreviations -->
			{@render abbreviations()}

			<!-- Lightswitch -->
			{@render lightswitch()}
		</nav>
		{#snippet trail()}
			<Dialog
				open={openStateMenu}
				onOpenChange={(e) => (openStateMenu = e.open)}
				positionerJustify="justify-start"
				positionerAlign=""
				positionerPadding="p-10"
				transitionsPositionerIn={{ y: -480, duration: 200 }}
				transitionsPositionerOut={{ y: -480, duration: 200 }}
				backdropClasses="backdrop-blur-xl"
			>
				{#snippet trigger()}
					<!-- this is an anchor tag because of node_invalid_placement warning -->
					<!-- svelte-ignore a11y_missing_attribute -->
					<!-- svelte-ignore a11y_click_events_have_key_events -->
					<a tabindex="0" role="button" aria-label="Menü" class="btn-icon lg:!hidden">
						<i class="fa-solid fa-bars"></i>
					</a>
				{/snippet}
				{#snippet content()}
					<nav class="list-nav">
						<ul>
							{#each pages as page}
								<li>
									<a href={`${base}${page.path}`} onclick={modalClose}>
										<span class="flex-auto">{page.slug}</span>
									</a>
								</li>
							{/each}
						</ul>
					</nav>
				{/snippet}
			</Dialog>
		{/snippet}
	</AppBar>

	<!-- Content -->
	<div class="flex-1 overflow-auto px-5">
		{@render children?.()}
	</div>

	<!-- Footer -->
	<footer class="bg-primary-400-600 flex-none py-5 align-middle text-slate-50">
		<div class="mx-auto flex w-full flex-col items-center justify-center gap-10 py-10">
			<p class="text-surface-contrast-400-600 text-xl font-bold">
				Die Akten des Konzils von Ephesus 431. Übersetzung, Einleitung, Kommentar
			</p>
			<button class="text-surface-950-50 bg-surface-50-950 w-40 rounded-3xl p-3 font-bold"
				><a href={`${base}/impressum`}>Impressum</a></button
			>

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
		</div>
	</footer>
</div>
