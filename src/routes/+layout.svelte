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
	<article>
		{@render children()}
	</article>
</main>
