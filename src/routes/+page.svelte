<script lang="ts">
    import db from '$lib/assets/db.yaml?raw'
    import * as yaml from 'js-yaml'

    const data = yaml.load(db) as any
    const tags = new Set<string>(
      data.flatMap((item: any) => item.tags || [])
    )

    type Card = {
      id: string
      label: string
      description: string
      content: string[]
      tags?: string[]
    }

    let selectedTag: string | null = $state(null)
    let success: HTMLDivElement | undefined = $state()
    let danger: HTMLDivElement | undefined = $state()

    const cards: Card[] = $state(data)

    const filteredCards: Card[] = $derived.by(
      (): Card[] => selectedTag && cards.filter((item: Card) => typeof selectedTag === 'string' && (item.tags || []).includes(selectedTag)) || []
    )

    const showByTag = (event: MouseEvent & { currentTarget: EventTarget & HTMLLIElement; }) => {
      selectedTag = event.currentTarget.textContent?.trim() || null
    }

    const mountIso = async (event: MouseEvent & { currentTarget: EventTarget & HTMLButtonElement; }) => {
        if(!(success && danger)) return
        const isoId = event.currentTarget.dataset.iso
        let alert: HTMLDivElement = success
        try{
            const res = await fetch(`/${isoId}.iso`)
            const { status } = res
            alert = status === 200 ? success : danger
        } catch(e) {
            alert = danger
        }
        alert.classList.remove('d-none')
        await new Promise(yes => setTimeout(yes, 3000))
        alert.classList.add('d-none')
    }
</script>

<div class="row">
  <div class="col-12 col-md-9">
    <h1>{selectedTag && selectedTag.charAt(0).toUpperCase() + selectedTag.slice(1) || 'Мультимедийная коллекция'}</h1>
    <p class="d-flex align-items-center w-100 mb-3 mt-3">
      <span class="me-2">Выберите тэг для фильтрации или введите запрос:</span>
      <input type="text" placeholder="Поиск..." class="form-control w-25" />
    </p>
    <div class="cards">
    {#each filteredCards as card}
      <div class="card mb-3">
        <h5 class="card-title bg-secondary text-white">{card.id}<br> ({card.label})</h5>
        <div class="card-body">
          {#if card.description}
            <p class="card-text">{card.description}</p>
          {/if}
          <ul>
            {#each card.content as item}
              <li>{item}</li>
            {/each}
          </ul>
          </div>
          <div class="d-flex justify-content-end card-footer">
            <button class="btn btn-secondary btn-sm" onclick={mountIso} data-iso={card.id}>Монтировать</button>
          </div>
      </div>
    {/each}
    </div>
  </div>
  <div class="col-12 col-md-3" id="tags">
    <h2>Теги</h2>
    <ul>
      {#each Array.from(tags).sort() as tag}
        <!-- svelte-ignore a11y_click_events_have_key_events -->
        <!-- svelte-ignore a11y_no_noninteractive_element_interactions -->
        <li onclick={showByTag}>{tag}</li>
      {/each}
    </ul>
  </div>
</div>

<div class="alert alert-success d-none" role="alert" id="success" bind:this={success}>
  Образ успешно примонтирован.
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

  .card-title {
    font-size: 0.75rem;
    font-family: monospace;
    padding: 0.5rem;
    text-align: center;
  }

  .card-footer {
    padding: 0.5rem;
  }

  .cards {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
    justify-content: space-between;
  }

  .card {
    width: 350px;
  }

  .card-body {
    padding: 1rem;
    height: 400px;
    overflow-y: auto;
    padding: .5rem;
  }

  #tags {
    margin-top: 1rem;
    font-size: .8rem;
    h2 {
      font-size: 1.5rem;
      margin-bottom: 0.5rem;
    }
    ul {
      list-style-type: none;
      padding-left: 0;
      li {
        background-color: #f8f9fa;
        margin-bottom: 0.2rem;
        padding: 0.2rem;
        border-radius: 0.25rem;
        cursor: pointer;
      }
    }
  }
</style>
