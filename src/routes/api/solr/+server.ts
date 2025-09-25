import type { RequestHandler } from './$types';
import { Buffer } from 'node:buffer';

const SOLR_BASE = 'https://hallernet-search.hidora.com/solr';
const CORE = 'public';
const USER = '__user__';
const PW = '__pw__';
const AUTH = 'Basic ' + Buffer.from(`${USER}:${PW}`).toString('base64');

// Proxy GET/POST to Solr. This keeps credentials on server.
export const GET: RequestHandler = async ({ url, request }) => {
	// forward query string and headers as appropriate
	const qs = url.search; // includes leading ?
	const target = `${SOLR_BASE}/${CORE}/select${qs}`;

	try {
	const upstream = await fetch(target, {
		method: 'GET',
		headers: {
		  Authorization: AUTH,
		  Accept: request.headers.get('accept') ?? 'application/json'
		}
	});
  
	// Prefer text() so runtime handles decompression for us
	const bodyText = await upstream.text();
	const headers = new Headers(upstream.headers);
	
	// Remove or fix headers that no longer match the body
	headers.delete('content-encoding');

	// runtime likely already decompressed the gzip body, so remove the header to avoid mismatch
	if (headers.get('content-encoding') === 'gzip') headers.delete('content-encoding');

		headers.delete('transfer-encoding');
		headers.delete('content-length');
		// Ensure JSON content-type (include charset)
		headers.set('content-type', headers.get('content-type') ?? 'application/json; charset=utf-8');

		return new Response(bodyText, {
			status: upstream.status,
			statusText: upstream.statusText,
			headers
		});
	} catch (err) {
		return new Response(String(err), { status: 502 });
	}
};
