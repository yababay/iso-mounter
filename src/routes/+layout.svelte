<script lang="ts">
	import '$lib/styles/root.scss';
	import './article.scss';
	import favicon from '$lib/assets/favicon.svg';

	let { children } = $props();
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
	<title>ISO mounter</title>
</svelte:head>

<main>
	<section>
		{@render children()}
	</section>
</main>

<style lang="scss">
	section {
		width: 90%;
	}
</style>
