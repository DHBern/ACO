<script>
	import { base } from '$app/paths';
	import { Dialog, Portal } from '@skeletonlabs/skeleton-svelte';
	import { XIcon } from '@lucide/svelte';

	let modalInfo = $state({ path: '', alt: '', caption: '' });
	let modalVisible = $state(false);
	function enlargeImage(path, alt, caption) {
		modalInfo.path = path;
		modalInfo.alt = alt;
		modalInfo.caption = caption;
		modalVisible = true;
	}
</script>

{#snippet figure(path, alt, caption, inModal = false)}
	<button
		type="button"
		onclick={() => {
			enlargeImage(path, alt, caption);
		}}
	>
		<figure
			aria-label="Open image"
			type="button"
			class="mx-0 my-4 max-h-8/10 max-w-8/10 lg:max-h-[400px] lg:max-w-[400px]"
		>
			<img src={path} {alt} class="block h-auto w-full rounded" />
			<figcaption class="text-surface-950-50 mt-2 text-lg">
				<img src="{base}/icons/cc-license.svg" alt="CC " class="inline-block h-4 w-4" />
				{caption}
			</figcaption>
		</figure>
	</button>
{/snippet}

<Dialog
	open={modalVisible}
	onOpenChange={() => {
		modalVisible = !modalVisible;
	}}
>
	<Portal>
		<Dialog.Backdrop class="bg-surface-50-950/50 fixed inset-0 z-50" />
		<Dialog.Positioner class="fixed inset-0 z-50 flex items-center justify-center p-4">
			<Dialog.Content
				class="bg-surface-50-950 h-full max-h-3/4 w-full max-w-3/4 space-y-4 p-4 shadow-xl"
			>
				<header class="w-full justify-end p-2">
					<Dialog.CloseTrigger>
						<XIcon class="size-8" />
					</Dialog.CloseTrigger>
				</header>
				<Dialog.Description class="flex h-full items-center justify-center">
					<!-- <p>Hello</p> -->
					<figure
						class="mx-auto my-4 flex max-h-[80vh] w-full max-w-[80vw] flex-col items-center gap-4"
					>
						<img
							src={modalInfo.path}
							alt={modalInfo.alt}
							class="h-auto max-h-[calc(60vh-3rem)] w-full object-contain object-center"
						/>
						<figcaption class="text-surface-950-50 mt-2 text-2xl">
							<img src={`${base}/icons/cc-license.svg`} alt="CC " class="inline-block h-6 w-6" />
							{modalInfo.caption}
						</figcaption>
					</figure>
				</Dialog.Description>
			</Dialog.Content>
		</Dialog.Positioner>
	</Portal>
</Dialog>

<div class="grid grid-cols-[1fr] gap-10 lg:grid-cols-[2fr_1fr]">
	<div>
		<h1 class="h1">Einleitung</h1>
		<h2 class="h2">
			Die Akten des Konzils von Ephesus 431. Übersetzung, Einleitung, Kommentar und Register
		</h2>

		<p class="w-full">
			Am zehnten April des Jahres 428 wurde Nestorius, der zuvor als Mönch in der Nähe von Antiochia
			gelebt hatte, zum neuen Bischof von Konstantinopel ernannt. Schon bald nach seinem Amtsantritt
			setzte er sich mit der Frage auseinander, wie man Maria in ihrer Eigenschaft als Mutter Jesu
			in der angemessensten Weise bezeichnen solle. Diese Aufgabe erfüllte seiner Meinung nach der
			Begriff ‚Christusgebärerin‘ am besten, da durch ihn sowohl das göttliche als auch das
			menschliche Element in dem von ihr zur Welt gebrachten Sohn erfasst sei. Den für Maria zu
			dieser Zeit bereits im kirchlichen Sprachgebrauch etablierten Titel ‚Gottesgebärerin‘
			kritisierte er in der Folge in mehreren Predigten als sachlich verfehlt. Dieses Vorgehen löste
			unter den Anhängern dieses Titels scharfe Kritik aus, zu deren Wortführer sich schließlich
			Kyrill, der Bischof von Alexandria, aufschwang. Der Streit breitete sich aus und erfasste
			weite Teile der Kirche. Schließlich sah sich Kaiser Theodosius II. genötigt, ein ökumenisches
			Konzil einzuberufen, um den gebrochenen kirchlichen Frieden wiederherzustellen.
		</p>

		<p>
			Die Geschehnisse rund um das Konzil von Ephesus, das für das Pfingstfest des Jahres 431
			anberaumt wurde, sind uns in zahlreichen Akten überliefert. Diese dokumentieren nicht nur das
			Konzil selbst, sondern auch seine Vor- und Nachgeschichte. Die Akten sind dabei in
			verschiedenen Sammlungen auf uns gekommen, die jeweils unter eigenen Auswahlkriterien und
			Ordnungsprinzipien zusammengestellt worden sind. Sie wurden in den Jahren 1923–29 von Eduard
			Schwartz in einer epochalen, bis heute maßgeblichen Ausgabe ediert. Er beließ die
			altsprachlichen Texte dabei in der Anordnung, die durch die einzelnen Sammlungen vorgegeben
			war. Ziel unseres Projektes ist es, die Akten des Konzils erstmalig vollständig in eine
			moderne Sprache zu übersetzen, chronologisch zu ordnen und zu kommentieren. Das Projekt wird
			von der DFG gefördert und ist als Langfristvorhaben auf einen Zeitraum von zehn Jahren
			angesetzt (2016-2026).
		</p>
	</div>

	<div class="mt-5 flex w-full flex-col items-center gap-10 lg:mt-34">
		{@render figure(
			`${base}/images/IMG_Schwarz_Edition_3.jpg`,
			'Fotografie der Schwartz-Edition',
			'Fotografie der Schwartz-Edition'
		)}
	</div>
</div>

<!-- Über dieses Projekt -->
<div class="grid grid-cols-[1fr] gap-10 lg:grid-cols-[2fr_1fr]">
	<div>
		<h1 class="h1">Über dieses Projekt</h1>
		<h2 class="h2">Die Akten des Konzils von Ephesus 431</h2>

		<p>
			Die Akten des III. Ökumenischen Konzils von Ephesus, das im Jahre 431 abgehalten wurde, bilden
			die wichtigste Quellengrundlage für Untersuchungen zur ersten Phase der christologischen
			Streitigkeiten des 5. Jahrhunderts. Sie wurden von Eduard Schwartz in den Jahren 1923-29 in
			der heute maßgeblichen Ausgabe als erster Großband der Reihe Acta Conciliorum Oecumenicorum
			(ACO) ediert.
		</p>

		<p>
			Diese Sammlung beinhaltet nicht nur Dokumente, die den Ablauf und die Verhandlungen des
			eigentlichen Konzils illustrieren, sondern stellt in seiner Textauswahl die gesamte Geschichte
			jenes Streites dar, der um die Frage entbrannte, ob es mit dem rechten Glauben vereinbar sei,
			Maria, die Mutter Jesu, als "Gottesgebärerin" zu bezeichnen: von seinen Anfängen im Jahre 428
			an, über das zur Klärung der Frage einberufene Konzil hinweg bis zu der im Jahre 433 erzielten
			Einigung und den unmittelbaren Nachwirkungen der Auseinandersetzungen.
		</p>

		<h2 class="h2">Bedeutung des Projekts</h2>

		<p>
			Wegen ihrer kaum zu überschätzenden Bedeutung für die Kirchen- und Theologiegeschichte sind
			die Akten des Konzils von Ephesus und die sie begleitenden Dokumente in Teilen natürlich immer
			wieder in moderne Sprachen übersetzt und kommentiert worden, allerdings bisher niemals
			vollständig. Darüber hinaus sind die Dokumente innerhalb der Sammlung, die insgesamt beinahe
			1800 Seiten griechisch- und lateinischsprachiger Texte umfasst, nicht chronologisch
			angeordnet, sondern in verschiedene, überlieferungstechnisch bedingte Einzelsammlungen
			aufgeteilt, die ihrerseits ebenfalls nicht durchgängig nach chronologischen Gesichtspunkten
			gegliedert sind.
		</p>

		<p>
			Ziel des hier vorgestellten Projektes ist es daher, die Dokumente der Schwartzschen Sammlung
			erstmalig vollständig in eine moderne Sprache zu übertragen, ausführlich einzuleiten und zu
			kommentieren und sie in einer Reihenfolge anzuordnen, die den Ablauf der Konzilsverhandlungen
			und der das Konzil umgebenden Ereignisse für den Rezipienten unmittelbar transparent macht.
			Der Kommentar soll dabei nicht nur theologische, sondern auch historische,
			geistesgeschichtliche und philologische Fragen behandeln. Die kommentierte Übersetzung der
			Akten soll schließlich in gedruckter und digitaler Form veröffentlicht werden.
		</p>
	</div>

	<div class="mt-5 flex w-full flex-col items-center gap-10 lg:mt-34">
		{@render figure(
			`${base}/images/kg_projekt_ephesus.jpg`,
			'Ruinen der Marienkirche in Ephesos',
			'Ruinen der Marienkirche in Ephesos'
		)}

		{@render figure(
			`${base}/images/Apse_mosaics,_1_of_4_-_Santa_Maria_Maggiore_-_Rome,_Italy_-_DSC05723.jpg`,
			'Bogen mit Mosaikzyklus',
			'Bogen mit Mosaikzyklus in der römischen Kirche Santa Maria Maggiore. Die auf dem Mosaik enthaltenen Motive betonen zum Teil die ‚Gottesmutterschaft‘ Mariens'
		)}
	</div>
</div>

<!-- Ansprechpersonen -->
<div class="grid grid-cols-[1fr] gap-10 lg:grid-cols-[2fr_1fr]">
	<div>
		<h1 class="h1">Ansprechpersonen</h1>
		<p>
			Ansprechpartner für den inhaltlichen Teil dieses Projekt, das seit Januar 2016 als
			Langfristvorhaben von der DFG gefördert wird, sind:
		</p>

		<ul class="mt-2 mb-10 ml-5 list-disc font-bold **:text-xl">
			<li>
				<a
					href="https://www.etf.uni-bonn.de/de/fakultaet/kirchengeschichte/alte-kirchengeschichte/wk"
					target="_blank"
					rel="noopener noreferrer">Prof. Dr. Wolfram Kinzig</a
				>
			</li>
			<li>
				<a
					href="https://www.etf.uni-bonn.de/de/personen/personen-people/thomas-brueggemann"
					target="_blank"
					rel="noopener noreferrer">Dr. Thomas Brüggemann (Leiter der Arbeitsstelle)</a
				>
			</li>
			<li>
				<a
					href="https://www.etf.uni-bonn.de/de/personen/personen-people/sabine-luetkemeyer"
					target="_blank"
					rel="noopener noreferrer">Dr. Sabine Lütkemeyer</a
				>
			</li>
			<li>
				<a
					href="https://www.etf.uni-bonn.de/de/fakultaet/kirchengeschichte/alte-kirchengeschichte/team/jb"
					target="_blank"
					rel="noopener noreferrer">Dr. Julia Beier</a
				>
			</li>
		</ul>

		<p>
			Für die technische Umsetzung ist die Digital Humanities der Universität Bern verantwortlich:
		</p>

		<p class="mt-2 ml-5 text-xl font-bold">
			Universität Bern<br />
			Walter Benjamin Kolleg<br />
			Digital Humanities<br />
			Muesmattstrasse 45<br />
			3012 Bern
		</p>
		<br />
		<p>DFG-Fördernummer: 282331637</p>
	</div>
	<div class="mt-5 flex w-full flex-col items-center gap-10 lg:mt-34">
		{@render figure(
			'https://upload.wikimedia.org/wikipedia/commons/6/68/Concile-Ephese-Fourviere-detail.jpg',
			'Mosaik',
			'Detail des Mosaiks in der Basilika von Fourvière in Lyon mit Kyrill von Alexandria in der Mitte'
		)}
	</div>
</div>
