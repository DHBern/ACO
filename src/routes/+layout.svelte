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
				goto(base + '/about');
			}}>Über das Projekt</button
		>
		<button
			onclick={() => {
				goto(base + '/edition');
			}}>Bände</button
		>

		<button
			onclick={() => {
				goto(base + '/imprint');
			}}>Impressum</button
		>
		<button
			onclick={() => {
				goto(base + '/register');
			}}>Register</button
		>
		<button
			onclick={() => {
				goto(base + '/edition/search');
			}}>Suche</button
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

<footer class="flex h-50 flex-row justify-center bg-[var(--aco-teal)] align-middle text-slate-50">
	<p class="text-slate-50">Footer with Logos</p>
</footer>
