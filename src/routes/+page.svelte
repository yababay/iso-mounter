<script lang="ts">
    import Music from './music.md'
    import Podcasts from './podcasts.md'
    import Books from './books.md'
    import Video from './video.md'
    import Software from './software.md'
    import { onMount } from 'svelte';

    onMount(() => {
    const links = document.querySelectorAll('a')
    
    for(const link of links) {
        if(link.textContent.trim() !== '🔗') continue
        link.title = 'Подключить'
        link.addEventListener('click', async e => {
            e.preventDefault()
            if(!(success && danger)) return
            //if(!confirm('Вы отмонтировали предыдущий образ от /media/iso-remote ?')) return
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

<h1 class="w-100">Мультимедийная коллекция</h1>
<nav>
  <div class="nav nav-tabs w-100" id="nav-tab" role="tablist">
    <button class="nav-link active" id="nav-music-tab" data-bs-toggle="tab" data-bs-target="#nav-music" type="button" role="tab" aria-controls="nav-music" aria-selected="true">Музыка</button>
    <button class="nav-link" id="nav-podcasts-tab" data-bs-toggle="tab" data-bs-target="#nav-podcasts" type="button" role="tab" aria-controls="nav-podcasts" aria-selected="false">Подкасты</button>
    <button class="nav-link" id="nav-books-tab" data-bs-toggle="tab" data-bs-target="#nav-books" type="button" role="tab" aria-controls="nav-books" aria-selected="false">Книги</button>
    <button class="nav-link" id="nav-video-tab" data-bs-toggle="tab" data-bs-target="#nav-video" type="button" role="tab" aria-controls="nav-video" aria-selected="false">Видео</button>
    <button class="nav-link" id="nav-software-tab" data-bs-toggle="tab" data-bs-target="#nav-software" type="button" role="tab" aria-controls="nav-software" aria-selected="false" disabled>Программы</button>
  </div>
</nav>
<div class="tab-content w-100 pt-3" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-music" role="tabpanel" aria-labelledby="nav-music-tab" tabindex="0">
    <Music />
  </div>
  <div class="tab-pane fade" id="nav-podcasts" role="tabpanel" aria-labelledby="nav-podcasts-tab" tabindex="0">
    <Podcasts />
  </div>
  <div class="tab-pane fade" id="nav-books" role="tabpanel" aria-labelledby="nav-books-tab" tabindex="0">
    <Books />
  </div>
  <div class="tab-pane fade" id="nav-video" role="tabpanel" aria-labelledby="nav-video-tab" tabindex="0">
    <Video />
  </div>
  <div class="tab-pane fade" id="nav-software" role="tabpanel" aria-labelledby="nav-software-tab" tabindex="0">
    <Software />
  </div>
</div>

<div class="alert alert-success d-none" role="alert" id="success" bind:this={success}>
  Образ успешно примонтирован. <br>
  Не забудьте перемонтировать /media/iso-remote
</div>

<div class="alert alert-danger d-none" role="alert" id="danger" bind:this={danger}>
  При подключении ресурса произошла ошибка.
</div>

<style lang="scss">
    .alert {
        position: fixed;
        top: 1rem;
        right: 1rem;
    }
</style>
