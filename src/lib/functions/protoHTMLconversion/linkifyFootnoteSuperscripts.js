import { JSDOM } from 'jsdom';
// Add anchors to footnotes in maintext

export function linkifyFootnoteSuperscripts(html) {
  // Parse into a DOM
  const dom = new JSDOM(`<div id="__lk_container__">${html}</div>`);
  const doc = dom.window.document;
  const container = doc.getElementById('__lk_container__');

  // Find all sup elements with an id
  const sups = Array.from(container.querySelectorAll('sup[id]'));

  sups.forEach(sup => {
    // Skip if already inside an anchor
    if (sup.closest('a')) return;

    const idVal = sup.getAttribute('id');
    if (!idVal) return;

    const parts = String(idVal).split('-');
    const n = parts[parts.length - 1];
    if (!n) return;

    const a = doc.createElement('a');
    a.setAttribute('href', `#note-${n}`);
    a.setAttribute('aria-label', `Zu Fussnote ${n} springen`);
    a.className = 'note-ref';

    sup.parentNode.replaceChild(a, sup);
    a.appendChild(sup);
  });

  // Return innerHTML of the wrapper (preserves original fragment structure)
  return container.innerHTML;
}