export function scrollToNoteRef(id) {	
    const elContainer = document.querySelector('.containerContent');
    const elNoteRef = document.querySelector(`[data-type=note-start][data-id=${id}]`);

    // Scroll to note
    elContainer?.scrollTo({left: elContainer.scrollLeft, top:elNoteRef?.offsetTop, behavior: 'smooth'})
}