document.addEventListener("DOMContentLoaded", function() {
    if(window.location.hostname !== '192.168.0.202') return

    const success = document.getElementById('success')
    const danger = document.getElementById('danger')
    const links = document.querySelectorAll('a')
    
    for(const link of links) {
        if(link.textContent.trim() !== '🔗') continue
        const parent = link.parentNode
        const icon = document.createElement('i')
        icon.classList.add('bi')
        icon.classList.add('bi-link')
        //link.textContent = ''
        link.title = 'Подключить'
        /*link.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-link" viewBox="0 0 16 16">
            <path d="M6.354 5.5H4a3 3 0 0 0 0 6h3a3 3 0 0 0 2.83-4H9q-.13 0-.25.031A2 2 0 0 1 7 10.5H4a2 2 0 1 1 0-4h1.535c.218-.376.495-.714.82-1z"></path>
            <path d="M9 5.5a3 3 0 0 0-2.83 4h1.098A2 2 0 0 1 9 6.5h3a2 2 0 1 1 0 4h-1.535a4 4 0 0 1-.82 1H12a3 3 0 1 0 0-6z"></path>
        </svg>`*/
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
