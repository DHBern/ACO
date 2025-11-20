export async function transformAnchorsNewTab(html) {
  const { JSDOM } = await import('jsdom'); // dynamic import
  const dom = new JSDOM(`<div id="__ta_container__">${html}</div>`);
  const doc = dom.window.document;
  const container = doc.getElementById('__ta_container__');

  container.querySelectorAll('a').forEach(a => {
    if (!a.hasAttribute('target')) a.setAttribute('target', '_blank');
    if (!a.hasAttribute('rel')) a.setAttribute('rel', 'noopener noreferrer');
  });

  return container.innerHTML;
}
