<script lang="ts">
	import { goto } from '$app/navigation';
	import '../app.css';
	let { children } = $props();
</script>

<!-- Menu -->
<nav
	class="items-between absolute left-0 top-0 flex h-[80px] w-full flex-row justify-start gap-12 bg-blue-100"
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
<div class="absolute left-0 top-[80px] h-[calc(100%-80px)] bg-white p-5">
	{@render children()}
</div>
