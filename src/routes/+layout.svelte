<script lang="ts">
	import '../app.css';

	import { goto } from '$app/navigation';
	import { base } from '$app/paths';
	import { Switch, AppBar, Dialog, Portal } from '@skeletonlabs/skeleton-svelte';
	import { page } from '$app/state';
	import Abbreviations from './Abbreviations.svelte';
	import { onMount } from 'svelte';
	import { Sun, Moon, Menu, X } from '@lucide/svelte';

	let { data, children } = $props();
	let openStateAbbreviations = $state(false);
	let openStateMenu = $state(false);

	// Lightswitch
	let isDark = $state(false);
	let darkModeState = $derived(isDark ? 'dark' : 'light');
	let isEditionRoute = $derived(
		page.url.toString().includes('/edition/') &&
			!page.url.toString().includes('/vorwort') &&
			!page.url.toString().includes('/einleitung')
	);

	const handleToggleLightswitch = (force = '') => {
		if (force == 'dark') isDark = true;
		else if (force == 'light') isDark = false;
		else isDark = !isDark;
		document.documentElement.setAttribute('data-darkModeState', darkModeState);
	};

	const links = [
		{ name: 'Über&nbsp;das&nbsp;Projekt', path: '', slug: '/ueber' },
		{ name: 'Edition', path: '', slug: '/edition' },
		{ name: 'Register', path: '', slug: '/register' },
		{ name: 'Suche', path: '', slug: '/suche' },
		{ name: 'Literaturverzeichnis', path: '/edition/vol1', slug: '/literatur' },
		{ name: 'Bibelstellen', path: '', slug: '/bibelstellen' },
		{ name: 'Geovisualisierung', path: '', slug: '/karte' },
		{ name: 'Bibliographie', path: '', slug: '/bibliographie' }
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

<!-- Modal Abbrev -->
<Abbreviations bind:openState={openStateAbbreviations} abbData={data.abbData} />

<!-- Snippet Abbrev -->
{#snippet abbreviations()}
	<button
		class="hover:decoration-primary-300-700 hover:underline hover:decoration-6"
		onclick={() => {
			openStateAbbreviations = !openStateAbbreviations;
			openStateMenu = false; // close menu
		}}>Abkürzungsverzeichnis</button
	>
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
							<Sun size="14" />
						{:else}
							<Moon size="14" />
						{/if}
					{/snippet}
				</Switch.Context>
			</Switch.Thumb>
		</Switch.Control>
		<Switch.HiddenInput />
	</Switch>
{/snippet}

<div class="flex min-h-screen flex-col">
	<!-- Menu -->
	<AppBar class="bg-primary-400-600 flex items-center justify-between px-2 py-0">
		<!-- ACO-Logo / Home -->
		<AppBar.Lead class="m-0 flex items-center p-0">
			<a class="flex items-center py-2" href={`${base}/`}>
				<img src="{base}/logos/logo-aco.png" alt="ACO" class="mr-5 h-auto w-auto max-w-30" />
			</a>
		</AppBar.Lead>

		<!-- Top Navigation Bar -->
		<AppBar.Headline class="m-0 mr-10">
			<nav class="">
				<ul
					class="text-surface-50 my-8 hidden w-full items-start gap-x-8 gap-y-6 text-xl lg:flex lg:flex-wrap lg:justify-start"
				>
					{#each links as link}
						<li
							class={[
								'list-nav-item hover:decoration-primary-300-700 inline-block h-full hover:underline hover:decoration-6',
								link.slug === `/${page.url.pathname.split('/').pop()}`
									? 'decoration-secondary-300-700 underline decoration-6'
									: ''
							]}
						>
							<a href="{base}{link.path}{link.slug}">{@html link.name}</a>
						</li>
					{/each}

					<!-- Abbreviations -->
					{@render abbreviations()}
				</ul>
			</nav>
			<!-- Trail (Smartphone) -->
		</AppBar.Headline>

		<!-- Spacer -->
		<div class="grow"></div>

		<!-- Menu for Smartphone -->
		<AppBar.Trail class="mr-4">
			<!-- Lightswitch -->
			<div class="hidden lg:block">{@render lightswitch()}</div>

			<!-- Trigger aligned right on small screens -->
			<div class="flex w-full justify-end lg:hidden">
				<Dialog open={openStateMenu} onOpenChange={(e) => (openStateMenu = e.open)}>
					<Dialog.Trigger
						class="text-surface-50 ml-4 inline-flex items-center justify-center rounded p-2 hover:bg-white/10"
					>
						<Menu class="text-surface-50" width="40" height="40" />
					</Dialog.Trigger>

					<Portal>
						<Dialog.Backdrop class="fixed inset-0 z-50 bg-black/50" />
						<Dialog.Positioner class="fixed inset-0 z-50">
							<Dialog.Content
								class="bg-primary-400-600 text-surface-50 relative h-full w-full overflow-auto p-3"
							>
								<!-- Top bar with title and close in top-right -->
								<div class="flex items-center justify-between">
									<Dialog.Title class="text-lg font-semibold">Menu</Dialog.Title>

									<div class="flex">
										{@render lightswitch()}
										<!-- Close button top-right -->
										<Dialog.CloseTrigger
											class="text-surface-50 ml-4 inline-flex items-center justify-center rounded p-2 hover:bg-white/10"
											aria-label="Close menu"
										>
											<X width="40" height="40" />
										</Dialog.CloseTrigger>
									</div>
								</div>

								<!-- Nav content full height -->
								<nav class="mt-6">
									<ul class="flex flex-col gap-1">
										{#each links as link}
											<li class="m-2!">
												<a
													href={`${base}${link.path}${link.slug}`}
													onclick={() => {
														openStateMenu = false; // close Menu
													}}
													class="block px-2 py-1 text-lg"
												>
													{@html link.name}
												</a>
											</li>
										{/each}
										<li class="m-2! block px-2 py-1 text-lg">
											{@render abbreviations()}
										</li>
									</ul>

									<!-- <div class="mt-6"> -->
									<!-- </div> -->
								</nav>
							</Dialog.Content>
						</Dialog.Positioner>
					</Portal>
				</Dialog>
			</div>
		</AppBar.Trail>
	</AppBar>

	<!-- Content -->
	<div
		class={[
			'mx-auto min-h-screen w-full flex-1 overflow-auto px-5 pt-10',
			isEditionRoute ? 'max-w-full pb-15' : 'max-w-[1500px] pb-30'
		]}
	>
		{@render children?.()}
	</div>

	<!-- Footer -->
	<footer class="bg-primary-400-600 flex-none p-6 text-slate-50">
		<div class="mx-auto w-full justify-center">
			<p class="text-surface-50! text-xl font-bold">
				Die Akten des Konzils von Ephesus 431. Übersetzung, Einleitung, Kommentar
			</p>
			<p><a class="text-surface-50! text-xl underline" href={`${base}/impressum`}>Impressum</a></p>

			<p class="text-surface-50! mt-10 text-xl font-bold">Förderung und Partner</p>

			<ul class="mt-2 mb-10 ml-5 list-disc">
				<li class="text-lg">Deutsche Forschungsgemeinschaft (DFG)</li>
				<li class="text-lg">Universität Bonn</li>
				<li class="text-lg">Universität Bern</li>
			</ul>
			<div class="mt-10! flex w-full justify-around gap-x-10">
				<div class="flex-grow"></div>
				<div class="flex flex-wrap items-center justify-center gap-x-20 gap-y-10">
					<div>
						<img
							src="{base}/logos/dfg_logo_schriftzug_weiss.png"
							alt="Logo DFG"
							class="max-h-[200px] max-w-[400px]"
						/>
					</div>
					<div>
						<img
							src="{base}/images-legacy/logos/UBo_Logo_Standard/UNI_Bonn_Logo_Standard_RZ_Office.jpg"
							alt="Logo Universität Bonn"
							class="max-h-[200px] max-w-[300px]"
						/>
					</div>
					<div>
						<img
							src="{base}/images-legacy/logos/Logo_Uni_Bern.png"
							alt="Logo Universität Bern"
							class="max-h-[200px] max-w-[300px]"
						/>
					</div>
				</div>
				<div class="flex-grow"></div>
			</div>
		</div>
	</footer>
</div>
