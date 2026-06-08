<script lang="ts">
    import { onMount } from 'svelte';
    import Page from './page.md'

    onMount(() => {
        const links = document.querySelectorAll('a')
        for(const link of links) {
            if(link.textContent !== 'mount') continue
            const parent = link.parentNode
            const icon = document.createElement('i')
            icon.classList.add('bi')
            icon.classList.add('bi-link')
            link.textContent = ''
            link.title = 'Подключить'
            link.appendChild(icon)
            link.addEventListener('click', async e => {
                e.preventDefault()
                if(!(success && danger)) return
                const res = await fetch(link.href)
                const { status } = res
                const alert = status === 200 ? success : danger
                alert.classList.remove('d-none')
                await new Promise(yes => setTimeout(yes, 3000))
                alert.classList.add('d-none')
            })
        }
    })

    let success: HTMLDivElement | undefined = $state()
    let danger: HTMLDivElement | undefined = $state()
</script>

<Page />

<div class="alert alert-success d-none" role="alert" bind:this={success}>
  Образ успешно примонтирован.
</div>

<div class="alert alert-danger d-none" role="alert" bind:this={danger}>
  При подключении ресурса произошла ошибка.
</div>

<style lang="scss">
    .alert {
        position: fixed;
        top: 1rem;
        right: 1rem;
    }
</style>
