export function getFirstUnitOfPage(pageParam, metaData) {
	if (!pageParam) return { found: false};

	const requested = parseInt(pageParam, 10);
	if (Number.isNaN(requested)) return { found: false };

	// iterate documents (assuming JSON is ordered according to documents)
	for (const entry of metaData) {
		// iterate unit keys in natural order of unitSlugs to respect ordering

		for (const unitSlug of entry.unitSlugs) {
			const limits = entry.pageLimits[unitSlug];
			if (!limits) continue;
			const lower = parseInt(limits[0], 10);
			const upper = parseInt(limits[1], 10);
			if (
				!Number.isNaN(lower) &&
				!Number.isNaN(upper) &&
				requested >= lower &&
				requested <= upper
			) {
				return {
					found: true,
					schwartzSlug: entry.schwartzSlug,
					unitSlug,
					page:requested
				};
			}
		}
	}
	return { found: false };
}