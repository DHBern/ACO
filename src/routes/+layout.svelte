<script lang="ts">
	import { goto } from '$app/navigation';
	import '../app.css';
	let { children } = $props();
</script>

<!-- Menu -->
<nav
	class="items-between absolute left-0 top-0 flex h-[80px] w-full flex-row justify-start gap-12 bg-[#105766] text-slate-50"
>
	<button
		onclick={() => {
			goto('/.');
		}}
	>
		<img src="/logos/logo-aco.png" alt="ACO" class="max-h-full max-w-[100px]" />
	</button>
	<button
		onclick={() => {
			goto('/about');
		}}>Über das Projekt</button
	>
	<button
		onclick={() => {
			goto('/edition');
		}}>Bände</button
	>

	<button
		onclick={() => {
			goto('/imprint');
		}}>Impressum</button
	>
	<button
		onclick={() => {
			goto('/register');
		}}>Register</button
	>
	<button
		onclick={() => {
			goto('/edition/search');
		}}>Suche</button
	>
</nav>

<!-- Content -->
<div class="bg-slate-200 dark:bg-slate-900">
	{@render children()}
</div>
