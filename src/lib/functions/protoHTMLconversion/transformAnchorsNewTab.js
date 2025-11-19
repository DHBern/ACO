import { JSDOM } from 'jsdom';

function toStringSafe(value) {
    if (typeof value === 'string') return value;
    if (value instanceof Uint8Array || value instanceof Buffer) return Buffer.from(value).toString('utf8');
    if (value == null) return '';
    return String(value);
}

export function transformAnchorsNewTab(raw) {
  const html = toStringSafe(raw);

  // Wrap in a container to preserve fragment structure
  const dom = new JSDOM(`<div id="__ta_container__">${html}</div>`);
  const doc = dom.window.document;
  const container = doc.getElementById('__ta_container__');

  // Update <a> elements
  container.querySelectorAll('a').forEach(a => {
    if (!a.hasAttribute('target')) a.setAttribute('target', '_blank');
    if (!a.hasAttribute('rel')) a.setAttribute('rel', 'noopener noreferrer');
  });

  return container.innerHTML;
}
