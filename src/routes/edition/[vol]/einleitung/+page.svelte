<script lang="ts">
	import { ArrowUpIcon } from '@lucide/svelte';

	let { data } = $props();
</script>

<div class="maintext">{@html data.intro?.text}</div>

<!-- <div class="footnotes mt-10 grid grid-cols-[100px_auto] gap-x-4">
	<h2 class="h2 col-span-2 col-start-1">Fußnoten</h2>
	{#each data.intro?.footnotes as footnote}
		<div id={`note-${footnote.number}`} class="col-span-1 col-start-1">
			<p class="text-right">
				<sup>{@html footnote.number}</sup>
				<a
					href={'#ref-' + footnote.number}
					aria-label={'Back to note ' + footnote.number}
					class="back-link inline-block"
					title="Back to note"
				>
					<ArrowUpIcon size="24" />
				</a>
			</p>
		</div>
		<div class="col-span-1 col-start-2">
			{@html footnote.text}
		</div>
	{/each}
</div> -->

<!-- HARDCODED FIX //!Change this! -->
<div class="mx-auto min-h-screen w-full max-w-[1500px] flex-1 overflow-auto px-5 pt-10 pb-30">
	<!--[!--><!----><!----><!----><!----><!----><!----><!---->
	<div class="maintext s-Q0jtzNDKPuIC">
		<article lang="de-DE">
			<div>
				<h1 class="h1">Eine vorläufige Einleitung</h1>
				<p>
					Was der rechte Glaube ist, war in den Zwanzigerjahren des fünften Jahrhunderts durch das
					Bekenntnis von Nizäa (325) definiert.<a
						href="#note-1"
						aria-label="Zu Fußnote 1 springen"
						class="note-ref"><sup id="ref-1">1</sup></a
					>
					Das Nizänum war vor allem mit dem Ziel formuliert worden, die volle Gottheit des Sohnes zu
					betonen. Der zweite Artikel des Symbols, der die Merkmale des Sohnes bestimmt, hat ein durchgängiges
					präpositionales Objekt, dem die verschiedenen Glaubensinhalte zugeordnet werden. Dieses wird
					zunächst als der ‚eine Herr Jesus Christus‘ eingeführt, dann als ‚aus dem Vater gezeugter Sohn‘
					beschrieben und bald darauf als ‚wahrer Gott von wahrem Gott‘ und als ‚wesensgleich‘ mit dem
					Vater prädiziert. Im weiteren Verlauf wird von ihm aber auch ausgesagt, dass er ‚um unserer
					Rettung willen herabgestiegen‘ sei, ‚Fleisch und Mensch geworden‘ sei, ‚gelitten‘ habe, ‚auferstanden‘
					und ‚zu den Himmeln aufgestiegen‘ sei.<a
						href="#note-2"
						aria-label="Zu Fußnote 2 springen"
						class="note-ref"><sup id="ref-2">2</sup></a
					>
					Das als ‚Herr Jesus Christus‘ bezeichnete Objekt des Glaubens umfasst also sowohl Eigenschaften,
					die – wie die Homousie mit dem Vater – eigentlich nur Gott zugeschrieben werden können, als
					auch solche, die – wie das Leiden – nach damaligem Verständnis nur einem Menschen attestiert
					werden können. In ihm lässt sich somit Göttliches <em>und</em>
					Menschliches finden. Der Text legt aber nicht genauer fest, in welchem Verhältnis diese beiden
					Bereiche zueinander stehen. Hier bietet er großen Raum für Interpretationen.<a
						href="#note-3"
						aria-label="Zu Fußnote 3 springen"
						class="note-ref"><sup id="ref-3">3</sup></a
					>
				</p>
				<p>
					Am zehnten April des Jahres 428 wurde Nestorius zum neuen Bischof von Konstantinopel
					gewählt. Er stammte aus der Stadt Germanicia in der römischen Provinz Syria und war somit
					ein Auswärtiger. Mit Philipp von Side und Proklos von Kyzikos hatte es auch zwei
					potentielle Kandidaten für das Amt gegeben, die sich schon in der Stadt etabliert hatten
					und jeweils über eine große Anhängerschaft unter ihren Bürgern und Klerikern <a
						href="#note-4"
						aria-label="Zu Fußnote 4 springen"
						class="note-ref"><sup id="ref-4">4</sup></a
					>
					Vielleicht waren es aber auch gerade die aus einer solchen Faktionierung resultierenden Probleme,
					die dazu führten, dass schließlich ein Mann von außerhalb in das Amt berufen wurde.<a
						href="#note-5"
						aria-label="Zu Fußnote 5 springen"
						class="note-ref"><sup id="ref-5">5</sup></a
					>
					Jedenfalls hatte es sich der neue Mann auf dem Bischofsthron offenbar von Anfang an auf die
					Fahnen geschrieben, die Hauptstadt des östlichen Reiches von den dort grassierenden Häresien
					zu reinigen, und ging diesem Vorsatz schon unmittelbar nach seinem Amtsantritt auch entschlossen
					nach.<a href="#note-6" aria-label="Zu Fußnote 6 springen" class="note-ref"
						><sup id="ref-6">6</sup></a
					>
				</p>
				<p>
					<span id="page-XII"></span>Diesem Streben, den rechten Glauben durchzusetzen, das sich
					schon in den Anfängen zeigt, ist es sicherlich auch zuzuschreiben, dass Nestorius zu einer
					der beiden Galionsfiguren einer christologischen Kontroverse wurde, die ihn schon nach
					drei Jahren wieder das Amt kosten sollte und schließlich im Exil enden ließ. Wie es im
					Detail zu dieser Debatte kam, lässt sich heute nicht mehr mit Sicherheit bestimmen. Folgt
					man seinem eigenen Bericht,<a
						href="#note-7"
						aria-label="Zu Fußnote 7 springen"
						class="note-ref"><sup id="ref-7">7</sup></a
					>
					den er allerdings erst im Nachhinein verfasst hat, fand er in Konstantinopel zwei Parteien
					vor, die im Streit darüber lagen, wie man Maria, die Mutter Jesu, am besten benennen solle.
					Die einen, die anscheinend in dem Ruf standen, Manichäer zu sein, von Nestorius selbst aber
					offenbar auch mit den Apolinaristen assoziiert wurden, wollten sie ‚Mutter Gottes‘ (<span
						data-lang="greek">θεοτόκος</span
					>)<a href="#note-8" aria-label="Zu Fußnote 8 springen" class="note-ref"
						><sup id="ref-8">8</sup></a
					>
					nennen. Die anderen, die als Anhänger des als Häretiker verurteilten Photin von Sirmium betrachtet
					wurden, plädierten für die Bezeichnung ‚Menschenmutter‘ (<span data-lang="greek"
						>ἀνθρωποτόκος</span
					>).<a href="#note-9" aria-label="Zu Fußnote 9 springen" class="note-ref"
						><sup id="ref-9">9</sup></a
					>
					Nestorius unterzog die beiden Parteien dann seinem Bekunden nach einer Befragung, in deren
					Rahmen er schließlich feststellte, dass auf keiner der Seiten wirklich häretische Meinungen
					vertreten wurden und es sich bei dem Streitpunkt vornehmlich um ein begriffliches Problem handele.
					Vor diesem Hintergrund will er dann als gleichsam in der Mitte liegende und durch die neutestamentlichen
					Schriften ausreichend abgesicherte Alternative den Begriff ‚Mutter Christi‘ (<span
						data-lang="greek">χριστοτόκος</span
					>) vorgeschlagen haben. Dieser sei dann von beiden Seiten akzeptiert worden, und es habe
					Ruhe in dieser Frage geherrscht, bis einige, die ‚nach dem Episkopat trachteten‘, diese
					beendeten.<a href="#note-10" aria-label="Zu Fußnote 10 springen" class="note-ref"
						><sup id="ref-10">10</sup></a
					>
				</p>
				<p>
					Ob diese Schilderung den Tatsachen entspricht, ist durchaus zweifelhaft. Der
					Kirchenhistoriker Sokrates beschreibt die Anfänge der Streitigkeiten zum Beispiel in einer
					Weise, die dem Bericht des Nestorius zwar nicht direkt widerspricht, sich aber auch nicht
					ohne Weiteres mit ihm harmonisieren lässt. Er berichtet, dass ein Presbyter namens
					Anastasios, der im Gefolge des Nestorius aus Antiochia nach Konstantinopel gekommen sei,
					in der Kirche als Lehre verkündet habe: „Niemand darf Maria Gottes<span id="page-XIII"
					></span>gebärerin nennen. Es ist nicht möglich, dass Gott von einem Menschen geboren
					wird.“<a href="#note-11" aria-label="Zu Fußnote 11 springen" class="note-ref"
						><sup id="ref-11">11</sup></a
					>
					Daraufhin soll sowohl unter Laien als auch unter Klerikern eine allgemeine Unruhe ausgebrochen
					sein. Nestorius habe sich dann im Nachgang darum bemüht, die Aussage seines Untergebenen, den
					er nicht dem Vorwurf der Blasphemie preisgeben wollte, abzusichern, indem er dieses Thema in
					der Kirche häufig bei seinen Predigten aufgriff, und dabei den Begriff ‚Gottesgebärerin‘ in
					ausführlichen Erörterungen verdammte. Sokrates berichtet also nicht davon, dass Nestorius in
					einer schon existenten Streitfrage als Vermittler aufgetreten sei (und diesen Streit zumindest
					vorübergehend hätte schlichten können), sondern sieht den Ursprung des Konfliktes ganz klar
					bei dem Presbyter Anastasios. Dessen Aussage läuft im Umkehrschluss bemerkenswerterweise darauf
					hinaus, dass man Maria eigentlich als ‚Menschengebärerin‘, also als
					<span data-lang="greek">ἀνθρωποτόκος</span>
					bezeichnen müsste. Dies ist vor allem vor dem Hintergrund interessant, dass jüngere Untersuchungen
					dargelegt haben, dass die Verwendung des Begriffes
					<span data-lang="greek">ἀνθρωποτόκος</span>
					vor der Ankunft des Nestorius in Konstantinopel nicht nachweisbar ist. Es ist daher auch gut
					möglich, dass der Begriff erst durch Gefolgsleute des Nestorius in die Stadt importiert und
					auf diese Weise zum Anlass für Auseinandersetzungen wurde.<a
						href="#note-12"
						aria-label="Zu Fußnote 12 springen"
						class="note-ref"><sup id="ref-12">12</sup></a
					>
				</p>
				<p>
					<a href=""></a>Erwähnenswert im Zusammenhang mit dem Bericht, den Nestorius in seinem
					<em>Liber Heraclidis</em>
					gibt, ist weiterhin die sogenannte <em>Contestatio</em> des Eusebius von Dorylaeum (CV18).<a
						href="#note-13"
						aria-label="Zu Fußnote 13 springen"
						class="note-ref"><sup id="ref-13">13</sup></a
					>
					In dieser kurzen, aber folgenreichen Schrift, die ihrer Intention nach<a
						href="#note-14"
						aria-label="Zu Fußnote 14 springen"
						class="note-ref"><sup id="ref-14">14</sup></a
					>
					und höchstwahrscheinlich auch in Wirklichkeit eine weite öffentliche Verbreitung fand, stellt
					Eusebius Aussagen, die von Nestorius getätigt worden sind, Äußerungen gegenüber, die er dem
					im Jahre 268/269 in Antiochia als Häretiker verurteilten Paulus von Samosata zuschreibt, und
					kommt dabei zu dem Schluss, dass beide dasselbe aussagen. Die
					<em>Contestatio</em>
					enthält, wenn man sich nach den Rekonstruktionen von Friedrich Loofs richtet, Exzerpte aus
					vier Predigten, die Nestorius verfasst hat. Zwei davon propagieren eindeutig bereits den im
					<em>Liber Heraclidis</em>
					als friedensstiftenden Kompromiss beschriebenen
					<span data-lang="greek">χριστοτόκος</span>-Begriff.<a
						href="#note-15"
						aria-label="Zu Fußnote 15 springen"
						class="note-ref"><sup id="ref-15">15</sup></a
					>
					Es lässt sich nun leider nicht ermitteln, wann genau die <em>Contestatio</em> in Umlauf
					gebracht wurde. Einiges spricht dafür, dass dies schon <span id="page-XIV"></span>im Jahre
					428 geschah. Es muss jedoch spätestens im Frühjahr 429 erfolgt sein.<a
						href="#note-16"
						aria-label="Zu Fußnote 16 springen"
						class="note-ref"><sup id="ref-16">16</sup></a
					>
					In jedem Fall handelt es sich aber um ein Dokument aus der Frühphase der Streitigkeiten. Wenn
					Eusebius darin also aus Predigten zitiert, die schon den von Nestorius etablierten Kompromissbegriff
					beinhalten, kann die Phase der Ruhe, die durch ihn eingetreten sein soll, auf keinen Fall von
					langer Dauer gewesen sein.<a href=""></a>
				</p>
				<p>
					Es kann und soll hier aber nicht geklärt werden, worin nun genau der Auslöser für den
					Konflikt lag. An dieser Stelle erscheint es wichtiger, den weiteren Verlauf der
					Streitigkeiten noch näher zu betrachten. In dem oben grob abgesteckten Zeitrahmen trat
					nämlich erstmals auch der zweite große Wortführer der Streitigkeiten, Kyrill von
					Alexandria, auf den Plan. Zunächst bezog er in seinem Osterbrief des Jahres 429, welcher
					vermutlich gegen Ende des vorangegangenen Jahres verfasst wurde,<a
						href="#note-17"
						aria-label="Zu Fußnote 17 springen"
						class="note-ref"><sup id="ref-17">17</sup></a
					>
					Stellung zu der Kontoverse um die richtige Benennung Mariens. Innerhalb des Briefes verweist
					Kyrill weder in klar erkennbarer Form auf Nestorius, noch verwendet er überhaupt den in Diskussion
					stehenden Begriff <span data-lang="greek">θεοτόκος</span>. Er liefert jedoch eine
					ausführliche Christologie, die einen klaren Schwerpunkt auf der Betonung der Einheit des
					inkarnierten göttlichen Logos mit dem von Maria geborenen Menschen hat.<a
						href="#note-18"
						aria-label="Zu Fußnote 18 springen"
						class="note-ref"><sup id="ref-18">18</sup></a
					>
					Zudem weist er auch ausdrücklich darauf hin, dass man die Mutter dieses geeinten Wesens mit
					Fug und Recht als ‚Mutter Gottes‘ (<span data-lang="greek">μήτηρ θεοῦ</span>) bezeichnen
					könne.<a href="#note-19" aria-label="Zu Fußnote 19 springen" class="note-ref"
						><sup id="ref-19">19</sup></a
					>
					Liest man den Osterbrief in seinem geschichtlichen Kontext, wirkt er also wie eine eindeutige
					Stellungnahme innerhalb der laufenden Debatte. Liest man ihn hingegen für sich, weist nur wenig
					darauf hin, dass sich Kyrill mit seinen Ausführungen an einer Diskussion beteiligt, die gerade
					lebhaft und kontrovers geführt wird. Es lässt sich weder ein aktueller Anlass für den christologischen
					Exkurs ausmachen, noch lässt sich ohne Weiteres erkennen, dass mit diesem ein konkreter Gegner,
					also eine identifizierbare zeitgenössische Person, anvisiert wird.<a
						href="#note-20"
						aria-label="Zu Fußnote 20 springen"
						class="note-ref"><sup id="ref-20">20</sup></a
					>
				</p>
				<p>
					Dies ändert sich mit dem ‚Brief an die ägyptischen Mönche‘ (CV1), den Kyrill im Frühjahr
					429 verfasst haben dürfte.<a
						href="#note-21"
						aria-label="Zu Fußnote 21 springen"
						class="note-ref"><sup id="ref-21">21</sup></a
					>
					Zwar wird Nestorius auch darin nicht namentlich erwähnt, aber der Bischof von Alexandria gibt
					einen klar definierten Grund dafür an, warum er sich in einem Schreiben an die in seinem Verantwortungsbereich
					ansässigen Mönche wendet:<a
						href="#note-22"
						aria-label="Zu Fußnote 22 springen"
						class="note-ref"><sup id="ref-22">22</sup></a
					>
					Ihm sei zu Ohren gekommen, dass ‚gefährliche Schwätzereien‘ die
					<span id="page-XV"></span>Adressaten erreicht hätten und gewisse Leute umherzögen, die
					deren ‚einfachen Glauben‘ zermürbten, indem sie sie in inhaltsleeren Reden befragten, ob
					man die heilige Jungfrau nun Gottesgebärerin nennen dürfe oder nicht.<a
						href="#note-23"
						aria-label="Zu Fußnote 23 springen"
						class="note-ref"><sup id="ref-23">23</sup></a
					>
					Es wird also von vornherein deutlich, dass es hier um ein aktuelles Problem geht. Darüber hinaus
					nimmt der Brief an einigen Stellen konkret und klar erkennbar auf die Christologie Nestorius’
					Bezug. So verwendet Kyrill beispielsweise in einem Abschnitt, in dem er aufzeigen will, dass
					‚Christus‘ kein exklusiv auf den Inkarnierten, den Immanuel<a
						href="#note-24"
						aria-label="Zu Fußnote 24 springen"
						class="note-ref"><sup id="ref-24">24</sup></a
					>, anzuwendender Titel sei, den Begriff ‚Christusgebärerin‘.<a
						href="#note-25"
						aria-label="Zu Fußnote 25 springen"
						class="note-ref"><sup id="ref-25">25</sup></a
					>
					Diesen hatte ja Nestorius seiner eigenen Darstellung nach als Kompromiss in der ihm angetragenen
					Streitfrage vorgeschlagen, und da er vor den Streitigkeiten nicht belegt ist, spricht vieles
					dafür, dass er tatsächlich auch von ihm geprägt wurde. Auch wenn Kyrill sich, wie er es auch
					sonst häufig tut, in seiner Argumentation des Mittels der Prokatalepsis bedient und mögliche
					gegnerische Einwände vorwegnimmt, muten diese zum Teil wie Paraphrasen von Aussagen an, die
					Nestorius in vermutlich damals schon in Umlauf befindlichen Predigten formuliert hatte.<a
						href="#note-26"
						aria-label="Zu Fußnote 26 springen"
						class="note-ref"><sup id="ref-26">26</sup></a
					> Die Zielrichtung von Kyrills Ausführungen ist nunmehr eindeutig bestimmbar geworden.
				</p>
				<p>
					Der ‚Brief an die ägyptischen Mönche‘ blieb nicht lange auf den Kreis seiner nominellen
					Adressaten beschränkt. Schon bald gelangte er auch nach Konstantinopel, was bei Nestorius
					offenbar beträchtlichen Unmut auslöste.<a
						href="#note-27"
						aria-label="Zu Fußnote 27 springen"
						class="note-ref"><sup id="ref-27">27</sup></a
					>
					Ungefähr zu dieser Zeit hatte man anscheinend, auch wenn Näheres im Dunkeln bleibt, in Rom
					bereits Notiz von den Schriften des Nestorius genommen, diese als anstoßerregend eingestuft
					und sich auf der Suche nach Rat an Kyrill gewandt.<a
						href="#note-28"
						aria-label="Zu Fußnote 28 springen"
						class="note-ref"><sup id="ref-28">28</sup></a
					>
					Gegen Kyrill stand auf der anderen Seite eine Anklage im Raum, deren genauer Inhalt leider
					unklar ist, die aber auf jeden Fall von einigen Alexandrinern erhoben worden war und deren
					Verhandlung pikanterweise Nestorius übernehmen sollte.<a
						href="#note-29"
						aria-label="Zu Fußnote 29 springen"
						class="note-ref"><sup id="ref-29">29</sup></a
					>
					Der Konflikt weitete sich aus, die Situation spitzte sich zu. Kyrill reagierte mit einer überaus
					produktiven schriftstellerischen Tätigkeit. Er wandte sich beispielsweise schon bald direkt
					an Nestorius, den er in zwei Briefen <span id="page-XVI"></span>(CV2<a
						href="#note-30"
						aria-label="Zu Fußnote 30 springen"
						class="note-ref"><sup id="ref-30">30</sup></a
					>
					u. CV4<a href="#note-31" aria-label="Zu Fußnote 31 springen" class="note-ref"
						><sup id="ref-31">31</sup></a
					>) dazu zu bewegen suchte, seine Haltung zum <span data-lang="greek">θεοτόκος</span>-Titel
					zu revidieren. Beide Briefe wurden ablehnend beantwortet (CV3<a
						href="#note-32"
						aria-label="Zu Fußnote 32 springen"
						class="note-ref"><sup id="ref-32">32</sup></a
					>
					u. CV5<a href="#note-33" aria-label="Zu Fußnote 33 springen" class="note-ref"
						><sup id="ref-33">33</sup></a
					>). Er verfasste eine umfangreiche Streitschrift (CV166)<a
						href="#note-34"
						aria-label="Zu Fußnote 34 springen"
						class="note-ref"><sup id="ref-34">34</sup></a
					>, in welcher er zahlreiche Exzerpte aus den Predigten seines Opponenten anführte, um
					diesen dann seine eigenen christologischen Thesen gegenüberzustellen. Er nahm nun
					seinerseits Kontakt zu Coelestin, dem Bischof von Rom, auf (CV144)<a
						href="#note-35"
						aria-label="Zu Fußnote 35 springen"
						class="note-ref"><sup id="ref-35">35</sup></a
					>
					und bat diesen dabei um eine verbindliche Stellungnahme, wie man sich angesichts der Umtriebe
					des Nestorius verhalten solle. Schließlich richtete er auch gleich drei längere, unterschiedlich
					adressierte Schriften an das Kaiserhaus (CV7<a
						href="#note-36"
						aria-label="Zu Fußnote 36 springen"
						class="note-ref"><sup id="ref-36">36</sup></a
					>, CV149<a href="#note-37" aria-label="Zu Fußnote 37 springen" class="note-ref"
						><sup id="ref-37">37</sup></a
					>, CV150<a href="#note-38" aria-label="Zu Fußnote 38 springen" class="note-ref"
						><sup id="ref-38">38</sup></a
					>), um den Kaiser selbst und die Frauen in dessen unmittelbarer Umgebung von seinen
					christologischen Positionen zu überzeugen.<a
						href="#note-39"
						aria-label="Zu Fußnote 39 springen"
						class="note-ref"><sup id="ref-39">39</sup></a
					>
				</p>
				<p>
					Nicht zuletzt Kyrills Bemühungen, das Kaiserhaus für sich zu gewinnen, machen deutlich,
					dass die Diskussion um die korrekte Titulierung Mariens und die damit zusammenhängenden
					christologischen Implikationen schon längst keine rein kirchliche Angelegenheit mehr war –
					sie waren zu einem Politikum geworden. So sah sich Theodosius schließlich genötigt, eine
					Synode von Bischöfen aus allen Teilen des Reiches einzuberufen, um die aufgeworfenen
					Fragen verbindlich und ordnungsgemäß klären zu lassen.<a
						href="#note-40"
						aria-label="Zu Fußnote 40 springen"
						class="note-ref"><sup id="ref-40">40</sup></a
					>
					Das Einladungsschreiben (CV 25) datiert auf den 19. November 430. Alle vorherigen Beschlüsse,
					die eventuell in kleineren Gremien getroffen worden waren, waren damit außer Kraft gesetzt.<a
						href="#note-41"
						aria-label="Zu Fußnote 41 springen"
						class="note-ref"><sup id="ref-41">41</sup></a
					>
					Die Synode sollte in der kleinasiatischen <span id="page-XVII"></span>Stadt Ephesus
					zusammentreten. Als Termin wurde das Pfingstfest des folgenden Jahres, der 7. Juni 431,
					festgesetzt.<a href="#note-42" aria-label="Zu Fußnote 42 springen" class="note-ref"
						><sup id="ref-42">42</sup></a
					>
				</p>
				<p>
					Das auf diese Weise einberufene Konzil von Ephesus verlief gewiss nicht so, wie der Kaiser
					es sich gewünscht hatte. Die geplante Vollversammlung kam nie zustande. Am 22. Juni 431
					trat eine Synode von mehr als 150 Bischöfen unter der Leitung Kyrills zusammen,
					verurteilte Nestorius in dessen Abwesenheit und setzte ihn ab.<a
						href="#note-43"
						aria-label="Zu Fußnote 43 springen"
						class="note-ref"><sup id="ref-43">43</sup></a
					>
					Vier Tage später trafen schließlich die Angehörigen der Delegation der östlichen Bischöfe,
					welche Nestorius christologisch nahe standen, sich aber verspätet hatten, in der Stadt ein,
					hielten ihrerseits eine Synode ab und verurteilten im Gegenzug Kyrill und Memnon, den Bischof
					von Ephesus.<a href="#note-44" aria-label="Zu Fußnote 44 springen" class="note-ref"
						><sup id="ref-44">44</sup></a
					>
					Es fanden noch weitere separate Sitzungen statt, doch im Herbst des Jahres wurde das Konzil
					durch Theodosius offiziell wieder aufgelöst, ohne dass eine Einigung erzielt worden wäre.<a
						href="#note-45"
						aria-label="Zu Fußnote 45 springen"
						class="note-ref"><sup id="ref-45">45</sup></a
					>
					Diese kam dann schließlich ungefähr anderthalb Jahre später in Form eines Kompromisses zustande,
					der zwischen Johannes, dem Bischof von Antiochia und geistigen Oberhaupt der östlichen Delegation,
					und Kyrill ausgehandelt worden war.<a
						href="#note-46"
						aria-label="Zu Fußnote 46 springen"
						class="note-ref"><sup id="ref-46">46</sup></a
					>
					Doch auch die sogenannte Unionsformel von 433 brachte keine endgültige Ruhe. Sie musste auf
					beiden Seiten gerechtfertigt werden.<a
						href="#note-47"
						aria-label="Zu Fußnote 47 springen"
						class="note-ref"><sup id="ref-47">47</sup></a
					>
					Erst 28 Jahre später, auf dem Konzil von Chalkedon, sollte die Frage nach dem Verhältnis des
					Göttlichen und des Menschlichen in Christus durch einen ordnungsgemäßen synodalen Beschluss
					zumindest in dogmatischer Hinsicht geklärt werden.<a
						href="#note-48"
						aria-label="Zu Fußnote 48 springen"
						class="note-ref"><sup id="ref-48">48</sup></a
					>
				</p>
				<p>
					Dessen ungeachtet ist das Konzil von Ephesus als drittes der sogenannten ökumenischen
					Konzilien das erste dieser Reihe, von dem uns in größerem Umfang Akten überliefert sind.
					Es handelt sich bei dieser Überlieferung jedoch um keine einheitliche Sammlung, über die
					sich der Ablauf der Verhandlungen in seiner chronologischen Ordnung durch eine einfache,
					lineare Rezeption des Materials erschließen ließe. Die Akten sind vielmehr in einer Anzahl
					verschiedenartiger Sammlungen auf uns gekommen, die jeweils unter eigenen Auswahlkriterien
					und nach eigenen Ordnungsprinzipien zusammengestellt worden sind.<a
						href="#note-49"
						aria-label="Zu Fußnote 49 springen"
						class="note-ref"><sup id="ref-49">49</sup></a
					>
					In ihrer Gesamtheit betrachtet bieten sie Zeugnisse, aus denen sich die oben skizzierte Ereigniskette
					– von den Anfängen der Streitigkeiten bis zu ihren Nachwehen – zu weiten Teilen rekonstruieren
					lässt. Darüber hinaus enthalten sie aber auch Dokumente, die nur in einem eher losen und zuwei<span
						id="page-XVIII"
					></span>len auch nicht immer auf Anhieb durchschaubaren Zusammenhang mit dem
					Konzilsgeschehen stehen. Die Akten wurden in den Jahren 1923–29 von Eduard Schwartz in
					einer epochalen, bis heute maßgeblichen Ausgabe ediert. Sie bilden den ersten Großband
					(Tomus) der bis heute fortgesetzten Reihe der Akten zu den Ökumenischen Konzilen (<em
						>Acta Conciliorum Oecumenicorum</em
					>;<em> </em>ACO). Dieser Großband umfasst fünf Teilbände (Volumina), von denen der erste,
					der nicht zuletzt wegen seines Umfangs wiederum in acht Faszikel aufgeteilt ist,
					griechischsprachige Dokumente enthält, während sich in den vier übrigen Bänden vornehmlich
					Dokumente in lateinischer Sprache finden.
				</p>
				<p>
					Schwartz orientierte sich bei seiner Edition an der Überlieferung. Er gab die Akten im
					Kontext der Sammlungen, denen sie angehören, heraus und behielt dabei deren interne
					Ordnung bei. Dieses Vorgehen ist zwar philologisch betrachtet über jeden Zweifel erhaben,
					bereitet dem Rezipienten, der die Abläufe der in den Dokumenten festgehaltenen
					Geschehnisse verfolgen möchte, jedoch erhebliche Probleme. So finden sich zum Beispiel
					Akten, die inhaltlich und kausal in engem Bezug zueinander stehen, an weit verstreuten
					Stellen. Der wichtige Bericht der östlichen Bischöfe an den Kaiser (CA48) etwa, in dem die
					spätere Unionsformel gleichsam schon in einer Rohfassung vorliegt, ist im siebten Faszikel
					des ersten Volumen abgedruckt.<a
						href="#note-50"
						aria-label="Zu Fußnote 50 springen"
						class="note-ref"><sup id="ref-50">50</sup></a
					>
					Die <em>sacra</em> Theodosius’ (CV93), auf die dieser Bericht antwortet, findet sich
					hingegen im dritten Faszikel des ersten Volumen.<a
						href="#note-51"
						aria-label="Zu Fußnote 51 springen"
						class="note-ref"><sup id="ref-51">51</sup></a
					>
				</p>
				<p>
					Ferner sind zahlreiche Dokumente innerhalb der Ausgabe auch in mehrfacher Überlieferung
					vorhanden. Bei den griechischen Akten ist Schwartz zwar so verfahren, dass er die <em
						>Collectio Vaticana</em
					>
					als Grundlage nahm, und wenn zum Beispiel dort enthaltene Dokumente in anderen Sammlungen noch
					einmal auftauchen, diese nicht ein weiteres Mal abdrucken ließ, sondern sie lediglich im Apparat
					der jeweiligen Entsprechung der zuerst edierten Belegstelle berücksichtigte. Bei den lateinischen
					Akten aber, die häufig deutlich variierende Übersetzungen griechischer Originale darstellen,
					edierte er die betreffenden Dokumente auch mehrfach. So findet sich der für den Verlauf der
					ausgetragenen Streitigkeiten überaus wichtige zweite Brief des Kyrill an Nestorius (CV4), der
					auf der Sitzung vom 22. Juni für rechtgläubig erklärt wurde, in griechischer Sprache in der
					<em>Collectio Vaticana</em>, in lateinischer Übersetzung in der
					<em>Collectio Veronensis</em>, in der <em>Collectio Casinensis</em>, in der
					<em>Collectio Palatina </em>und in der<em> Collectio Quesneliana</em>.<a
						href="#note-52"
						aria-label="Zu Fußnote 52 springen"
						class="note-ref"><sup id="ref-52">52</sup></a
					>
				</p>
				<p>
					Wegen ihrer kaum zu überschätzenden Bedeutung für die Kirchen- und Theologiegeschichte
					sind die Akten des Konzils von Ephesus und die sie begleitenden Dokumente in Teilen
					natürlich immer wieder in moderne Sprachen übersetzt und auch kommentiert worden. Die
					umfangreichste Übertragung (ins Englische) aus älterer Zeit stammt von dem amerikanischen
					anglikanischen Pfarrer James Chrystal (1832–1908) <span id="page-XIX"></span>und wurde in
					den Jahren 1895–1908 im Eigenverlag publiziert.<a
						href="#note-53"
						aria-label="Zu Fußnote 53 springen"
						class="note-ref"><sup id="ref-53">53</sup></a
					>
					Seine Auswahl nimmt vor allem die eigentlichen Verhandlungen in den Blick. Wichtige Dokumente
					wurden aber an den Stellen, an denen sie verlesen wurden, eingereiht. Erst jüngst brachten
					Richard Price und Thomas Graumann eine Kollektion der Akten heraus, welche sie mit einer ebenso
					ausführlichen wie hilfreichen Einleitung versahen.<a
						href="#note-54"
						aria-label="Zu Fußnote 54 springen"
						class="note-ref"><sup id="ref-54">54</sup></a
					> Die einzelnen Dokumente sind annotiert und verfügen zum Teil noch einmal über eigene Einleitungen.
					Die Ausgabe bietet ausgewählte Materialien, die das Geschehen vor dem Konzil beleuchten, und
					legt den Schwerpunkt dann auf die Verhandlungen und die sie begleitende Korrespondenz bis zur
					offiziellen Auflösung des Konzils. Das Nachgeschehen wird schließlich, ohne die betreffenden
					Dokumente im Text zu präsentieren, in einem kurzen Epilog zusammengefasst. Die Edition ermöglicht
					einen anschaulichen Überblick über Anlass und Ablauf des Konzils, präsentiert das überaus umfangreiche
					und vielfältige überlieferte Material aber wie alle übrigen bisherigen Übersetzungen nur in
					Auszügen.
				</p>
				<p>
					Mit der hier präsentierten Ausgabe wird nun erstmals eine Übersetzung sämtlicher in
					Schwartz’ erstem Tomus veröffentlichter Dokumente vorgelegt. Diese werden dabei in einer
					Anordnung dargeboten, die den Verlauf der Konzilsverhandlungen und die Chronologie der das
					Konzil umgebenden Ereignisse für den Rezipienten unmittelbar transparent werden lässt.<a
						href="#note-55"
						aria-label="Zu Fußnote 55 springen"
						class="note-ref"><sup id="ref-55">55</sup></a
					> Jedes einzelne Dokument wird zudem ausführlich kommentiert. Mehrfach überlieferte Dokumente
					werden nach Möglichkeit zusammengeführt, relevante Abweichungen unter ihnen kommentiert. Bei
					Abweichungen, die so tiefgreifend sind, dass sich diese Methode nicht bewährt, wird eine synoptische
					Präsentation der betreffenden Dokumente geboten. Neben der gedruckten Ausgabe erfolgt außerdem
					noch eine digitale Veröffentlichung.
				</p>
				<p>
					Dieser erste, hier vorliegende Band der Ausgabe beinhaltet sämtliche Dokumente, die vor
					der Einberufung des Konzils durch Kaiser Theodosius II. datieren, sowie die drei
					Einladungen selbst.<a href="#note-56" aria-label="Zu Fußnote 56 springen" class="note-ref"
						><sup id="ref-56">56</sup></a
					> Es werden noch zwei weitere Bände folgen. Der erste von ihnen soll die eigentlichen Konzilsverhandlungen
					und die sie begleitenden Geschehnisse umfassen, der zweite dann die Begebenheiten nach der
					Auflösung des Konzils, also den Weg der Kompromissfindung, die Unionsformel und die anschließenden
					Diskussionen, die dadurch ausgelöst wurden. Mit dem dritten Band soll dann auch eine ausführliche
					Einleitung erscheinen, die dieses knappe Provisorium ersetzen wird.
				</p>
			</div>
			<div>
				<h1 class="h1">
					<span id="page-XXI"></span>Zur chronologischen Anordnung der Dokumente in Band 1
				</h1>
				<p>
					Die Zeitspanne, aus der die Dokumente des vorliegenden Bandes stammen, umfasst die Jahre
					von der Ernennung des Nestorius zum Bischof von Konstantinopel (428) bis zur Einberufung
					des Konzils von Ephesus durch den Kaiser im November 430. Die Schriftstücke geben einen
					Einblick in die Anfangsphase der christologischen Auseinandersetzungen, die schließlich so
					eskalierten, dass ein Eingreifen des Kaisers erforderlich war. Doch so klar aus den
					Dokumenten die historische Entwicklung im Ganzen ersichtlich ist, so schwierig ist im
					Einzelnen die genaue Rekonstruktion der Reihenfolge der Schriftstücke.<a
						href="#note-57"
						aria-label="Zu Fußnote 57 springen"
						class="note-ref"><sup id="ref-57">57</sup></a
					> Nur vergleichsweise wenige Dokumente sind datiert, die Bezüge der übrigen zueinander sind
					nicht immer so klar und signifikant, dass die Reihenfolge als gesichert gelten kann. Um dennoch
					eine sinnvolle und nachvollziehbare Ordnung zu gewährleisten, gelten hier wie in den Folgebänden
					im Einzelnen die folgenden Kriterien, wobei oberste Richtlinie für die Anordnung der Konzilsakten
					die Reihenfolge ihres Entstehens ist:
				</p>
				<p>
					– Datierte Dokumente und Schriftstücke, deren Entstehungsdatum aus anderen Quellen bekannt
					ist oder sich aus dem Inhalt erschließen lässt, wurden grundsätzlich nach dem
					Entstehungsdatum eingeordnet.
				</p>
				<p>
					– Undatierte Texte ohne direkten Bezug auf das Konzilsgeschehen, die entweder einer
					früheren Zeit entstammen oder sich zeitlich nicht einordnen lassen, jedoch für die
					Argumentation vor, während oder nach dem Konzil herangezogen wurden, sind je nach Sachlage
					bei dem Dokument untergebracht, in dem sie erwähnt werden, oder aber im Anhang des Bandes,
					für den sie Relevanz besitzen.
				</p>
				<p>
					– Undatierte Antwortschreiben und im Schreiben als solche ausgewiesene Begleitdokumente
					sowie Reaktionen beispielsweise auf Predigten wurden, sofern sie keine Anhaltspunkte für
					eine genauere Datierung bieten, hinter die Dokumente platziert, auf die sie Bezug nehmen
					bzw. zu denen sie gehören.
				</p>
				<p>
					– In den Anhang oder in die Fußnoten wurden auch die Schriftstücke aufgenommen, die
					spätere Bemerkungen des jeweiligen Herausgebers oder Übersetzers der Textsammlungen, etwa
					des Diakons Rusticus (6. Jhd.)<a
						href="#note-58"
						aria-label="Zu Fußnote 58 springen"
						class="note-ref"><sup id="ref-58">58</sup></a
					>,
				</p>
				<p>
					Als das früheste Zeugnis des christologischen Streites zwischen Kyrill und Nestorius gilt
					allgemein die Predigt des Nestorius, <span class="">sermo</span><span class=""> 9</span>
					(CPal20)<a href="#note-59" aria-label="Zu Fußnote 59 springen" class="note-ref"
						><sup id="ref-59">59</sup></a
					>, in der er im Jahr 428 erstmals seine Lehre von den zwei Naturen Christi vorstellte.<a
						href="#note-60"
						aria-label="Zu Fußnote 60 springen"
						class="note-ref"><sup id="ref-60">60</sup></a
					>
					Eduard Schwartz<a href="#note-61" aria-label="Zu Fußnote 61 springen" class="note-ref"
						><sup id="ref-61">61</sup></a
					>
					ver<span id="page-XXII"></span>weist darauf, dass Kyrill sich bereits im Osterfestbrief
					für 429<a href="#note-62" aria-label="Zu Fußnote 62 springen" class="note-ref"
						><sup id="ref-62">62</sup></a
					> auf diese Predigt bezieht. Thematisch könnte es sich um eine Weihnachtspredigt handeln. Dann
					wäre sie am 25. Dezember 428 oder, sofern es in Konstantinopel eine Weihnachtsoktav gegeben
					hat, in den darauffolgenden Tagen gehalten
				</p>
				<p>
					<a href=""></a>Wohl in der zweiten Hälfte desselben Jahres 428 dürfte die allgemein
					Eusebius von Dorylaeum zugeschriebene <span class="">Contestatio</span> (CV18)<a
						href="#note-63"
						aria-label="Zu Fußnote 63 springen"
						class="note-ref"><sup id="ref-63">63</sup></a
					>
					entstanden sein. Nachdem Eusebius vergeblich versucht hatte, Nestorius bei einer seiner Predigten
					zu unterbrechen und einer verkehrten Lehre zu bezichtigen<a
						href="#note-64"
						aria-label="Zu Fußnote 64 springen"
						class="note-ref"><sup id="ref-64">64</sup></a
					>
					– vergeblich, weil es ihm nur kurz gelang, für Unruhe in der Gemeinde zu sorgen, bevor Nestorius
					das Blatt wieder zu wenden wusste –, verfasste er als Reaktion die
					<em>Contestatio</em>. In dieser Schrift zeigt Eusebius gedankliche Parallelen zwischen
					Nestorius und dem als Häretiker verurteilten Paulus von Samosata auf. Ein Hinweis für die
					Datierung findet sich in den Worten des Eusebius, dass Paulus von Samosata 160 Jahre zuvor
					von den rechtgläubigen Bischöfen verurteilt worden sei.<a
						href="#note-65"
						aria-label="Zu Fußnote 65 springen"
						class="note-ref"><sup id="ref-65">65</sup></a
					>
					Da dies auf der Synode im Winter 268 geschah, ergibt sich – sofern es sich bei den 160 Jahren
					um eine exakte Angabe handelt – als frühester Zeitpunkt für die Entstehung der
					<em>Contestatio</em>
					das ausklingende Jahr 428.<a
						href="#note-66"
						aria-label="Zu Fußnote 66 springen"
						class="note-ref"><sup id="ref-66">66</sup></a
					>
					In der Forschung wird die Schrift meistens etwas später, nämlich Anfang 429 angesetzt.<a
						href="#note-67"
						aria-label="Zu Fußnote 67 springen"
						class="note-ref"><sup id="ref-67">67</sup></a
					>
					Noch später kann sie jedoch nicht entstanden sein. Bereits Loofs hat zu Recht darauf verwiesen,
					dass sich <span id="page-XXIII"></span>schon Cassian in seiner Schrift
					<em
						>De incarnatione Domini contra Nestorium<a
							href="#note-68"
							aria-label="Zu Fußnote 68 springen"
							class="note-ref"><sup id="ref-68">68</sup></a
						></em
					>, die vermutlich nicht viel später als Mitte 429 zu datieren ist, auf die
					<em>Contestatio</em>
					<a href="#note-69" aria-label="Zu Fußnote 69 springen" class="note-ref"
						><sup id="ref-69">69</sup></a
					>
				</p>
				<p>
					In die Weihnachtszeit des Jahres 428 gehört wahrscheinlich die <span class=""
						>Homilia</span
					><span class=""> 1</span> des Proklos von Kyzikos (CV19)<a
						href="#note-70"
						aria-label="Zu Fußnote 70 springen"
						class="note-ref"><sup id="ref-70">70</sup></a
					>, des späteren Bischofs von Konstantinopel (sed. 434–446). Nachdem Nestorius das
					Bischofsamt in Konstantinopel übernommen hatte, hielt Proklos anlässlich eines
					Marienfestes<a href="#note-71" aria-label="Zu Fußnote 71 springen" class="note-ref"
						><sup id="ref-71">71</sup></a
					>
					diese Predigt in der Hauptkirche von Konstantinopel, in der er die Einheit von Gott- und Menschheit
					in Christus und Maria somit als Gottesgebärerin pries. Die Datierung<a
						href="#note-72"
						aria-label="Zu Fußnote 72 springen"
						class="note-ref"><sup id="ref-72">72</sup></a
					>
					hängt nicht zuletzt an der Frage, welches Marienfest gemeint ist. Zu denken ist an die
					<em>Annuntiatio Domini</em>, welche sowohl als Herren- als auch als Marienfest gefeiert
					wird und in früherer Zeit auch den Jahresbeginn markierte. Ihr Datum ist der 25. März, der
					sich aus dem Weihnachtsdatum errechnet. In diesem Fall dürfte es sich hier um die früheste
					Erwähnung dieses Festes handeln.<a
						href="#note-73"
						aria-label="Zu Fußnote 73 springen"
						class="note-ref"><sup id="ref-73">73</sup></a
					>
					Auch die einleitenden Sätze, in denen beschrieben wird, wie Meer und Erde Maria ihre Ehre erweisen,<a
						href="#note-74"
						aria-label="Zu Fußnote 74 springen"
						class="note-ref"><sup id="ref-74">74</sup></a
					>
					könnten auf den Beginn der ‚Reisesaison‘, also auf einen Frühlingstermin hindeuten.<a
						href="#note-75"
						aria-label="Zu Fußnote 75 springen"
						class="note-ref"><sup id="ref-75">75</sup></a
					>
					Es bliebe jedoch problematisch, dass sich ansonsten <span id="page-XXIV"></span>keine
					Belege dafür finden, dass dieses Fest schon in dem hier gegebenen Zeitrahmen gefeiert
					wurde. So gesehen ist es naheliegender, von einem auch anderweitig dokumentierten Fest
					auszugehen, welches im Rahmen des Weihnachtszyklus gefeiert wurde. Der früheste denkbare
					Termin hierfür ist Weihnachten 428, der späteste 430. Leena Mari Peltomaa<a
						href="#note-76"
						aria-label="Zu Fußnote 76 springen"
						class="note-ref"><sup id="ref-76">76</sup></a
					>
					macht gegen eine Datierung in das Jahr 430, wie Nicholas Constas sie befürwortet<a
						href="#note-77"
						aria-label="Zu Fußnote 77 springen"
						class="note-ref"><sup id="ref-77">77</sup></a
					>, u.a. das Argument geltend, dass Nestorius es sicherlich nicht unterstützt hätte, dass
					Proklos zu einem Zeitpunkt, als Nestorius selbst wegen seines
					<span data-lang="greek">χριστοτόκος</span>-Titels zunehmend in Bedrängnis geraten und die
					<em>sacra</em>
					des Kaisers (CV25 [Dok. 42]), mit der er am 19. November 430 das Konzil von Ephesus einberief<a
						href="#note-78"
						aria-label="Zu Fußnote 78 springen"
						class="note-ref"><sup id="ref-78">78</sup></a
					>, bereits ergangen war, zu diesem Thema in der Hauptstadt predigte. Vor dem Hintergrund
					des immer weiter eskalierenden Streits erscheint eine Datierung auf das noch
					vergleichsweise ruhige Jahr 428 als am wahrscheinlichsten.<a
						href="#note-79"
						aria-label="Zu Fußnote 79 springen"
						class="note-ref"><sup id="ref-79">79</sup></a
					> Es ist dabei jedoch im Blick zu behalten, dass die Predigt auch später, d.h. bis einschließlich
					den 25. März 430 gehalten worden sein kann.
				</p>
				<p>
					Nestorius, der bei der Predigt des Proklos (CV19 [Dok. 3]) zugegen war, reagierte mit <span
						class="">sermo</span
					><span class=""> 27</span> (CPal22)<a
						href="#note-80"
						aria-label="Zu Fußnote 80 springen"
						class="note-ref"><sup id="ref-80">80</sup></a
					> sofort auf die Worte seines Vorredners. Unter gezielter Bezugnahme auf die Ausführungen des
					Proklos versuchte er, der Gemeinde deutlich zu machen, warum göttliche und menschliche Natur
					Christi zu unterscheiden seien.
				</p>
				<p>
					Kyrill blieb die neuartige Lehre, welche die Bezeichnung <span data-lang="greek"
						>θεοτόκος</span
					>
					für Maria anzweifelte, nicht lange verborgen. Offenbar wurde die Frage, von der man sicherlich
					durch ägyptische Mönche, die in Klöstern in Konstantinopel lebten, sowie durch alexandrinische
					Apokrisiare Kenntnis hatte, auch in Ägypten bereits diskutiert. Kyrill begann nun mit Hilfe
					seiner Anhänger unter den Mönchen und mittels diverser Schriften, in Konstantinopel gezielt
					Stimmung gegen Nestorius zu machen.<a
						href="#note-81"
						aria-label="Zu Fußnote 81 springen"
						class="note-ref"><sup id="ref-81">81</sup></a
					>
					Ohne seinen Gegner namentlich zu nennen, wandte sich der Alexandriner bereits im Frühjahr 429<a
						href="#note-82"
						aria-label="Zu Fußnote 82 springen"
						class="note-ref"><sup id="ref-82">82</sup></a
					>
					mit einer umfänglichen Rechtfertigung des <span data-lang="greek">θεοτόκος</span>-Titels
					in einem <span class="">Brief an die ägyptischen Mönche</span> (CV1)<a
						href="#note-83"
						aria-label="Zu Fußnote 83 springen"
						class="note-ref"><sup id="ref-83">83</sup></a
					>. Das Schreiben ist mit Sicherheit gleich zu Beginn der Auseinandersetzungen entstanden.
					Es war schnell in aller Munde, denn Verweise darauf finden sich in vielen der nachfolgend
					vorgestellten Dokumente. Kyrill selbst be<span id="page-XXV"></span>zieht sich bereits in
					seinem Brief an die Apokrisiare in Konstantinopel (CV22 [Dok.&nbsp;8])
					<a href="#note-84" aria-label="Zu Fußnote 84 springen" class="note-ref"
						><sup id="ref-84">84</sup></a
					>
				</p>
				<p>
					Nestorius reagierte mit <span class="">sermo</span><span class=""> 10</span> (CPal21)<a
						href="#note-85"
						aria-label="Zu Fußnote 85 springen"
						class="note-ref"><sup id="ref-85">85</sup></a
					>
					auf die Angriffe, die Kyrill im Brief an die Mönche (CV1 [Dok. 5]) gegen ihn formuliert hatte,
					und widerlegte die Ausführungen seines Gegners, ebenfalls ohne diesen beim Namen zu nennen.
					Die Predigt ist vor Kyrills Brief an die Apokrisiare (CV22 [Dok. 8]) entstanden, da sie dort
					Erwähnung findet. Es heißt darin nämlich, dass dem Diakon Buphas Martyrios zwei Schriftstücke
					zugegangen seien, eines davon ein Quaternio mit einer Predigt (<em>sermo</em>
					10), die einen merkwürdigen Titel getragen habe.<a
						href="#note-86"
						aria-label="Zu Fußnote 86 springen"
						class="note-ref"><sup id="ref-86">86</sup></a
					>
					Damit ist für den <em>sermo</em> ebenfalls das Frühjahr 429
				</p>
				<p>
					Gleichfalls in dieses Frühjahr gehört wohl auch der <span class=""
						>erste Brief des Nestorius an Coelestin
					</span>(CVer3)<a href="#note-87" aria-label="Zu Fußnote 87 springen" class="note-ref"
						><sup id="ref-87">87</sup></a
					>. Offenbar weil er die Gefahr spürte, die von Kyrill für ihn ausging, und jedenfalls
					bevor der Alexandriner den Kontakt nach Rom suchte<a
						href="#note-88"
						aria-label="Zu Fußnote 88 springen"
						class="note-ref"><sup id="ref-88">88</sup></a
					>, wandte sich Nestorius an den Papst, um ihn auf seine Seite zu ziehen. Unter dem
					Vorwand, er wisse nicht, wie mit den in Konstantinopel anwesenden Pelagianern umzugehen
					sei,<a href="#note-89" aria-label="Zu Fußnote 89 springen" class="note-ref"
						><sup id="ref-89">89</sup></a
					>
					die ihn ihrer Rehabilitierung wegen bedrängten, unterbreitete er dem Papst seine Lehre von
					den zwei Naturen Christi. Ohne Kyrill namentlich zu nennen, wandte er sich in seinen Ausführungen
					doch klar gegen den <span data-lang="greek">θεοτόκος</span>-Titel des Alexandriners. Der
					Brief muss in diese früheste Phase der Geschehnisse eingeordnet werden<a
						href="#note-90"
						aria-label="Zu Fußnote 90 springen"
						class="note-ref"><sup id="ref-90">90</sup></a
					>, da Nestorius in seinem zweiten Schreiben an Coelestin (CVer4) versichert, er habe lange
					<span id="page-XXVI"></span>und bis dahin vergeblich auf eine Antwort des Papstes auf
					diesen ersten Brief gewartet.<a
						href="#note-91"
						aria-label="Zu Fußnote 91 springen"
						class="note-ref"><sup id="ref-91">91</sup></a
					>
					Und auch der zweite Brief blieb nach Coelestins eigener Aussage längere Zeit unbeantwortet
					liegen.<a href="#note-92" aria-label="Zu Fußnote 92 springen" class="note-ref"
						><sup id="ref-92">92</sup></a
					>
					In seinem ersten Brief an Nestorius (CV2 [Dok. 18]), der vermutlich spätestens Ende 429 verfasst
					wurde, weiß Kyrill bereits von diversen Schriften (<span data-lang="greek">χαρτία</span>),
					die aus der Feder des Nestorius stammten und auf leider nicht in jedem Fall
					nachvollziehbare Weise nach Rom gelangt waren.<a
						href="#note-93"
						aria-label="Zu Fußnote 93 springen"
						class="note-ref"><sup id="ref-93">93</sup></a
					>
					Spätestens zu diesem Zeitpunkt müssen Coelestin, wie sich zum Beispiel auch aus einem Vergleich
					mit <em>De incarnatione Domini contra Nestorium</em> des Johannes Cassian ergibt, CVer3
					und weitere Schreiben vorgelegen
					<a href="#note-94" aria-label="Zu Fußnote 94 springen" class="note-ref"
						><sup id="ref-94">94</sup></a
					>
				</p>
				<p>
					Durch einen nicht überlieferten Bericht seiner Apokrisiare in Konstantinopel erfuhr Kyrill
					429 von den dortigen Umtrieben, die sich gegen ihn richteten und ihren Ausdruck offenbar
					auch in handfesten Schmähungen fanden. Seine Reaktion ließ nicht lange auf sich warten. Er
					verfasste ein <span class="">Antwortschreiben an die Apokrisiare</span> (CV22)<a
						href="#note-95"
						aria-label="Zu Fußnote 95 springen"
						class="note-ref"><sup id="ref-95">95</sup></a
					>, in dem er Stellung bezog und mahnte, beim rechten Glauben zu bleiben. Gleich zu Beginn
					seines Briefes zitiert Kyrill eine Äußerung des Presbyters Anastasios<a
						href="#note-96"
						aria-label="Zu Fußnote 96 springen"
						class="note-ref"><sup id="ref-96">96</sup></a
					>, von der ihm die Apokrisiare berichtet hatten: „Wie er den Mönchen geschrieben hat, so
					denken wir.“<a href="#note-97" aria-label="Zu Fußnote 97 springen" class="note-ref"
						><sup id="ref-97">97</sup></a
					>
					Etwas später wird der Brief an die Mönche (CV1 [Dok. 5]) noch ein zweites Mal erwähnt. Wie
					im Zusammenhang mit <em>sermo</em> 10 des Nestorius (CPal21 [Dok. 6]) bereits angesprochen<a
						href="#note-98"
						aria-label="Zu Fußnote 98 springen"
						class="note-ref"><sup id="ref-98">98</sup></a
					>, heißt es nämlich im Folgenden, dass dem Diakon Buphas Martyrios zwei Schreiben
					zugegangen seien. Eines davon stamme möglicherweise von Photios und richte sich gegen den
					Brief an die Mönche.<a
						href="#note-99"
						aria-label="Zu Fußnote 99 springen"
						class="note-ref"><sup id="ref-99">99</sup></a
					> CV1 (Dok. 5) war somit zum Zeitpunkt des Entstehens des Schreibens an die Apokrisiare bereits
					Gegenstand heftiger
				</p>
				<p>
					<span id="page-XXVII"></span>Auf die Anfeindungen gegen ihn geht Kyrill auch in einem
					<span class="">Brief an einen Eiferer des Nestorius</span>
					(CV20)<a href="#note-100" aria-label="Zu Fußnote 100 springen" class="note-ref"
						><sup id="ref-100">100</sup></a
					> ein. Kyrill verteidigt hier sein rigoroses Vorgehen gegen den Irrglauben, der von Konstantinopel
					aus um sich zu greifen beginne. Dabei seien keineswegs die gegen ihn selbst gerichteten Schmähungen
					die Triebfeder. Vielmehr gehe es ausschließlich um die Bewahrung des rechten Glaubens. Einziger
					Anhaltspunkt für die Datierung dieses Dokumentes sind die erwähnten gegen Kyrill gerichteten
					Umtriebe in Konstantinopel, von denen er auch schon in seinem Brief an die Apokrisiare (CV22
					[Dok. 8]) gesprochen hatte.
				</p>
				<p>
					Auch in einem weiteren <span class="">Schreiben an seine Ankläger</span> (CV21)<a
						href="#note-101"
						aria-label="Zu Fußnote 101 springen"
						class="note-ref"><sup id="ref-101">101</sup></a
					>
					verteidigt Kyrill sein entschiedenes Handeln gegen Nestorius. Ausgangspunkt für seine Ausführungen
					ist der Anstoß, den Nestorius dem Vernehmen nach an dem Brief an die Mönche (CV1 [Dok. 5])
					nahm.<a href="#note-102" aria-label="Zu Fußnote 102 springen" class="note-ref"
						><sup id="ref-102">102</sup></a
					>
					Neu ist hier die Erwähnung eines Zwischenfalls, der sich offenbar erst in jüngerer Zeit ereignet
					hatte, nämlich die öffentliche Äußerung des Dorotheos von Markianopolis, jeder, der Maria eine
					Gottesgebärerin nenne, solle verdammt sein, ein Ausspruch, der von Nestorius ausdrücklich gebilligt
					worden sei.<a href="#note-103" aria-label="Zu Fußnote 103 springen" class="note-ref"
						><sup id="ref-103">103</sup></a
					>
					Über die Äußerung des Dorotheos klagt Kyrill auch in seinem
					<span class="">Brief an Akakios von Beroia</span>
					(CV16)<a href="#note-104" aria-label="Zu Fußnote 104 springen" class="note-ref"
						><sup id="ref-104">104</sup></a
					>. <span id="page-XXVIII"></span>Wieder einmal setzt er sich in seinen Ausführungen für
					die Betitelung Marias als <span data-lang="greek">θεοτόκος</span> ein, wobei auch sein
					Brief an die Mönche (CV1 [Dok. 5]) und die Umtriebe gegen ihn in Konstantinopel nicht
					unerwähnt
					<a href="#note-105" aria-label="Zu Fußnote 105 springen" class="note-ref"
						><sup id="ref-105">105</sup></a
					>
				</p>
				<p>
					Die <span class="">Antwort aus Beroia</span> (CV17)<a
						href="#note-106"
						aria-label="Zu Fußnote 106 springen"
						class="note-ref"><sup id="ref-106">106</sup></a
					>
					fiel nicht ganz im Sinne Kyrills aus. Akakios äußert sich ablehnend in Bezug auf den
					<span data-lang="greek">θεοτόκος</span>-Titel, zeigt sich aber kompromissbereit. Er rät,
					die Sache mit Bedacht anzugehen, um eine Kirchenspaltung zu vermeiden, und erwähnt zudem,
					dass Kyrills Schreiben auch zur Kenntnis des Johannes von Antiochia gelangt sei, der
					ebenfalls ein besonnenes Vorgehen in dem Streit anmahne.
				</p>
				<p>
					<a href=""></a>Spätestens in das Jahr 429 gehören auch die
					<span class="">sermones</span><span class=""> 20, 28, 29 und 30 des Nestorius</span>
					(CPal31–34)<a href="#note-107" aria-label="Zu Fußnote 107 springen" class="note-ref"
						><sup id="ref-107">107</sup></a
					>. Bei den Predigtauszügen handelt es sich um gegen den Pelagianismus gerichtete
					Äußerungen des Nestorius. In seiner Einleitung zu diesen Predigten (CPal30)<a
						href="#note-108"
						aria-label="Zu Fußnote 108 springen"
						class="note-ref"><sup id="ref-108">108</sup></a
					>
					sagt Marius Mercator, dass Nestorius CPal31 (Dok. 13) als erste von mehreren Predigten zu diesem
					Thema gehalten habe, nachdem er Julian von Eclanum während dessen Aufenthalt in Konstantinopel
					habe predigen hören.<a
						href="#note-109"
						aria-label="Zu Fußnote 109 springen"
						class="note-ref"><sup id="ref-109">109</sup></a
					>
					Die Texte bieten nur wenige konkrete Anhaltspunkte für eine Datierung, gehören aber sicherlich
					in die erste Zeit des Nestorius als Bischof von Konstantinopel, als er sich als vehementer
					Verfolger aller Häresien zu profilieren suchte.<a
						href="#note-110"
						aria-label="Zu Fußnote 110 springen"
						class="note-ref"><sup id="ref-110">110</sup></a
					>
					In <em>sermo</em> 20 (CPal31) finden sich zwei Hinweise für eine Datierung. So heißt es
					zum einen: „[…] nehme ich jene Wonne, die mir durch euch zuteil wird, entgegen, mit der
					ich sehe, dass euch, die ihr euch in Bezug auf die göttlichen Dinge anstrengt, eine solche
					Freude erfasst, die nicht im Kreislauf so vieler Festlichkeiten abstumpft, deren aller
					Ursprung die Ankunft der Güte des Herrn ist“<a
						href="#note-111"
						aria-label="Zu Fußnote 111 springen"
						class="note-ref"><sup id="ref-111">111</sup></a
					>, und zum anderen: „Aber da ja die Zeit der Taufe naht [...]“<a
						href="#note-112"
						aria-label="Zu Fußnote 112 springen"
						class="note-ref"><sup id="ref-112">112</sup></a
					>. Schwartz<a href="#note-113" aria-label="Zu Fußnote 113 springen" class="note-ref"
						><sup id="ref-113">113</sup></a
					>
					hält es aufgrund dieser Anspielungen für wahrscheinlich, dass die Predigt entweder Weihnachten
					428 oder Epiphanias 429 gehalten wurde. Über diese zeitliche Eingrenzung hinaus orientiert
					sich die chronologische Einordnung der vier Predigten an dieser Stelle des vorliegenden ersten
					Bandes daran, dass Marius Mercator sie seinem
					<em>Commo<span id="page-XXIX"></span>nitorium</em>
					gegen Caelestius<a href="#note-114" aria-label="Zu Fußnote 114 springen" class="note-ref"
						><sup id="ref-114">114</sup></a
					>
					voranstellt und sie zusammen mit diesem eine sinnvolle Einheit bilden.<a href=""></a>
				</p>
				<p>
					Für die Datierung des <span class="">Commonitorium</span><span class="">
						bezüglich Caelestius</span
					>
					(CPal36)<a href="#note-115" aria-label="Zu Fußnote 115 springen" class="note-ref"
						><sup id="ref-115">115</sup></a
					>
					liefert Marius Mercator selbst einen Hinweis. Mit den Worten „unter den
					<em>viri clarissimi</em>, den Konsuln Florentius und Dionysius“ in der Vorbemerkung des
					<em>Commonitoriums</em> grenzt er dessen Entstehungszeitraum auf das Jahr 429, das Amtsjahr
					der beiden Konsuln, ein.
				</p>
				<p>
					Gegen Ende des Jahres 429 kam es erstmals zu einem direkten Kontakt zwischen Kyrill und
					Nestorius. Kyrill wandte sich in einem <span class="">ersten Brief</span> (CV2)<a
						href="#note-116"
						aria-label="Zu Fußnote 116 springen"
						class="note-ref"><sup id="ref-116">116</sup></a
					>
					mit der Aufforderung an seinen Gegner, Maria als Gottesgebärerin anzuerkennen. Auslöser für
					sein Schreiben war ein nicht überlieferter Brief Coelestins, aus dem hervorging, dass einige
					nach Rom gelangte Schriften des Nestorius auf Unmut gestoßen waren.<a
						href="#note-117"
						aria-label="Zu Fußnote 117 springen"
						class="note-ref"><sup id="ref-117">117</sup></a
					>
					Die Frage, wie die Schriften Rom erreicht hatten, lässt Kyrill an dieser Stelle Doch ist aus
					anderen Quellen ersichtlich, dass Nestorius selbst den Kontakt nach Rom gesucht hatte.<a
						href="#note-118"
						aria-label="Zu Fußnote 118 springen"
						class="note-ref"><sup id="ref-118">118</sup></a
					>
					So äußert Coelestin in seinem Schreiben vom 10. August 430 (CVer2), in dem er Nestorius von
					dessen Verurteilung durch die römische Synode unterrichtete: „Wir haben also den Wortlaut der
					Briefe und die Bücher gelesen, die wir erhalten haben, wobei der
					<em>vir illustris</em>, mein Sohn Antiochus, als Bote fungierte.“<a
						href="#note-119"
						aria-label="Zu Fußnote 119 springen"
						class="note-ref"><sup id="ref-119">119</sup></a
					>
					Jedenfalls scheint <span id="page-XXX"></span>der Umstand, dass Nestorius versucht hatte,
					den Papst auf seine Seite zu ziehen, ausgereicht zu haben, Kyrill aus der Reserve zu
					locken und seinen Gegner nun unmittelbar anzugehen sowie bald darauf auch selbst den
					Kontakt zum Papst zu suchen (s. CV144 [Dok. 27])<a
						href="#note-120"
						aria-label="Zu Fußnote 120 springen"
						class="note-ref"><sup id="ref-120">120</sup></a
					>. Die <span class="">Antwort des Nestorius</span> (CV3, Ende 429 / Anfang 430)<a
						href="#note-121"
						aria-label="Zu Fußnote 121 springen"
						class="note-ref"><sup id="ref-121">121</sup></a
					>
					auf die Äußerungen und Forderungen Kyrills fiel sehr knapp aus. Er drückte lediglich – seinen
					eigenen Worten nach auf Zureden des Presbyters Lampon<a
						href="#note-122"
						aria-label="Zu Fußnote 122 springen"
						class="note-ref"><sup id="ref-122">122</sup></a
					> hin – dem alexandrinischen Bischof seine Missbilligung aus, ohne inhaltlich auf dessen Auslassungen
					einzugehen.
				</p>
				<p>
					In die Zeit der Unruhen in Konstantinopel Ende 429 und Anfang 430 gehört inhaltlich wohl
					auch der <span class="">Libellus ad Imperatores</span> des Basilius von Konstantinopel
					(CV143)<a href="#note-123" aria-label="Zu Fußnote 123 springen" class="note-ref"
						><sup id="ref-123">123</sup></a
					>.
				</p>
				<p>
					Der Diakon und Archimandrit Basilius, der Lektor und Mönch Thalassios sowie weitere Mönche
					berichteten dem Kaiser anschaulich von den Unruhen, die sich aus dem Umstand, dass
					Nestorius den <span data-lang="greek">θεοτόκος</span>-Titel zurückweise, ergeben hätten.
					Auf die Ablehnung des Volkes und vieler Geistlicher dieser Haltung gegenüber reagiere
					Nestorius mit Gewalt. Deshalb wende man sich nun an den Kaiser mit der dringenden Bitte,
					diesen Zuständen endlich ein Ende zu machen. Wortwahl und Tonfall erlauben den Schluss,
					dass der Kaiser bis zu diesem Zeitpunkt geschwiegen hatte, weil er auf der Seite des
					Nestorius stand.<a href="#note-124" aria-label="Zu Fußnote 124 springen" class="note-ref"
						><sup id="ref-124">124</sup></a
					>
				</p>
				<p>
					<span id="page-XXXI"></span>Das Schreiben enthält zwei mögliche Hinweise für eine
					Datierung. Zum einen fordern die Absender zweimal eine ökumenische Synode<a
						href="#note-125"
						aria-label="Zu Fußnote 125 springen"
						class="note-ref"><sup id="ref-125">125</sup></a
					>, um dem wahren Glauben zu seinem Recht zu verhelfen, was an die Einberufung des Konzils
					von Ephesus denken lässt, welches die Wahrheitsfindung in eben dieser Frage zum Ziel
					hatte, und so eine Datierung des Dokuments vor dessen Einberufung am 19. November 430
					nahelegt.<a href="#note-126" aria-label="Zu Fußnote 126 springen" class="note-ref"
						><sup id="ref-126">126</sup></a
					>
					Doch zeigen Richard Price und Thomas Graumann<a
						href="#note-127"
						aria-label="Zu Fußnote 127 springen"
						class="note-ref"><sup id="ref-127">127</sup></a
					>
					besonders mit sprachlichen Argumenten, dass ein Bezug auf dieses Ereignis keineswegs zwingend
					ist. Ihrer Ansicht nach könnte die Bittschrift an den Kaiser zu jedem beliebigen Zeitpunkt
					des Streits entstanden sein.<a
						href="#note-128"
						aria-label="Zu Fußnote 128 springen"
						class="note-ref"><sup id="ref-128">128</sup></a
					>
				</p>
				<p>
					Der zweite Hinweis für eine Datierung betrifft die Äußerung, Nestorius habe auch
					auswärtige Kleriker in seine Machenschaften einbezogen, deren Einmischung kirchenrechtlich
					gar nicht gestattet sei.<a
						href="#note-129"
						aria-label="Zu Fußnote 129 springen"
						class="note-ref"><sup id="ref-129">129</sup></a
					>
					Schwartz<a href="#note-130" aria-label="Zu Fußnote 130 springen" class="note-ref"
						><sup id="ref-130">130</sup></a
					>
					hält es für wahrscheinlich, dass es sich hier um eine Anspielung auf den Fall handelt, bei
					dem Nestorius den Pelagianer Caelestius, der sich zu der Zeit in Konstantinopel aufhielt, dazu
					aufgestachelt hatte, den Presbyter Philippus<a
						href="#note-131"
						aria-label="Zu Fußnote 131 springen"
						class="note-ref"><sup id="ref-131">131</sup></a
					>
					– wie Basilius ein Verfechter des <span data-lang="greek">θεοτόκος</span>-Titels – mit
					Hilfe wohl fingierter Schriftstücke anzuklagen. Die Angelegenheit erhitzte die Gemüter
					offenbar eine Zeit lang sehr, da in noch drei weiteren Schreiben andeutungsweise davon die
					Rede ist, nämlich in dem Brief des Nestorius an Caelestius (CPal35)<a
						href="#note-132"
						aria-label="Zu Fußnote 132 springen"
						class="note-ref"><sup id="ref-132">132</sup></a
					>, im zweiten <span id="page-XXXII"></span>Brief des Nestorius an Kyrill (CV5)<a
						href="#note-133"
						aria-label="Zu Fußnote 133 springen"
						class="note-ref"><sup id="ref-133">133</sup></a
					>
					und am ausführlichsten in dem Memorandum (CU4)<a
						href="#note-134"
						aria-label="Zu Fußnote 134 springen"
						class="note-ref"><sup id="ref-134">134</sup></a
					>, das Kyrill seinem Diakon Poseidonios zusammen mit einem für Papst Coelestin bestimmten
					Dossier<a href="#note-135" aria-label="Zu Fußnote 135 springen" class="note-ref"
						><sup id="ref-135">135</sup></a
					>
					auf die Reise nach Rom mit auf den Weg gab. Da Coelestin nach der Übergabe dieser Unterlagen
					im August 430 eine römische Synode einberief, muss also die Philippus betreffende Synode vor
					dieser römischen stattgefunden haben. Doch ist die Anspielung in der Bittschrift an den Kaiser
					zu vage – es könnte auch ein ganz anderes Ereignis gemeint sein –, um als sicheres Indiz für
					die Chronologie gelten zu können. Sollte aber die Vermutung von Schwartz zutreffen, dass hier
					der Fall ‚Philippus‘ angedeutet ist, würde dies immerhin die Entscheidung unterstützen, das
					Dokument aufgrund seines Inhalts in das zeitliche Umfeld vor der Kontaktaufnahme Kyrills mit
					Rom aufzunehmen, zumal sie später wohl kaum noch jemand verstanden haben
					<a href="#note-136" aria-label="Zu Fußnote 136 springen" class="note-ref"
						><sup id="ref-136">136</sup></a
					>
				</p>
				<p>
					<a href=""></a>In dieselbe Zeit gehört wohl auch der
					<span class="">Brief des Nestorius an Caelestius</span>
					(CPal35)<a href="#note-137" aria-label="Zu Fußnote 137 springen" class="note-ref"
						><sup id="ref-137">137</sup></a
					>. Nestorius reagiert hierin auf einen Klagebrief des Caelestius, in dem dieser sich über
					ihm widerfahrenes Unrecht beschwert hatte. Ob es sich dabei um Vergeltungsmaßnahmen
					handelte, die Caelestius als Pelagianer erleiden musste, oder ob die Beschwer<span
						id="page-XXXIII"
					></span>de in Verbindung mit einem anderen Ereignis zu sehen ist, bleibt unklar. Nestorius
					versucht Caelestius aufzurichten, indem er ihm biblische Vorbilder vor Augen führt, die
					für die Wahrheit des Glaubens bereitwillig den Tod in Kauf genommen hatten. Schließlich
					verweist er auch auf Briefe, die im Zusammenhang mit einem Konzil an zahlreiche Bischöfe
					verschickt wurden und in denen er sich offenbar zugunsten des Caelestius ausgesprochen
					hatte. Welches Konzil hier gemeint ist und was genau dort verhandelt wurde, lässt sich
					nicht abschließend klären. Garnier<a
						href="#note-138"
						aria-label="Zu Fußnote 138 springen"
						class="note-ref"><sup id="ref-138">138</sup></a
					>
					spricht sich dafür aus, dass es sich um die römische Synode vom August 430 und die wenig später
					abgehaltene alexandrinische Synode handele. Doch wurde hier jeweils die Causa Nestorius, nicht
					die der Pelagianer verhandelt. Schwartz<a
						href="#note-139"
						aria-label="Zu Fußnote 139 springen"
						class="note-ref"><sup id="ref-139">139</sup></a
					>
					hält die Synode für diejenige, auf die auch in CV143 (Dok. 20) angespielt wurde, und bei welcher
					der Presbyter Philippus als Manichäer verurteilt wurde.<a
						href="#note-140"
						aria-label="Zu Fußnote 140 springen"
						class="note-ref"><sup id="ref-140">140</sup></a
					>
					Möglicherweise war Caelestius wegen seiner unwürdigen Rolle in dem Schauspiel Repressalien
					ausgesetzt, derentwegen er sich bei Nestorius beschwert hatte. Wenn Schwartz mit seiner Vermutung
					richtigliegt und es sich um die besagte Philippus-Synode handelt, spricht dies für eine Datierung
					auch dieses Nestorius-Briefes in die Zeit der eskalierenden Auseinandersetzungen in Konstantinopel
					vor der Einberufung der römischen Synode im August 430.<a href=""></a>
				</p>
				<p>
					Dass Nestorius mehrere Briefe nach Rom geschickt hatte, ist aus seinem <span class=""
						>zweiten überlieferten Schreiben an den Papst</span
					>
					(CVer4)<a href="#note-141" aria-label="Zu Fußnote 141 springen" class="note-ref"
						><sup id="ref-141">141</sup></a
					>
					ersichtlich, welches er durch den <em>cubicularius</em> Valerius überbringen ließ<a
						href="#note-142"
						aria-label="Zu Fußnote 142 springen"
						class="note-ref"><sup id="ref-142">142</sup></a
					>. Wann genau dieser Brief entstanden ist, lässt sich nicht ermitteln. Coelestin äußert
					sich in seinem Schreiben vom 10. August 430, in dem er Nestorius von dessen Absetzung
					unterrichtet, zu den Briefen. Seinen eigenen Worten zufolge lagen ihm diese bereits einige
					Zeit vor der Ankunft des Poseidonios Mitte 430 vor. Zuerst habe es an einem Übersetzer aus
					dem Griechischen gefehlt, und gerade als der gefunden worden war, sei Poseidonios mit dem
					kyrillischen Dossier nach Rom gekommen.<a
						href="#note-143"
						aria-label="Zu Fußnote 143 springen"
						class="note-ref"><sup id="ref-143">143</sup></a
					>
					So erscheint das Frühjahr 430 als Zeitpunkt für die Abfassung des Briefes sehr
					<a href="#note-144" aria-label="Zu Fußnote 144 springen" class="note-ref"
						><sup id="ref-144">144</sup></a
					>
				</p>
				<p>
					Den Akten des Konzils von Chalkedon zufolge ist der <span class=""
						>zweite Brief Kyrills an Nestorius</span
					>
					(CV4)<a href="#note-145" aria-label="Zu Fußnote 145 springen" class="note-ref"
						><sup id="ref-145">145</sup></a
					>
					zwischen dem 26. Januar und 24. Februar 430 entstanden.<a
						href="#note-146"
						aria-label="Zu Fußnote 146 springen"
						class="note-ref"><sup id="ref-146">146</sup></a
					>
					Kyrill leitet ihn mit den Worten ein, ihm sei zu Ohren gekommen, dass er in Konstantinopel
					in Gegenwart des Patriarchen verleumdet werde. Nach einigen Spitzen bezüglich die<span
						id="page-XXXIV"
					></span>ser Machenschaften gibt sich Kyrill wieder ganz als der Verfechter des wahren
					Glaubens, der seinen Amtsbruder auf den rechten Weg zurückführen wolle. Auf der Basis des
					Nizänums setzt er Nestorius ausführlich die Richtigkeit des
					<span data-lang="greek">θεοτόκος</span>-Titels für Maria auseinander und beschließt seinen
					Brief mit der dringenden Bitte, Nestorius möge diesen Glauben auch mit Blick auf den
					Kirchenfrieden mit ihm teilen.
				</p>
				<p>
					Der Brief selbst bietet nur wenige Anhaltspunkte für eine zeitliche Einordnung. Der
					einleitende Hinweis auf die Verleumdungen gegen Kyrill weist auf die Phase, in der die
					Streitigkeiten in Konstantinopel zu eskalieren begannen, als Leute wie etwa Dorotheos von
					Markianopolis<a href="#note-147" aria-label="Zu Fußnote 147 springen" class="note-ref"
						><sup id="ref-147">147</sup></a
					>
					öffentlich das Wort ergriffen. Als <em>Terminus ante quem</em> ist der Zeitpunkt
					anzusehen, als sich Kyrill an Coelestin wandte, da sowohl er selbst in seinem Schreiben an
					den Papst (CV144)<a href="#note-148" aria-label="Zu Fußnote 148 springen" class="note-ref"
						><sup id="ref-148">148</sup></a
					>
					als auch Coelestin in seinem Schreiben an Nestorius (CVer2)<a
						href="#note-149"
						aria-label="Zu Fußnote 149 springen"
						class="note-ref"><sup id="ref-149">149</sup></a
					> den zweiten Brief an Nestorius erwähnen. Beide Hinweise passen zu der Datierung in den Akten
					von Chalkedon.
				</p>
				<p>
					Nestorius gibt sich in seinem <span class="">Antwortschreiben</span> (CV5)<a
						href="#note-150"
						aria-label="Zu Fußnote 150 springen"
						class="note-ref"><sup id="ref-150">150</sup></a
					>
					vom Juni 430<a href="#note-151" aria-label="Zu Fußnote 151 springen" class="note-ref"
						><sup id="ref-151">151</sup></a
					>
					unberührt von den Schmähungen, mit denen Kyrill seinen Brief eingeleitet hatte. Sehr bald wendet
					er sich der inhaltlichen Auseinandersetzung zu und entwickelt, an Äußerungen Kyrills in dessen
					Schreiben anknüpfend, sein eigenes Verständnis in der
					<span data-lang="greek">θεοτόκος</span>-Frage. Dabei lässt er es an gezielten Seitenhieben
					auf den Gegner nicht fehlen, darunter auch der recht deutliche Hinweis darauf, dass er
					sich mit dem Kaiserhaus im Einvernehmen wisse.<a
						href="#note-152"
						aria-label="Zu Fußnote 152 springen"
						class="note-ref"><sup id="ref-152">152</sup></a
					>
				</p>
				<p>
					Spätestens bis Mitte 430 vollendete Kyrill seine <span class=""
						>fünf Bücher gegen Nestorius</span
					>
					(CV166)<a href="#note-153" aria-label="Zu Fußnote 153 springen" class="note-ref"
						><sup id="ref-153">153</sup></a
					>. Die Arbeit an diesem umfangreichen Werk, in dem der Alexandriner einzelne Äußerungen
					des Nestorius zur Christologie widerlegt, muss im Frühsommer vollendet gewesen sein, da er
					es etwa zu dieser Zeit durch seinen Diakon Poseidonios als Teil eines Dossiers<a
						href="#note-154"
						aria-label="Zu Fußnote 154 springen"
						class="note-ref"><sup id="ref-154">154</sup></a
					> an Papst Coelestin nach Rom sandte.
				</p>
				<p>
					<span id="page-XXXV"></span>Unmittelbar vor der Schrift <em>Contra Nestorium</em> findet
					sich in den Konzilsakten auch eine <span class="">Sammlung von Auszügen</span> (CV165)<a
						href="#note-155"
						aria-label="Zu Fußnote 155 springen"
						class="note-ref"><sup id="ref-155">155</sup></a
					>
					aus ebendiesem Werk, bei denen es sich ausschließlich um Nestorius-Zitate handelt. Wann genau
					und zu welchem Zweck diese Sammlung entstanden ist, lässt sich nicht entscheiden. Sie könnte
					als Vorlage für <em>Contra Nestorium</em> zusammengestellt worden sein. Möglich ist aber
					auch, dass sie zu einem späteren Zeitpunkt in irgendeiner Form der Verurteilung des
					Nestorius dienen sollte. Die Zitate werden im vorliegenden Band nicht eigens übersetzt, da
					sie im Wesentlichen mit dem Text in <em>Contra Nestorium</em> übereinstimmen. Abweichungen
					sind jedoch in CV166 (Dok. 25) kenntlich gemacht.
				</p>
				<p>
					<a href=""></a>Auch die zeitliche Einordnung der bei Marius Mercator überlieferten
					Sammlung von <span class="">Auszügen aus den Predigten des Nestorius</span> (CPal29)<a
						href="#note-156"
						aria-label="Zu Fußnote 156 springen"
						class="note-ref"><sup id="ref-156">156</sup></a
					>
					ist unsicher. Gemäß Marius’ einleitenden Worten handelt es sich um die Übersetzung einer Sammlung
					von Nestorius-Zitaten Kyrills. Schwartz<a
						href="#note-157"
						aria-label="Zu Fußnote 157 springen"
						class="note-ref"><sup id="ref-157">157</sup></a
					>
					u.a. halten sie in der vorliegenden Form für die, welche Kyrill im Jahr 430 über Poseidonios
					an Papst Coelestin gesandt hatte. Grillmeier<a
						href="#note-158"
						aria-label="Zu Fußnote 158 springen"
						class="note-ref"><sup id="ref-158">158</sup></a
					>
					ist sogar der Meinung, dass Mercator der Übersetzer der von Kyrill lateinisch verschickten
					Sammlung ist.<a href="#note-159" aria-label="Zu Fußnote 159 springen" class="note-ref"
						><sup id="ref-159">159</sup></a
					>
					Diese Identifikationen legen eine Datierung von CPal29 vor dem Versenden des Dokuments nach
					Rom, also vor Mitte 430, nahe. In jüngerer Zeit nun hat Graumann<a
						href="#note-160"
						aria-label="Zu Fußnote 160 springen"
						class="note-ref"><sup id="ref-160">160</sup></a
					>
					dargelegt, dass die Mercator-Übersetzung da, wo es überhaupt Übereinstimmungen bei der Zitatenauswahl
					gibt, sprachlich signifikant von den späteren Versionen des Johannes Cassian in seiner Schrift
					De incarnatione Domini con<em>tra Nestorium</em> und des Arnobius Iunior in seinem
					<em>Conflictus</em>
					abweicht, während deren Fassungen auf eine gemeinsame Quelle zurückgehen, nämlich das Dossier
					Kyrills.<a href="#note-161" aria-label="Zu Fußnote 161 springen" class="note-ref"
						><sup id="ref-161">161</sup></a
					>
					Wenn es sich bei CPal29 also nicht um eine Übersetzung des Dokuments handelt, das Kyrill an
					Coelestin geschickt hat, erweitert sich auch der Datierungszeitraum für die Zusammenstellung
					der Exzerpte durch Kyrill. In welchem Abhängigkeitsverhältnis CPal29 zu den anderen Dokumenten
					mit Nestorius-Exzerpten<a
						href="#note-162"
						aria-label="Zu Fußnote 162 springen"
						class="note-ref"><sup id="ref-162">162</sup></a
					>
					steht, ist unklar. Es gibt Überschneidungen, aber auch gravierende Unterschiede. Möglicherweise
					handelt es sich um eine Vorstufe entweder der an Coelestin geschickten oder der in Ephesus
					verlesenen Exzerptsammlung, die dann zwischen Ende 429 und der ersten Sitzung am 22. Juni 431
					anzusiedeln wäre. Im vorliegenden Band wurde das Dokument hinter CV166 (Dok. 25) platziert,
					um einen unmittelbaren Vergleich der Nestorius-Exzerpte zu ermöglichen.<a href=""></a>
				</p>
				<p>
					Nachdem Kyrill erfahren hatte, dass Nestorius versuchte, Rom auf seine Seite zu ziehen,
					wurde auch er in diese Richtung hin tätig. Sein erstes erhaltenes <span class=""
						>Schreiben<a href="#note-163" aria-label="Zu Fußnote 163 springen" class="note-ref"
							><sup id="ref-163">163</sup></a
						>
						an <span id="page-XXXVI"></span>Coelestin</span
					>
					(CV144)<a href="#note-164" aria-label="Zu Fußnote 164 springen" class="note-ref"
						><sup id="ref-164">164</sup></a
					>
					muss etwa in die Mitte des Jahres 430 datiert werden<a
						href="#note-165"
						aria-label="Zu Fußnote 165 springen"
						class="note-ref"><sup id="ref-165">165</sup></a
					>, da es dem Boten Kyrills, Poseidonios, so vollends gelang, Coelestin zu überzeugen, dass
					dieser bereits im August eine römische Synode abhielt, von der Nestorius verurteilt wurde.
					Kyrill beschreibt in seinem Brief das Denken und Handeln des Nestorius in den dunkelsten
					Farben<a href="#note-166" aria-label="Zu Fußnote 166 springen" class="note-ref"
						><sup id="ref-166">166</sup></a
					>, um Coelestin ein schnelles Eingreifen als unabdingbar zu suggerieren. Von sich selbst
					zeichnet er das Bild eines verantwortungsbewusst Reagierenden, der sich von den gegen ihn
					selbst gerichteten Machenschaften des Nestorius und seiner Anhänger nicht habe beirren
					lassen und der nichts unversucht gelassen habe, Nestorius zur Umkehr zu bewegen. Doch es
					sei alles vergeblich gewesen. Abschließend verweist Kyrill noch auf das aus verschiedenen
					Dokumenten bestehende Dossier<a
						href="#note-167"
						aria-label="Zu Fußnote 167 springen"
						class="note-ref"><sup id="ref-167">167</sup></a
					>, das er Poseidonios mitgegeben habe, damit sich der Papst ein besseres Bild von der Lage
					machen
					<a href="#note-168" aria-label="Zu Fußnote 168 springen" class="note-ref"
						><sup id="ref-168">168</sup></a
					>
				</p>
				<p>
					Um Poseidonios auf seine Aufgabe vorzubereiten, den Papst von der Unhaltbarkeit des
					Nestorius als Bischof von Konstantinopel zu überzeugen und ihm das besagte Dossier zu
					überreichen, was eben dieses beweisen sollte, gab Kyrill seinem Diakon ein kurzes <span
						class="">Commonitorium</span
					>
					(CU4)<a href="#note-169" aria-label="Zu Fußnote 169 springen" class="note-ref"
						><sup id="ref-169">169</sup></a
					>
					mit auf die Reise, in welchem er knapp die Glaubenssätze des Nestorius im Gegensatz zu den
					eigenen vorstellte und zudem den Fall <span id="page-XXXVII"></span>des Presbyters
					Philippus schilderte<a
						href="#note-170"
						aria-label="Zu Fußnote 170 springen"
						class="note-ref"><sup id="ref-170">170</sup></a
					>, um seinen Gegner auch charakterlich in schlechtem Licht erscheinen zu lassen.
				</p>
				<p>
					Sehr bald nach Erhalt der Materialien, die Kyrill dem römischen Bischof hatte zukommen
					lassen, berief dieser der Causa Nestorius wegen eine Synode ein, bei der der Bischof von
					Konstantinopel verurteilt wurde. Überliefert sind vier Schreiben Coelestins vom 10. August
					430, welche die Entscheidung der unmittelbar vorangegangenen Synode zum Gegenstand haben.<a
						href="#note-171"
						aria-label="Zu Fußnote 171 springen"
						class="note-ref"><sup id="ref-171">171</sup></a
					>
				</p>
				<p>
					Der erste <span class="">Brief des Papstes</span> ist <span class="">an Kyrill</span>
					(CVer1)<a href="#note-172" aria-label="Zu Fußnote 172 springen" class="note-ref"
						><sup id="ref-172">172</sup></a
					>
					gerichtet. <a href=""></a>Coelestin ergeht sich hierin in Dankbarkeitsbekundungen an
					Kyrill, mit seinen Schriften den richtigen Weg aus der von Nestorius verursachten
					Glaubenskrise gewiesen zu haben, teilt ihm das Urteil der römischen Synode mit und
					überträgt ihm dessen Umsetzung<a href=""></a>.<a
						href="#note-173"
						aria-label="Zu Fußnote 173 springen"
						class="note-ref"><sup id="ref-173">173</sup></a
					>
					Abschlie<span id="page-XXXVIII"></span>ßend verweist er noch darauf, dass entsprechende
					Schreiben auch an die Bischöfe Johannes von Antiochia, Rufus von Thessaloniki, Juvenal von
					Jerusalem und Flavian von Philippi gegangen seien.<a
						href="#note-174"
						aria-label="Zu Fußnote 174 springen"
						class="note-ref"><sup id="ref-174">174</sup></a
					>
					Als Antwortschreiben auf CV144<a
						href="#note-175"
						aria-label="Zu Fußnote 175 springen"
						class="note-ref"><sup id="ref-175">175</sup></a
					> ist der Brief vor den anderen auf den 10. August datierten Schreiben platziert. Zudem gibt
					es in den anderen Schreiben konkrete Anspielungen auf den Brief an
				</p>
				<p>
					Die tatsächliche Chronologie der drei anderen Briefe vom 10. August lässt sich nicht
					ermitteln. Sie werden deshalb gemäß der Anordnung in der <em>Collectio Veronensis</em> vorgestellt.
				</p>
				<p>
					In seinem <span class="">Brief an Nestorius</span> (CVer2)<a
						href="#note-176"
						aria-label="Zu Fußnote 176 springen"
						class="note-ref"><sup id="ref-176">176</sup></a
					>
					äußert sich Coelestin zunächst im Ton strenger Zurechtweisung zu den enttäuschten Hoffnungen,
					welche die Welt in Nestorius gesetzt hatte, als dieser zum neuen Bischof von Konstantinopel
					geweiht worden war. Wie wenig er den Erwartungen entspreche, hätten die Schriftstücke, die
					Coelestin von Kyrill durch dessen Boten Poseidonios erhalten habe, sowie die Briefe und Schriftstücke,
					die ihm durch einen <a href=""></a><em>vir illustris</em>
					Antiochus<a href=""></a><a
						href="#note-177"
						aria-label="Zu Fußnote 177 springen"
						class="note-ref"><sup id="ref-177">177</sup></a
					>
					von Nestorius überbracht worden seien, zweifelsfrei bewiesen. Ohne inhaltlich aufzuschlüsseln,
					was genau an der Lehre des Nestorius verkehrt sei, bezichtigt er diesen der Geschwätzigkeit
					und Gotteslästerung, unterbreitet ihm das gegen ihn gefällte Urteil<a
						href="#note-178"
						aria-label="Zu Fußnote 178 springen"
						class="note-ref"><sup id="ref-178">178</sup></a
					>
					und verweist darauf, dass der Wortlaut dieses Urteils und alle Schriften – ob Coelestin hier
					nur die ihm von Nestorius geschickten Dokumente oder auch seine Briefe meint, bleibt offen
					– durch Poseidonios auch an Kyrill, den er mit der Umsetzung des Urteils betraut habe<a
						href="#note-179"
						aria-label="Zu Fußnote 179 springen"
						class="note-ref"><sup id="ref-179">179</sup></a
					>, gegangen seien.
				</p>
				<p>
					<span id="page-XXXIX"></span>Der
					<span class="">Brief Coelestins an Volk und Klerus von Konstantinopel</span>
					(CVer5)<a href="#note-180" aria-label="Zu Fußnote 180 springen" class="note-ref"
						><sup id="ref-180">180</sup></a
					>
					ist im Ton sorgenvoller Mahnung geschrieben. Der Papst spricht hier zunächst die Gemeinde an,
					bevor er sich dem Klerus zuwendet. Beiden legt er nahe, vor dem Hintergrund der verderbten
					Lehre des Nestorius am rechten Glauben festzuhalten und Standhaftigkeit zu beweisen. Der Papst
					beschließt sein Schreiben mit dem Hinweis, er habe, als er Poseidonios sein Antwortschreiben
					an Kyrill übergab, auch den vorliegenden und den Brief an Nestorius (CVer2 [Dok. 30]) beigefügt,
					damit Kyrill, der von ihm zu seinem Stellvertreter in der Causa Nestorius ernannt worden sei,
					für die Weiterleitung der Schreiben nach Konstantinopel sorgen könne.<a
						href="#note-181"
						aria-label="Zu Fußnote 181 springen"
						class="note-ref"><sup id="ref-181">181</sup></a
					>
					Außerdem fügte Coelestin seinem Brief den Wortlaut des Urteils gegen Nestorius an.<a
						href="#note-182"
						aria-label="Zu Fußnote 182 springen"
						class="note-ref"><sup id="ref-182">182</sup></a
					>
				</p>
				<p>
					Das Schreiben Coelestins an die Bischöfe Johannes von Antiochia, Juvenal von Jerusalem,
					Rufus von Thessaloniki und Flavian von Philippi (CVer6)<a
						href="#note-183"
						aria-label="Zu Fußnote 183 springen"
						class="note-ref"><sup id="ref-183">183</sup></a
					>, die den Brief jeweils in demselben Wortlaut erhielten<a
						href="#note-184"
						aria-label="Zu Fußnote 184 springen"
						class="note-ref"><sup id="ref-184">184</sup></a
					>, ist recht knapp gehalten. Die Bischöfe werden ohne große Umschweife über die Gründe der
					Verurteilung und den Wortlaut des Urteils<a
						href="#note-185"
						aria-label="Zu Fußnote 185 springen"
						class="note-ref"><sup id="ref-185">185</sup></a
					>
					informiert. Anders als bei den Briefen, die in Richtung Konstantinopel abgingen, verzichtet
					Coelestin hier auf die Erwähnung der Stellvertreterfunktion Kyrills und auf den Hinweis, dass
					der Brief durch den alexandrinischen Bischof weitergeleitet werde. Vielmehr scheint Poseidonios
					direkt mit der Übermittlung betraut zu sein.<a
						href="#note-186"
						aria-label="Zu Fußnote 186 springen"
						class="note-ref"><sup id="ref-186">186</sup></a
					>
				</p>
				<p>
					Auch Kyrill entwickelte nach Erhalt des Papstbriefes großen Eifer, die Angelegenheit
					voranzutreiben. So schrieb er zunächst an Johannes von Antiochia (CV13 [Dok. 33]) und
					Juvenal von Jerusalem (CV15 [Dok. 34]), um sie davon zu unterrichten, dass er sich nach
					Rom gewandt habe, und um sie über das Ergebnis zu informieren. In keinem der beiden Briefe
					ist von der Synode in Alexandria die Rede<a
						href="#note-187"
						aria-label="Zu Fußnote 187 springen"
						class="note-ref"><sup id="ref-187">187</sup></a
					>, weshalb wohl davon auszugehen ist, dass sie zu diesem Zeitpunkt noch nicht
					stattgefunden hatte.
				</p>
				<p>
					In seinem Schreiben an Johannes von Antiochia (CV13)<a
						href="#note-188"
						aria-label="Zu Fußnote 188 springen"
						class="note-ref"><sup id="ref-188">188</sup></a
					>
					hebt der Alexandriner zunächst erneut sein unermüdliches Bestreben hervor, den Kollegen in
					Konstantinopel auf den Pfad des rechten Glaubens zurückzuführen. Doch Nestorius habe sich von
					die<span id="page-XL"></span>sen Bemühungen angegriffen gefühlt und versucht, Rom auf
					seine Seite zu ziehen, indem er dorthin geschrieben und eigene Schriften beigefügt habe.<a
						href="#note-189"
						aria-label="Zu Fußnote 189 springen"
						class="note-ref"><sup id="ref-189">189</sup></a
					>
					Dies sei gescheitert, da man in Rom seine Ansichten ablehne und ihn der Häresie bezichtige.
					Kyrill selbst sei erst tätig geworden, nachdem der Papst ihm geschrieben habe.<a
						href="#note-190"
						aria-label="Zu Fußnote 190 springen"
						class="note-ref"><sup id="ref-190">190</sup></a
					> Erst dann habe er Poseidonios mit Brief und Dossier ausgestattet nach Rom geschickt, wo die
					römische Synode das Ultimatum an Nestorius beschlossen habe. Rom und seinen Anweisungen sei
					nun um der Gemeinschaft mit dem Westen willen unbedingt Folge zu leisten. Kyrill zeichnet in
					diesem Brief bewusst von sich selbst das Bild einer Randfigur in einem Geschehen, das von Rom
					und dessen Verbündeten gelenkt und beherrscht wurde.
				</p>
				<p>
					Der etwa zeitgleich mit dem Schreiben an Johannes entstandene <span class=""
						>Brief Kyrills an Juvenal von Jerusalem</span
					>
					(CV15)<a href="#note-191" aria-label="Zu Fußnote 191 springen" class="note-ref"
						><sup id="ref-191">191</sup></a
					> ist dem vorangegangenen in Aufbau und Inhalt sehr ähnlich. Allerdings tritt die Bereitschaft
					zur Konfrontation in dem Falle, dass Nestorius nicht auf die Forderungen eingehe, deutlicher
					hervor.
				</p>
				<p>
					Als Johannes die an ihn gerichteten Schreiben aus Rom (CVer6 [Dok. 32]) und Alexandria
					(CV13 [Dok. 33]) erhielt, nahm er dies zum Anlass, seinen Amtskollegen in Konstantinopel
					davon in Kenntnis zu setzen.<a
						href="#note-192"
						aria-label="Zu Fußnote 192 springen"
						class="note-ref"><sup id="ref-192">192</sup></a
					>
					In einem <span class="">Brief an Nestorius</span> (CV14)<a
						href="#note-193"
						aria-label="Zu Fußnote 193 springen"
						class="note-ref"><sup id="ref-193">193</sup></a
					>
					legt er diesem ebenso feinfühlig wie nachdrücklich nahe, den
					<span data-lang="greek">θεοτόκος</span>-Titel mit Blick auf den Kirchenfrieden zu
					akzeptieren. Johannes spricht von „Briefen“, die er von Kyrill erhalten habe. Um welche
					weiteren Schreiben es sich handelt, liegt im Dunkeln.<a
						href="#note-194"
						aria-label="Zu Fußnote 194 springen"
						class="note-ref"><sup id="ref-194">194</sup></a
					>
					Es kann nicht ausgeschlossen werden, dass auch eines darunter war, das Johannes ergänzend über
					die alexandrinische Synode informieren sollte, dann wäre CV14 erst später nach dieser Synode
					entstanden. <em>Terminus ante quem</em> ist jedoch mit einiger Sicherheit der 19. November
					430, da Johannes die auf diesen Tag datierte <em>sacra</em> des Kaisers (CV25 [Dok. 42])<a
						href="#note-195"
						aria-label="Zu Fußnote 195 springen"
						class="note-ref"><sup id="ref-195">195</sup></a
					> nicht erwähnt, also noch nichts von ihr zu wissen scheint.
				</p>
				<p>
					Seinem <span class="">dritten Brief an Nestorius</span> (CV6)<a
						href="#note-196"
						aria-label="Zu Fußnote 196 springen"
						class="note-ref"><sup id="ref-196">196</sup></a
					>
					gibt Kyrill von vornherein einen offi<span id="page-XLI"></span>zielleren Charakter als
					den beiden vorangegangenen Schreiben an den Bischof von Konstantinopel (CV2 [Dok. 18] und
					CV4 [Dok. 23]), indem er als Absender nicht nur sich selbst, sondern auch die ägyptische
					Synode nennt. Entsprechend entschieden und selbstbewusst ist der Ton, mit dem Kyrill
					seinen Gegner angeht, zumal er sich auch auf Coelestin und die römische Synode berufen
					kann. Er fordert von Nestorius den Widerruf seiner Lehrsätze, deren Verderbtheit er ihm
					noch einmal ausführlich vor Augen stellt. Dem Schreiben sind im Anhang zwölf
					Anathematismen<a href="#note-197" aria-label="Zu Fußnote 197 springen" class="note-ref"
						><sup id="ref-197">197</sup></a
					> beigefügt, in denen Kyrill konkretisiert, welche Glaubenssätze genau Nestorius unterschreiben
					bzw. verdammen solle.
				</p>
				<p>
					Der Brief wurde am 30. November 430 an Nestorius übergeben<a
						href="#note-198"
						aria-label="Zu Fußnote 198 springen"
						class="note-ref"><sup id="ref-198">198</sup></a
					>, also erst elf Tage nach der Einberufung des Konzils in Ephesus durch den Kaiser (CV25
					[Dok. 42]).<a href="#note-199" aria-label="Zu Fußnote 199 springen" class="note-ref"
						><sup id="ref-199">199</sup></a
					>
				</p>
				<p>
					Im Gegensatz zu Kyrills Briefen an Johannes von Antiochia (CV13 [Dok. 33]) und Juvenal von
					Jerusalem (CV15 [Dok. 34]) setzen seine beiden nachfolgenden Schreiben an Klerus und Volk
					von Konstantinopel (CV24 [Dok. 37]) sowie an die Mönche von Konstantinopel (CV145 [Dok.
					38]) die Synode in Alexandria voraus.<a
						href="#note-200"
						aria-label="Zu Fußnote 200 springen"
						class="note-ref"><sup id="ref-200">200</sup></a
					> Sie sind also dem dritten Brief Kyrills an Nestorius (CV6 [Dok. 36]) nachzuordnen.
				</p>
				<p>
					<span id="page-XLII"></span>Sein Schreiben an
					<span class="">Klerus und Volk von Konstantinopel</span>
					(CV24)<a href="#note-201" aria-label="Zu Fußnote 201 springen" class="note-ref"
						><sup id="ref-201">201</sup></a
					> leitet Kyrill mit einer Entschuldigung ein, dass man Nestorius zu lange habe gewähren lassen,
					ohne einzuschreiten. Doch jetzt werde ihm durch die synodalen Entscheidungen von Rom und Alexandria
					Einhalt geboten. Klerus und Volk fordert Kyrill auf, auch weiterhin dem rechten Glauben anzuhängen,
					von Nestorius ausgesprochene Verdammungen hätten zudem keine Geltung.
				</p>
				<p>
					Im <span class="">Brief an die Mönche von Konstantinopel</span> (CV145)<a
						href="#note-202"
						aria-label="Zu Fußnote 202 springen"
						class="note-ref"><sup id="ref-202">202</sup></a
					> ist der Ton etwas knapper und bündiger als in dem Schreiben an Volk und Klerus (CV24), doch
					ist der Inhalt des Briefes im Wesentlichen identisch. Dem Treiben des Nestorius soll durch
					das ihm gestellte Ultimatum ein Ende gesetzt werden, die Mönche werden angehalten, im Sinne
					Christi zu denken und zu handeln.
				</p>
				<p>
					Kyrill war sich nicht nur dessen bewusst, dass er Rom auf seine Seite bringen musste, was
					ihm ja ohne Schwierigkeiten gelungen war, sondern auch, dass Nestorius in Konstantinopel
					eine bessere Ausgangsposition für die Durchsetzung seiner Interessen beim Kaiser hatte als
					er selbst von Alexandria aus, zumal sein Verhältnis zum Kaiserhaus ohnehin nicht das
					allerbeste war.<a href="#note-203" aria-label="Zu Fußnote 203 springen" class="note-ref"
						><sup id="ref-203">203</sup></a
					>
					Anspielungen des Nestorius, dass er in Glaubensfragen mit dem Kaiserhof in gutem Einvernehmen
					stehe<a href="#note-204" aria-label="Zu Fußnote 204 springen" class="note-ref"
						><sup id="ref-204">204</sup></a
					>, dürften Kyrill noch zusätzlich angespornt haben, sich auch selbst dorthin zu wenden.
					Mit gleich drei Schriften, die ihre Empfänger spätestens im Oktober oder Anfang November
					430 erreicht haben müssen,<a
						href="#note-205"
						aria-label="Zu Fußnote 205 springen"
						class="note-ref"><sup id="ref-205">205</sup></a
					>
					da Theodosius sie in seiner <em>sacra</em> an Kyrill (CV8 [Dok. 43]) vom November 430
					erwähnt<a href="#note-206" aria-label="Zu Fußnote 206 springen" class="note-ref"
						><sup id="ref-206">206</sup></a
					>, an denen Kyrill aber wahrscheinlich schon gearbeitet hat, als er
					<em>Contra Nestorium</em> verfasste, wandte sich der Patriarch von Alexandria nun also auch
					an das Kaiserhaus:
				</p>
				<p>
					In seiner <span class="">Oratio</span><span class="">
						an Theodosius über den rechten Glauben</span
					>
					(CV7)<a href="#note-207" aria-label="Zu Fußnote 207 springen" class="note-ref"
						><sup id="ref-207">207</sup></a
					>
					setzt Kyrill dem Kaiser den rechten Glauben auseinander, indem er die bekanntesten Irrlehren,
					die er in <span id="page-XLIII"></span>der eines Dyophysitismus, wie ihn Nestorius
					vertrat, gipfeln lässt, vorstellt und widerlegt. Etwas anders verfährt Kyrill in der
					<span class="">Oratio</span><span class=""> an die Kaiserinnen (</span><span class=""
						>Ad dominas</span
					><span class="">)</span> (CV150)<a
						href="#note-208"
						aria-label="Zu Fußnote 208 springen"
						class="note-ref"><sup id="ref-208">208</sup></a
					>, wo er Äußerungen früherer Theologen und Stellen aus dem Neuen Testament zitiert und
					kommentiert, die geeignet waren, die volle Gottheit des Inkarnierten zu beweisen. In
					seiner zweiten <span class="">Oratio</span><span class="">
						an die Kaiserinnen (</span
					><span class="">Ad augustas</span><span class="">)</span> (CV149)<a
						href="#note-209"
						aria-label="Zu Fußnote 209 springen"
						class="note-ref"><sup id="ref-209">209</sup></a
					> beschränkt sich dieses Verfahren auf die Kommentierung von Zitaten aus dem Neuen
				</p>
				<p>
					Doch brachten die Bemühungen Kyrills, die Gunst des Kaisers auf sich zu lenken, nicht den
					gewünschten Erfolg. Am 19. November 430 ließ dieser eine <span class="">sacra</span><span
						class=""
					>
						an Kyrill und einige Metropoliten</span
					>
					(CV25)<a href="#note-210" aria-label="Zu Fußnote 210 springen" class="note-ref"
						><sup id="ref-210">210</sup></a
					>
					ergehen, die den Bestrebungen des Alexandriners erst einmal ein jähes Ende setzte. Die Adressaten
					wurden aufgefordert, zu Pfingsten des folgenden Jahres<a
						href="#note-211"
						aria-label="Zu Fußnote 211 springen"
						class="note-ref"><sup id="ref-211">211</sup></a
					>
					in Ephesus eine Synode abzuhalten, um die aktuellen Streitfragen zu klären,<a
						href="#note-212"
						aria-label="Zu Fußnote 212 springen"
						class="note-ref"><sup id="ref-212">212</sup></a
					> wobei sowohl vorherige Absprachen als auch Fernbleiben von Ephesus strengstens untersagt
				</p>
				<p>
					An Kyrill selbst ging wohl zeitgleich<a
						href="#note-213"
						aria-label="Zu Fußnote 213 springen"
						class="note-ref"><sup id="ref-213">213</sup></a
					>
					noch eine gesonderte <span class="">sacra</span><span class=""> des Kaisers</span> (CV8)<a
						href="#note-214"
						aria-label="Zu Fußnote 214 springen"
						class="note-ref"><sup id="ref-214">214</sup></a
					>, in der dieser das eigenmächtige Vorgehen des Alexandriners in der Auseinandersetzung
					mit Nestorius scharf kritisierte. Kyrill habe nicht einmal davor zurückgeschreckt, mit
					seinen an den Hof geschickten Schriften (CV7 [Dok. 39], CV149 [Dok. 41] u. CV150 [Dok.
					40]) auch hier Zwietracht zu säen.<a
						href="#note-215"
						aria-label="Zu Fußnote 215 springen"
						class="note-ref"><sup id="ref-215">215</sup></a
					>
					Um die Rechtmäßigkeit sei<span id="page-XLIV"></span>ner theologischen Ansichten zu
					prüfen, habe er auf der Synode zu erscheinen. Der Diakon Rusticus, der sich im sechsten
					Jahrhundert im Rahmen des Dreikapitelstreites mit den Akten von Ephesus und Chalkedon
					beschäftigte und auch zahlreiche der Dokumente in seinem
					<em
						>Synodicon<a href="#note-216" aria-label="Zu Fußnote 216 springen" class="note-ref"
							><sup id="ref-216">216</sup></a
						></em
					>
					zusammenstellte, macht in einer Vorbemerkung zu dieser <em>sacra</em> Nestorius für das
					Vorgehen des Kaisers verantwortlich. Er habe sich bei diesem eingeschlichen und zu seinen
					eigenen Gunsten Einfluss auf ihn
					<a href="#note-217" aria-label="Zu Fußnote 217 springen" class="note-ref"
						><sup id="ref-217">217</sup></a
					>
				</p>
				<p>
					Auch andere Bischöfe wie Akakios von Beroia wurden durch eine <span class="">sacra</span>
					(CV23)<a href="#note-218" aria-label="Zu Fußnote 218 springen" class="note-ref"
						><sup id="ref-218">218</sup></a
					>
					von den Bestrebungen des Kaisers, eine Einigung zu erreichen, informiert, allerdings nicht
					verbunden mit dem Befehl, an der Synode in Ephesus teilzunehmen, sondern lediglich mit dem
					Auftrag, für einen glücklichen Ausgang der Sache zu beten. Dass sich dieser nicht so bald einstellen
					sollte, davon zeugen die Dokumente, welche die weiteren Ereignisse im
					<span data-lang="greek">θεοτόκος</span>-Streit beleuchten (s. Bd. 2 u. 3).
				</p>
			</div>
		</article>
		<!---->
	</div>
	<div class="footnotes s-Q0jtzNDKPuIC mt-10 grid grid-cols-[100px_auto] gap-x-4">
		<h2 class="h2 s-Q0jtzNDKPuIC col-span-2 col-start-1">Fußnoten</h2>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-1">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">1<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-1"
					aria-label="Back to note 1"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. z.B. Smith (2018), S.&nbsp;28–34; zu den mannigfaltigen Problemen, die in diesem stark
				vereinfacht formulierten Satz bewusst ausgeblendet wurden, ferner auch Kinzig (2021a),
				S.&nbsp;102–108.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-2">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">2<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-2"
					aria-label="Back to note 2"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Der zweite Artikel im ursprünglichen Wortlaut, die zitierten Aussagen unterstrichen: <span
					data-lang="greek"
					>καὶ εἰς
				</span><span class="">ἕνα κύριον Ἰησοῦν Χριστόν</span><span data-lang="greek">, </span><span
					class="">τὸν υἱὸν τοῦ θεοῦ, γεννηθέντα ἐκ τοῦ πατρός</span
				><span data-lang="greek"
					>, μονογενῆ, τουτέστιν ἐκ τῆς οὐσίας τοῦ πατρός, θεὸν ἐκ θεοῦ, φῶς ἐκ φωτός,
				</span><span class="">θεὸν ἀληθινὸν ἐκ θεοῦ ἀληθινοῦ</span><span data-lang="greek"
					>, γεννηθέντα, οὐ ποιηθέντα,
				</span><span class="">ὁμοούσιον τῷ πατρί</span><span data-lang="greek"
					>, δι’ οὗ τὰ πάντα ἐγένετο τά τε ἐν τῶι οὐρανῷ καὶ τὰ ἐν τῇ γῇ,
				</span><span class=""
					>τὸν δι’ ἡμᾶς τοὺς ἀνθρώπους καὶ διὰ τὴν ἡμετέραν σωτηρίαν κατελθόντα καὶ σαρκωθέντα καὶ
					ἐνανθρωπήσαντα, παθόντα καὶ ἀναστάντα</span
				><span data-lang="greek"> τῇ τρίτῃ ἡμέρᾳ, </span><span class=""
					>ἀνελθόντα εἰς τοὺς οὐρανούς</span
				><span data-lang="greek">, ἐρχόμενον κρῖναι ζῶντας καὶ νεκρούς∙</span>
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-3">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">3<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-3"
					aria-label="Back to note 3"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Zu dem hier skizzierten Problem vgl. einführend z.B. Fraisse-Coué (1996), S.&nbsp;570–574;
				Ritter (2011), S.&nbsp;225–249; Price/Graumann (2020), S.&nbsp;56–62.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-4">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">4<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-4"
					aria-label="Back to note 4"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. Socr. <em>Hist. eccl.</em> 7,29.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-5">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">5<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-5"
					aria-label="Back to note 5"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. Nest. <em>Lib. Heracl.</em> S.&nbsp;378.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-6">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">6<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-6"
					aria-label="Back to note 6"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. Socr. <em>Hist. eccl.</em> 7,29.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-7">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">7<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-7"
					aria-label="Back to note 7"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Zu den Schwierigkeiten, die sich aus dem Umgang mit dem <em>Liber Heraclidis</em> ergeben, der
				in der auf uns gekommenen Form sicherlich nicht vollständig aus der Feder des Nestorius stammt,
				vgl. Bevan (2016), S.&nbsp;14–21.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-8">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">8<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-8"
					aria-label="Back to note 8"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Bei den hier und im weiteren Verlauf des Absatzes in Anführungszeichen gesetzten
				Bezeichnungen Mariens handelt es sich um Übersetzungen aus dem leider nur in syrischer
				Sprache überlieferten <em>Liber Heraclidis</em>. Die griechischen Begriffe in Klammern sind
				jene, die in den Akten und weiteren Fragmenten des Nestorius für die Streitigkeiten belegt
				und dadurch etabliert sind. Sie bilden auch die Grundlage für die im weiteren Verlauf der
				Einleitung gewählten Übersetzungen, d.h. Gottesgebärerin, Menschengebärerin und
				Christusgebärerin.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-9">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">9<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-9"
					aria-label="Back to note 9"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Den bloßen Umstand, dass Menschen mit den beiden erwähnten Begriffen an ihn herangetreten
				seien und ihn um eine Einschätzung derselben gebeten hätten, erwähnt Nestorius allerdings
				schon zu einem wesentlich früheren Zeitpunkt, nämlich in seiner mutmaßlich ersten Predigt
				gegen den <span data-lang="greek">θεοτόκος</span>-Begriff (vgl.
				<a
					href="/edition/vol1/CPal20/text?line=42"
					data-type="internal_ref"
					document="CPal20"
					doc_unit="text"
					document_end="CPal20"
					doc_unit_end="text"
					line_start="42"
					line_end="44"
					debug_cte="01_CPal20_dg.xml#r-AWyOFRca 01_CPal20_dg.xml#r-AWyOFRca-e"
					target="_blank"
					rel="noopener noreferrer">CPal20,42 – 44</a
				>, ACO I,5 S.&nbsp;30,2–4 [Dok. 1]). Dort beschränkt sich der Bericht jedoch auf ebendiesen
				Vorgang. Etwas ausführlicher wird Nestorius dann später in seinem Brief an Johannes von
				Antiochia, als er sich, durch die römische und alexandrinische Synode schon verurteilt (vgl.
				CVer1 [Dok. 29]; CV6 [Dok. 36]), bereits merklich in der Defensive befindet (vgl. CCas78,4,
				ACO I,4 S.&nbsp;5,22–33).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-10">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">10<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-10"
					aria-label="Back to note 10"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. Nest. <em>Lib. Heracl.</em> S.&nbsp;151f.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-11">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">11<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-11"
					aria-label="Back to note 11"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<span data-lang="greek"
					>Θεοτόκον τὴν Μαρίαν καλείτω μηδείς∙ Μαρία γὰρ ἄνθρωπος ἦν, ὑπὸ ἀνθρώπου δὲ θεὸν τεχθῆναι
					ἀδύνατον</span
				>
				(Socr. <em>Hist. eccl.</em> 7,32).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-12">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">12<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-12"
					aria-label="Back to note 12"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. Bevan (2016), S.&nbsp;95f.; Price/Graumann (2020), S.&nbsp;71f.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-13">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">13<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-13"
					aria-label="Back to note 13"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV18, ACO I,1,1 S.&nbsp;101f. (Dok. 2; CPG 5940).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-14">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">14<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-14"
					aria-label="Back to note 14"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Eusebius fordert ausdrücklich jeden Empfänger seiner Schrift dazu auf, sie sowohl im Klerus
				als auch unter den Laien weiter zu verbreiten (Vgl. <a
					href="/edition/vol1/CV18/1?line=4"
					data-type="internal_ref"
					document="CV18"
					doc_unit="1"
					document_end="CV18"
					doc_unit_end="1"
					line_start="4"
					line_end="9"
					debug_cte="02_CV18_dg.xml#r-AWyOyssA 02_CV18_dg.xml#r-AWyOyssA-e"
					target="_blank"
					rel="noopener noreferrer">CV18,1,4 – 9</a
				>, ACO I,1,1 S.&nbsp;101,5–9 [Dok. 2]).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-15">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">15<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-15"
					aria-label="Back to note 15"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Es handelt sich dabei um die <em>sermones</em>, die Loofs in seinen Nestoriana (1905) unter
				den Nummern 8 und 14 herausgibt. Leider lässt sich nicht genau bestimmen, zu welchem
				Zeitpunkt Nestorius den <span data-lang="greek">χριστοτόκος</span>-Begriff eingeführt hat.
				Bemerkenswerterweise taucht er allerdings weder in der in den Konzilsakten überlieferten
				Fassung (CPal20 [Dok. 1]) noch in der durch zusätzliche Fragmente erweiterten Rekonstruktion
				bei Loofs (<em>sermo</em> 9) der vermutlich ersten Predigt gegen den
				<span data-lang="greek">θεοτόκος</span>-Titel auf (vgl. auch oben Anm.
				<a href="#ref-9" target="_blank" rel="noopener noreferrer">9</a>), aus der ebenfalls in der
				<em>Contestatio</em>
				zitiert wird. Da es jedoch eindeutig erscheint, dass diese Predigt bloß unvollständig auf uns
				gekommen ist, hat dieser Umstand nur begrenzte Aussagekraft. Die vierte Predigt, aus der die
				<em>Contestatio</em> Material nimmt, läuft bei Loofs unter der Nummer 16.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-16">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">16<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-16"
					aria-label="Back to note 16"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. unten S.&nbsp;<a href="#page-XXII" target="_blank" rel="noopener noreferrer"
					>XXII,5 – XXIII,2</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-17">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">17<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-17"
					aria-label="Back to note 17"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. Price/Graumann (2020), S.&nbsp;102.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-18">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">18<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-18"
					aria-label="Back to note 18"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Die Begriffe <span data-lang="greek">ἕνωσις</span>/<span data-lang="greek">ἕνοτης</span>
				bzw. <span data-lang="greek">ἑνόω</span> tauchen in der nicht allzu umfangreichen Schrift beispielsweise
				an immerhin elf Stellen auf.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-19">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">19<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-19"
					aria-label="Back to note 19"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. <em>Hom. pasch.</em> 17,2,129–134; 17,3,3–9.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-20">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">20<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-20"
					aria-label="Back to note 20"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Natürlich lässt sich im Osterbrief des Jahres 429 eine Auseinandersetzung mit einer
				Christologie antiochenischer Provenienz als solcher ausmachen. Aber dies ist beispielsweise
				auch schon im Osterbrief des Jahres 420 (<em>Hom. pasch.</em> 8) möglich. Vgl. hierzu z.B. Chadwick
				(1951), S.&nbsp;150.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-21">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">21<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-21"
					aria-label="Back to note 21"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				CV1, ACO I,1,1 S.&nbsp;10–23 (Dok. 5; CPG 5301). Zur zeitlichen Verortung des Briefes vgl.
				unten S.&nbsp;<a href="#page-XXIV" target="_blank" rel="noopener noreferrer"
					>XXIV,19 – XXV,2</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-22">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">22<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-22"
					aria-label="Back to note 22"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Dem Brief selbst lässt sich nicht entnehmen, wo genau die Mönche zu verorten sind, an die er
				adressiert ist. In seinem einige Zeit später verfassten Brief an den römischen Bischof
				Coelestin gibt Kyrill dann die Klöster in Ägypten als Empfänger an (vgl. <a
					href="/edition/vol1/CV144/4?line=1"
					data-type="internal_ref"
					document="CV144"
					doc_unit="4"
					document_end="CV144"
					doc_unit_end="4"
					line_start="1"
					line_end="7"
					debug_cte="27_CV144_dg.xml#r-AWyOzdGz 27_CV144_dg.xml#r-AWyOzdGz-e"
					target="_blank"
					rel="noopener noreferrer">CV144,4,1 – 7</a
				>, ACO I,1,5 S.&nbsp;11,15–19 [Dok. 27]).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-23">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">23<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-23"
					aria-label="Back to note 23"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <a
					href="/edition/vol1/CV1/3?line=2"
					data-type="internal_ref"
					document="CV1"
					doc_unit="3"
					document_end="CV1"
					doc_unit_end="3"
					line_start="2"
					line_end="7"
					debug_cte="05_CV1_dg.xml#r-AWyOzmGW 05_CV1_dg.xml#r-AWyOzmGW-e"
					target="_blank"
					rel="noopener noreferrer">CV1,3,2 – 7</a
				> ACO I,1,1 S.&nbsp;11,12–15 (Dok. 5).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-24">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">24<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-24"
					aria-label="Back to note 24"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. Jes 7,14; Mt 1,20–23. Kyrill verwendet den von dem Propheten vorgegebenen Namen überaus
				häufig, wenn er von dem Fleisch gewordenen Logos (Joh 1,14), spricht. Er findet sich in
				seinen Werken laut TLG weit über dreihundert Mal, bei Johannes Chrysostomos z.B., der uns
				als einer der wenigen Autorem der alten Kirche in ähnlich reichem Umfang wie Kyrill
				Schriften hinterlassen hat, hingegen lediglich gut dreißig Mal.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-25">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">25<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-25"
					aria-label="Back to note 25"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <a
					href="/edition/vol1/CV1/10?line=26"
					data-type="internal_ref"
					document="CV1"
					doc_unit="10"
					document_end="CV1"
					doc_unit_end="10"
					line_start="26"
					line_end="26"
					debug_cte="05_CV1_dg.xml#r-AWyOzuYi 05_CV1_dg.xml#r-AWyOzuYi-e"
					target="_blank"
					rel="noopener noreferrer">CV1,10,26</a
				>, ACO I,1,1 S.&nbsp;14,28 (Dok. 5).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-26">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">26<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-26"
					aria-label="Back to note 26"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Die Frage „Ist also die Jungfrau zur Mutter der Gottheit geworden?“ (<span data-lang="greek"
					>ἆρ’ οὖν, εἰπέ μοι, θεότητος μήτηρ γέγονεν ἡ παρθένος</span
				>:
				<a
					href="/edition/vol1/CV1/12?line=1"
					data-type="internal_ref"
					document="CV1"
					doc_unit="12"
					document_end="CV1"
					doc_unit_end="12"
					line_start="1"
					line_end="2"
					debug_cte="05_CV1_dg.xml#r-AWyPAANf 05_CV1_dg.xml#r-AWyPAANf-e"
					target="_blank"
					rel="noopener noreferrer">CV1,12,1 – 2</a
				>, ACO I,1,1 S.&nbsp;15,7 [Dok. 5]) weist z.B. deutliche Übereinstimmungen mit dem Satz
				„Sagt ihr, dass die Gottheit von der heiligen Jungfrau geboren wurde?“ (<span
					data-lang="greek">τὴν θεότητα λέγετε γεγεννῆσθαι ἐκ τῆς ἁγίας παρθένου</span
				>) auf, der wahrscheinlich einer Predigt entstammt, aus der schon Eusebius in seiner oben
				erwähnten <em>Contestatio</em> zitiert hatte (vgl. Loofs, Nestoriana S.&nbsp;353,1f.).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-27">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">27<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-27"
					aria-label="Back to note 27"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. z.B. <a
					href="/edition/vol1/CV2/1?line=3"
					data-type="internal_ref"
					document="CV2"
					doc_unit="1"
					document_end="CV2"
					doc_unit_end="1"
					line_start="3"
					line_end="8"
					debug_cte="18_CV2_dg.xml#r-AWxwLPdG 18_CV2_dg.xml#r-AWxwLPdG-e"
					target="_blank"
					rel="noopener noreferrer">CV2,1,3 – 8</a
				>, ACO I,1,1 S.&nbsp;23,26–24,3 (Dok. 18).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-28">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">28<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-28"
					aria-label="Back to note 28"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <a
					href="/edition/vol1/CV2/3?line=1"
					data-type="internal_ref"
					document="CV2"
					doc_unit="3"
					document_end="CV2"
					doc_unit_end="3"
					line_start="1"
					line_end="6"
					debug_cte="18_CV2_dg.xml#r-AWyPBQlx 18_CV2_dg.xml#r-AWyPBQlx-e"
					target="_blank"
					rel="noopener noreferrer">CV2,3,1 – 6</a
				>, ACO I,1,1 S.&nbsp;24,13–17 (Dok. 18).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-29">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">29<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-29"
					aria-label="Back to note 29"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <a href="" target="_blank" rel="noopener noreferrer">CV22,6,1 – 14</a>, ACO I,1,1
				S.&nbsp;111,21–30 (Dok. 8).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-30">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">30<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-30"
					aria-label="Back to note 30"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV2, ACO I,1,1 S.&nbsp;23–25 (Dok. 18; CPG 5302).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-31">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">31<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-31"
					aria-label="Back to note 31"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV4, ACO I,1,1 S.&nbsp;25–28 (Dok. 23; CPG 5304).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-32">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">32<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-32"
					aria-label="Back to note 32"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV3, ACO I,1,1 S.&nbsp;25 (Dok. 19; CPG 5666).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-33">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">33<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-33"
					aria-label="Back to note 33"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV5, ACO I,1,1 S.&nbsp;29–32 (Dok. 24; CPG 5669).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-34">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">34<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-34"
					aria-label="Back to note 34"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV166, ACO I,1,6 S.&nbsp;13–106 (Dok. 25; CPG 5217).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-35">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">35<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-35"
					aria-label="Back to note 35"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV144, ACO I,1,5 S.&nbsp;10–12 (Dok. 27; CPG 5310).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-36">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">36<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-36"
					aria-label="Back to note 36"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV7, ACO I,1,1 S.&nbsp;42–72 (Dok. 39; CPG 5218).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-37">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">37<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-37"
					aria-label="Back to note 37"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV149, ACO I,1,5 S.&nbsp;26–61 (Dok. 41; CPG 5220).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-38">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">38<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-38"
					aria-label="Back to note 38"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV150, ACO I,1,5 S.&nbsp;62–118 (Dok. 40; CPG 5219).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-39">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">39<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-39"
					aria-label="Back to note 39"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Während sich CV7 (Dok. 39) recht eindeutig in erster Linie an Theodosius richtet, lässt es
				sich bei CV149 (Dok. 41) und CV150 (Dok. 40) nicht mit Sicherheit ausmachen, wer die genauen
				Adressatinnen sind. Vgl. hierzu auch Anm. zu <a
					href="/edition/vol1/CV149/1?line=10"
					data-type="internal_ref"
					document="CV149"
					doc_unit="1"
					document_end="CV149"
					doc_unit_end="1"
					line_start="10"
					line_end="2"
					debug_cte="41_CV149_dg.xml#r-AWyLHUjl 41_CV149_dg.xml#r-AWyLHUjl-e"
					target="_blank"
					rel="noopener noreferrer">CV149,1,1 – 2</a
				>, zu
				<a
					href=""
					data-type="internal_ref"
					document=""
					doc_unit=""
					document_end=""
					doc_unit_end=""
					line_start=""
					line_end=""
					debug_cte="40_CV150_dg.xml#r-AWyLHhaD 40_CV150_dg.xml#r-AWyLHhaD-e"
					target="_blank"
					rel="noopener noreferrer">CV150,1,3</a
				> und zu den dort noch erwähnten Stellen.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-40">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">40<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-40"
					aria-label="Back to note 40"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <a
					href="/edition/vol1/CV25/3?line=1"
					data-type="internal_ref"
					document="CV25"
					doc_unit="3"
					document_end="CV25"
					doc_unit_end="3"
					line_start="1"
					line_end="9"
					debug_cte="42_CV25_dg.xml#r-AWyPCZvL 42_CV25_dg.xml#r-AWyPCZvL-e"
					target="_blank"
					rel="noopener noreferrer">CV25,3,1 – 9</a
				>, ACO I,1,1 S.&nbsp;115,26–32 (Dok. 42).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-41">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">41<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-41"
					aria-label="Back to note 41"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Coelestin hatte Kyrill am 10. August 430 auf dessen oben erwähntes Schreiben geantwortet. Er
				hatte ihm in diesem Schreiben mitgeteilt, dass Nestorius eine Frist von zehn Tagen zu setzen
				sei, seine in Frage stehenden Lehrmeinungen zu widerrufen, und seinem alexandrinischen
				Amtsbruder ansonsten die Handlungsvollmacht in dem Fall übertragen (vgl. <a
					href="/edition/vol1/CVer1/7?line=2"
					data-type="internal_ref"
					document="CVer1"
					doc_unit="7"
					document_end="CVer1"
					doc_unit_end="7"
					line_start="2"
					line_end="8"
					debug_cte="29_CVer1_dg.xml#r-AWyLGVBF 29_CVer1_dg.xml#r-AWyLGVBF-e"
					target="_blank"
					rel="noopener noreferrer">CVer1,7,2 – 8</a
				>, ACO I,2 S.&nbsp;6,22–25 [Dok. 29]). Kyrill dürfte also zu dem Zeitpunkt, als der Kaiser
				die Einladung versandte, bereits Kenntnis von dem Beschluss Coelestins und der von ihm
				einberufenen Lokalsynode gehabt haben. Dieser wurde Nestorius jedoch erst am 30. November
				430 zugestellt. Kyrill hatte dem Schreiben des Bischofs von Rom noch einen eigenen Brief,
				verfasst von ihm und einer alexandrinischen Synode, hinzugefügt, in dem er die Grundzüge
				seiner Christologie, ausgehend vom Nizänum, noch einmal ausführlich erklärte und dem er
				außerdem eine Liste mit zwölf Anathematismen anhängte, in denen er klar definierte, welche
				Aussagen über die Konstitution Christi definitiv nicht getroffen werden dürften (vgl. CV6
				[Dok. 36]). Es ist jedoch unklar, ob der Kaiser bereits über diese Vorgänge informiert war,
				als er sich zur Einberufung entschloss. Jedenfalls will er aber mit ihr ausdrücklich
				verhindern, dass es zu irgendwelchen gesonderten Beschlüssen kommt (vgl.
				<a
					href="/edition/vol1/CV25/3?line=7"
					data-type="internal_ref"
					document="CV25"
					doc_unit="3"
					document_end="CV25"
					doc_unit_end="3"
					line_start="7"
					line_end="9"
					debug_cte="42_CV25_dg.xml#r-AWyPCrrh 42_CV25_dg.xml#r-AWyPCrrh-e"
					target="_blank"
					rel="noopener noreferrer">CV25,3,7 – 9</a
				>, ACO I,1,1 S.&nbsp;115,31f. [Dok. 42]).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-42">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">42<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-42"
					aria-label="Back to note 42"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <a
					href="/edition/vol1/CV25/2?line=11"
					data-type="internal_ref"
					document="CV25"
					doc_unit="2"
					document_end="CV25"
					doc_unit_end="2"
					line_start="11"
					line_end="13"
					debug_cte="42_CV25_dg.xml#r-AWyPDCnF 42_CV25_dg.xml#r-AWyPDCnF-e"
					target="_blank"
					rel="noopener noreferrer">CV25,2,11 – 13</a
				>, ACO I,1,1 S.&nbsp;115,21–23 (Dok. 42).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-43">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">43<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-43"
					aria-label="Back to note 43"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. CV61, ACO I,1,2 S.&nbsp;54,17–25.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-44">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">44<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-44"
					aria-label="Back to note 44"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. CV151,15, ACO I,1,5 S.&nbsp;122,15–123,3.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-45">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">45<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-45"
					aria-label="Back to note 45"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. CV97, ACO I,1,7 S.&nbsp;142,19–33.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-46">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">46<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-46"
					aria-label="Back to note 46"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. CV127,5, ACO I,1,4 S.&nbsp;17,9–20.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-47">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">47<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-47"
					aria-label="Back to note 47"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. z.B. den Brief von Kyrill an Akakios von Melitene (CV128) oder die Anfrage des
				Dorotheos von Markianopolis an Johannes von Antiochia (CCas203).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-48">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">48<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-48"
					aria-label="Back to note 48"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <em>Actio</em> V, ACO II,1,2 S.&nbsp;129(325),23–130(326),3. Mit dem Beschluss wurde freilichlich
				kein Schlussstrich unter die Kontroverse gezogen. Die Streitigkeiten liefen weiter und führten
				in der Folgezeit noch zu mehreren Schismen. Vgl. hierzu zusammenfassend Allen (1994), S.&nbsp;224–232.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-49">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">49<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-49"
					aria-label="Back to note 49"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Zu diesen <em>Collectiones</em> im Näheren vgl. Price/Graumann (2020), S.&nbsp;2–14.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-50">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">50<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-50"
					aria-label="Back to note 50"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. CA48, ACO I,1,7 S.&nbsp;69,5–70,31.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-51">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">51<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-51"
					aria-label="Back to note 51"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. CV93, ACO I,1,3 S.&nbsp;31,3–32,10.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-52">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">52<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-52"
					aria-label="Back to note 52"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. CV4, ACO I,1,1 S.&nbsp;25,24–28,26 (Dok. 23); CVer14, ACO I,2 S.&nbsp;37,17–39,13;
				CCas6, ACO I,3 S.&nbsp;20,6–33; CPal26, ACO I,5 S.&nbsp;49,30–51,26; CQues66, ACO I,5
				S.&nbsp;337,25–340,6.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-53">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">53<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-53"
					aria-label="Back to note 53"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Chrystal, James, Authoritative Christianity […] The Third World Council; That Is, the Third
				Council of the Whole Christian World, East and West, Which Was Held A. D. 431 at Ephesus in
				Asia, 3 Bände, Jersey City, New Jersey 1895–1908.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-54">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">54<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-54"
					aria-label="Back to note 54"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Price, Richard (Übers.) / Graumann, Thomas (Komm.), The Council of Ephesus of 431. Documents
				and Proceedings (TTH 72), Liverpool 2020 (= Price/Graumann (2020). Vgl. hierzu auch Kinzig
				(2021b).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-55">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">55<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-55"
					aria-label="Back to note 55"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Zu den Kriterien der Anordnung vgl. unten S.&nbsp;<a
					href="#page-XXI"
					target="_blank"
					rel="noopener noreferrer">XXI,14 – 28</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-56">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">56<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-56"
					aria-label="Back to note 56"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Zur inneren Chronologie im Einzelnen vgl. das folgende Kapitel im Allgemeinen.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-57">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">57<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-57"
					aria-label="Back to note 57"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vorarbeiten zu einer Chronologie aller Dokumente in ACO I finden sich bei Eduard Schwartz,
				ACO I,1,8 S.&nbsp;6–14; Geerard (1974–1987), Bd. 4 S.&nbsp;30–69 Nr. 8620–8867; Millar
				(2006), S.&nbsp;235–259; Price/Graumann (2020).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-58">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">58<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-58"
					aria-label="Back to note 58"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Zu Rusticus s. unten S.&nbsp;<a href="#page-XLIII" target="_blank" rel="noopener noreferrer"
					>XLIII,15 – XLIV,6</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-59">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">59<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-59"
					aria-label="Back to note 59"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CPal20, ACO I,5 S.&nbsp;29f. (Dok. 1).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-60">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">60<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-60"
					aria-label="Back to note 60"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. etwa die Bemerkung des Marius Mercator (CPal19, ACO I,5 S.&nbsp;29,15f.): „Jetzt folgt
				hier seine [sc. des Nestorius] erste, in der Kirche an die Gemeinde [gerichtete] gottlose
				Predigt, mit der er bezüglich der Fleischwerdung des Herrn übel gestrauchelt und kläglich
				gestürzt ist.“ Eine Übersetzung dieser Vorbemerkung findet sich in Anm. zu <a
					href="/edition/vol1/CPal20/text?line=1"
					data-type="internal_ref"
					document="CPal20"
					doc_unit="text"
					document_end="CPal20"
					doc_unit_end="text"
					line_start="1"
					line_end="1"
					debug_cte="01_CPal20_dg.xml#r-AWxxfmXL 01_CPal20_dg.xml#r-AWxxfmXL-e"
					target="_blank"
					rel="noopener noreferrer">CPal20,1</a
				> (Dok. 1).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-61">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">61<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-61"
					aria-label="Back to note 61"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Schwartz (1914a), S.&nbsp;7 Anm. 4.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-62">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">62<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-62"
					aria-label="Back to note 62"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<em>Hom. pasch.</em> 17. Während Price/Graumann (2020, S.&nbsp;39), für den Osterbrief ein
				Entstehungsdatum „not long after the turn of the year“ favorisieren, heißt es an späterer
				Stelle (S.&nbsp;102): „probably written at the end of 428“. Wenn Letzteres zuträfe, dann
				müsste Nestorius <em>sermo</em> 9 schon deutlich vor Weihnachten gehalten haben. An diesen
				Zeitraum denkt wohl auch Holum (1982, S.&nbsp;154), wenn er sagt: „Beginning in the last
				months of 428, Nestorius preached on the title <em>Theotokos</em>.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-63">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">63<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-63"
					aria-label="Back to note 63"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV18, ACO I,1,1 S.&nbsp;101f. (Dok. 2; CPG 5940).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-64">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">64<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-64"
					aria-label="Back to note 64"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Die Episode ist überliefert in Kyrill, Contra Nestorium (<a
					href="/edition/vol1/CV166/I-5?line=48"
					data-type="internal_ref"
					document="CV166"
					doc_unit="I-5"
					document_end="CV166"
					doc_unit_end="I-5"
					line_start="48"
					line_end="54"
					debug_cte="25_CV166_dg.xml#r-AWxtbSxl 25_CV166_dg.xml#r-AWxtbSxl-e"
					target="_blank"
					rel="noopener noreferrer">CV166,I,5,48 – 54</a
				>, ACO I,1,6 S.&nbsp;25,40–26,4 [Dok. 25]); vgl. auch Schwartz, ACO I,8 S.&nbsp;8; Schwartz
				(1914b), S.&nbsp;250; Tetz (1961), S.&nbsp;357.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-65">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">65<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-65"
					aria-label="Back to note 65"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <a
					href="/edition/vol1/CV18/1?line=7"
					data-type="internal_ref"
					document="CV18"
					doc_unit="1"
					document_end="CV18"
					doc_unit_end="1"
					line_start="7"
					line_end="9"
					debug_cte="02_CV18_dg.xml#r-AWyPbHOw 02_CV18_dg.xml#r-AWyPbHOw-e"
					target="_blank"
					rel="noopener noreferrer">CV18,1,7 – 9</a
				>, ACO I,1,1 S.&nbsp;101,7–9 (Dok. 2): „[…] weil er ein Gesinnungsgenosse des Paulus von
				Samosata ist, der vor hundertsechzig Jahren von den rechtgläubigen Vätern, also Bischöfen
				verdammt worden ist.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-66">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">66<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-66"
					aria-label="Back to note 66"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Für Ende 428 sprechen sich auch Schwartz (1914b, S.&nbsp;250) und Holum (1982, S.&nbsp;155)
				aus. Loofs (Nestoriana S.&nbsp;49) schließt eine Datierung noch in das Jahr 428 ebenfalls
				nicht aus. Für Herbst oder Winter dieses Jahres plädiert auch Bevan (2016, S.&nbsp;106f.),
				der die <em>Contestatio</em> allerdings der Predigt des Proklos (CV 19 [Dok. 3]) nachordnet.
				Er beobachtet in der ersteren eine Verschärfung des Tons in den Auseinandersetzungen, insofern
				Nestorius hier explizit als Häretiker bezeichnet werde. Doch lässt sich dagegen einwenden, dass
				die Wortwahl ebenso gut dem unterschiedlichen Genre geschuldet sein kann, dessen sich Eusebius
				und Proklos bedienten. In einer polemischen Schrift ist ein schärferer Ton eher zu erwarten als
				in einer Predigt vor der Gemeinde, bei der der Gegner zugegen ist.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-67">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">67<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-67"
					aria-label="Back to note 67"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Auch Price/Graumann (2020, S.&nbsp;33) neigen zu der späteren Datierung.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-68">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">68<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-68"
					aria-label="Back to note 68"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CPL 514.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-69">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">69<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-69"
					aria-label="Back to note 69"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Loofs (Nestoriana S.&nbsp;49) sieht diese Abhängigkeit in seinen Fragmenten 162, 166 und 167
				begründet, von denen das erste dem vierten, die beiden anderen dem sechsten Buch angehören.
				Price/Graumann (2020, S.&nbsp;38f.) gehen allerdings davon aus, dass Cassian die ersten fünf
				Bücher seiner Schrift auf Basis einer nur geringen Menge Materials, das ihm von Nestorius
				zur Verfügung stand, verfasst habe. Erst nachdem die Sendung nestorianischer Schriften von
				Kyrill dann in Rom eingetroffen sei (vgl. hierzu unten S.&nbsp;<a
					href="#page-XXV"
					target="_blank"
					rel="noopener noreferrer">XXV,11 – XXVI,9</a
				>), habe er bei den letzten beiden Büchern aus einem größeren Fundus schöpfen können. Die
				Fragmente 166 und 167, von denen Loofs das erste als besonders aussagekräfig erachtet,
				könnten danach keinen frühen Gebrauch der <em>Contestatio</em> bezeugen. Price/Graumann
				sehen den Hinweis darauf, dass Cassian von der <em>Contestatio</em> beeinflusst war, aber
				auch darin, dass er an verschiedenen Stellen den Vorwurf erhebt, Nestorius sehe in Christus
				einen ‚bloßen Menschen‘ (<em>solitarius homo</em>). Dieser findet sich auch schon in den
				frühen Büchern der Schrift und wird traditionell häufig mit Paulus von Samosata in
				Verbindung gebracht (vgl. z.B. Socr. <em>Hist. eccl.</em> 1,36), in dessen Fußstapfen ja
				Nestorius nach dem Befund der <em>Contestatio</em> wandeln soll. Zu Datierung und Abhängigkeit
				vgl. außerdem Bevan (2016), S.&nbsp;107 Anm. 112.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-70">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">70<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-70"
					aria-label="Back to note 70"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV19, ACO I,1,1 S.&nbsp;103–107 (Dok. 3; CPG 5800).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-71">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">71<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-71"
					aria-label="Back to note 71"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				S. <a
					href="/edition/vol1/CV19/1?line=3"
					data-type="internal_ref"
					document="CV19"
					doc_unit="1"
					document_end="CV19"
					doc_unit_end="1"
					line_start="3"
					line_end="5"
					debug_cte="03_CV19_dg.xml#r-AWyPSYiF 03_CV19_dg.xml#r-AWyPSYiF-e"
					target="_blank"
					rel="noopener noreferrer">CV19,1,3 – 5</a
				>, ACO I,1,1 S.&nbsp;103,4f. (Dok. 3): „Das Fest der Jungfrau ruft die Zunge heute, liebe
				Brüder, zum Lobpreis auf, und die laufenden Feierlichkeiten werden für jene, die
				zusammengekommen sind, zum Garanten des Nutzens.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-72">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">72<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-72"
					aria-label="Back to note 72"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Einen Überblick über die verschiedenen Forschungspositionen in dieser umstrittenen Frage
				geben etwa: Redies (1998), S.&nbsp;199; Constas (1995), S.&nbsp;182 Anm. 40; ders. (2003),
				S.&nbsp;57–59 u. 67f.; Peltomaa (2004), S.&nbsp;78–82; Bevan (2016), S.&nbsp;102–107;
				Price/Graumann (2020), S.&nbsp;33f.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-73">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">73<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-73"
					aria-label="Back to note 73"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. Peltomaa (2004), S.&nbsp;79 mit Anm. 6 und Price/Graumann (2020), S.&nbsp;33f.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-74">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">74<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-74"
					aria-label="Back to note 74"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CV19/1?line=8"
					data-type="internal_ref"
					document="CV19"
					doc_unit="1"
					document_end="CV19"
					doc_unit_end="1"
					line_start="8"
					line_end="11"
					debug_cte="03_CV19_dg.xml#r-AWyPTKvK 03_CV19_dg.xml#r-AWyPTKvK-e"
					target="_blank"
					rel="noopener noreferrer">CV19,1,8 – 11</a
				>, ACO I,1,1 S.&nbsp;103,7–10 (Dok. 3): „Denn seht: Die Erde und das Meer zeigen sich der
				Jungfrau ergeben; das eine breitet unter den Schiffen freundlich den Rücken aus, die andere
				säumt ohne Hindernis die Spuren der Wandernden. Die Natur soll springen, und die Frauen
				werden geehrt.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-75">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">75<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-75"
					aria-label="Back to note 75"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Die Naturbeschreibung passt auch zu der von Bevan (2016, S.&nbsp;104f.) formulierten
				Annahme, dass hier das am 15. August gefeierte Fest ‚Mariä Himmelfahrt‘ gemeint ist, wobei
				er sich seinerseits auf Äußerungen von Seeck (1920 [1966], S.&nbsp;206 mit S.&nbsp;437 Anm.
				zu S.&nbsp;206 Z. 18) sowie Redies (1998, S.&nbsp;199f.) beruft. Diese Vermutung wird jedoch
				von Price/Graumann (2020, S.&nbsp;34 Anm. 66), mit der Begründung abgelehnt, das Fest sei
				erst im 6. Jahrhundert eingeführt worden.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-76">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">76<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-76"
					aria-label="Back to note 76"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Peltomaa (2004), S.&nbsp;80. Vor Peltomaa äußerte auch schon Redies (1998, S.&nbsp;201)
				Bedenken gegen die Annahme, „dass Nestorius sich noch 429 eine Predigt des Proklos angehört
				hätte, noch dazu am Marienfest.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-77">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">77<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-77"
					aria-label="Back to note 77"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Constas (2003), bes. S.&nbsp;58 u. 68. Vgl. auch schon ders. (1995), S.&nbsp;175 u. 182 Anm.
				40.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-78">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">78<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-78"
					aria-label="Back to note 78"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				S. hierzu unten S.&nbsp;<a href="#page-XLIII" target="_blank" rel="noopener noreferrer"
					>XLIII,8 – 14</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-79">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">79<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-79"
					aria-label="Back to note 79"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. auch Price/Graumann (2020), S.&nbsp;34.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-80">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">80<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-80"
					aria-label="Back to note 80"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CPal22, ACO I,5 S.&nbsp;37–39 (Dok. 4; CPG 5716).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-81">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">81<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-81"
					aria-label="Back to note 81"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Die Bedeutung der öffentlichen Meinung für das letztliche Scheitern des Nestorius in
				Konstantinopel betont etwa Price (2014), bes. S.&nbsp;14f. u. 19.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-82">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">82<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-82"
					aria-label="Back to note 82"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Price/Graumann (2020) datieren ebenfalls „in the spring of 429“ (S. 39) und „in early 429“
				(S. 102).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-83">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">83<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-83"
					aria-label="Back to note 83"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV1, ACO I,1,1 S.&nbsp;10–23 (Dok. 5; CPG 5301).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-84">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">84<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-84"
					aria-label="Back to note 84"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				S. unten S.&nbsp;<a href="#page-XXVI" target="_blank" rel="noopener noreferrer"
					>XXVI,10 – 23</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-85">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">85<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-85"
					aria-label="Back to note 85"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CPal21, ACO I,5 S.&nbsp;31–37 (Dok. 6).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-86">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">86<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-86"
					aria-label="Back to note 86"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <a href="" target="_blank" rel="noopener noreferrer">CV22,2,1 – 6</a>, ACO I,1,1
				S.&nbsp;110,18–24 (Dok. 8): „Sie sandten nämlich dem Diakon Buphas Martyrios, der sich um
				die kirchlichen Angelegenheiten kümmert, zwei Schriftstücke zu: eines von Photios oder einem
				anderen gegen das Schreiben an die Mönche verfasst, ein anderes in Form eines Quaternios,
				welches einen seltsamen Titel trug; er lautete aber folgendermaßen: „An jene, die aufgrund
				der Verbindung entweder die Gottheit des Einziggeborenen töten oder die Menschheit
				vergöttlichen.“ Die Vorrede aber handelt über ‚die Beschimpfungen der Häretiker, dass sie
				aus Starrsinnigkeit heraus entstanden seien.‘“ Schon Loofs (Nestoriana S.&nbsp;65,3–6)
				ordnet den Titel <em>sermo</em> 10 zu, vgl. Anm. zu
				<a href="" target="_blank" rel="noopener noreferrer">CV22,2,4 – 7</a>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-87">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">87<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-87"
					aria-label="Back to note 87"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CVer3, ACO I,2 S.&nbsp;12–14 (Dok. 7; CPG 5665).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-88">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">88<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-88"
					aria-label="Back to note 88"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. hierzu Price/Graumann (2020), S.&nbsp;97.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-89">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">89<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-89"
					aria-label="Back to note 89"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Dafür, dass auch der Papst dies für einen Vorwand hielt, sprechen dessen Worte in seinem
				Brief vom 10. August 430 an Nestorius (<a
					href="/edition/vol1/CVer2/16?line=8"
					data-type="internal_ref"
					document="CVer2"
					doc_unit="16"
					document_end="CVer2"
					doc_unit_end="16"
					line_start="8"
					line_end="10"
					debug_cte="30_CVer2_dg.xml#r-AWyPUlZD 30_CVer2_dg.xml#r-AWyPUlZD-e"
					target="_blank"
					rel="noopener noreferrer">CVer2,16,8 – 10</a
				>, ACO I,2 S.&nbsp;11,16f. [Dok. 30], s. auch Anm. hierzu): „Warum aber wird jetzt [von dir]
				danach gefragt, was damals gegen sie verhandelt wurde, wo es [doch] gewiss ist, dass die
				Akten damals durch den katholischen Bischof Attikos von dort an uns geschickt wurden?“, und
				(<a
					href="/edition/vol1/CVer2/16?line=16"
					data-type="internal_ref"
					document="CVer2"
					doc_unit="16"
					document_end="CVer2"
					doc_unit_end="16"
					line_start="16"
					line_end="17"
					debug_cte="30_CVer2_dg.xml#r-AWyPUpeJ 30_CVer2_dg.xml#r-AWyPUpeJ-e"
					target="_blank"
					rel="noopener noreferrer">CVer2,16,16 – 17</a
				>, ACO I,2 S. 11,20) : „Siehe, du fängst an, in Bezug auf sie kundig zu werden, wenn du
				vorher unkundig warst.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-90">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">90<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-90"
					aria-label="Back to note 90"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Freilich fehlen in dem Schreiben selbst konkrete Hinweise für eine Eingrenzung auf diesen
				Zeitraum. Doch auch Schwartz (ACO I,1,8 S.&nbsp;8) verortet das Schreiben zwischen Kyrills
				Briefen an die Mönche (CV18 [Dok. 2]) und an die Apokrisiare (CV22 [Dok. 8]). Price/Graumann
				(2020, S.&nbsp;36) datieren CVer3 (Dok. 7) „probably no later than early summer of 429“,
				ähnlich S.&nbsp;138 Anm.&nbsp;146 „at the latest, to spring 429“, und S.&nbsp;97 etwas vager
				„perhaps in 429“. Ebenfalls unbestimmt ist die Datierung auch bei Jaffé (<span class=""
					>3</span
				>2016–2020, Nr. 824) mit „428–429“, und bei Bevan (2016, S.&nbsp;131), der sich dahingehend
				äußert, dass beide Briefe an Coelestin wahrscheinlich aus dem Jahr 429 stammen.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-91">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">91<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-91"
					aria-label="Back to note 91"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CVer4/1?line=2"
					data-type="internal_ref"
					document="CVer4"
					doc_unit="1"
					document_end="CVer4"
					doc_unit_end="1"
					line_start="2"
					line_end="7"
					debug_cte="22_CVer4_dg.xml#r-AWyPVZbS 22_CVer4_dg.xml#r-AWyPVZbS-e"
					target="_blank"
					rel="noopener noreferrer">CVer4,1,2 – 7</a
				>, ACO I,2 S.&nbsp;14,5–9 (Dok. 22): „Oft habe ich Deiner Heiligkeit geschrieben wegen
				Julian, Orontius und der Übrigen […]. Bis heute haben wir aber keine Schriftstücke über sie
				von Deiner Ehrwürdigkeit erhalten.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-92">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">92<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-92"
					aria-label="Back to note 92"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				S. unten S.&nbsp;<a href="#page-XXXIII" target="_blank" rel="noopener noreferrer"
					>XXXIII,18 – 27</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-93">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">93<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-93"
					aria-label="Back to note 93"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				S. unten S.&nbsp;<a href="#page-XXIX" target="_blank" rel="noopener noreferrer"
					>XXIX,11 – 12</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-94">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">94<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-94"
					aria-label="Back to note 94"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<em>De incarnatione Domini</em> wurde vermutlich Mitte 429 begonnen (vgl. hierzu oben
				S.&nbsp;<a href="#page-XXII" target="_blank" rel="noopener noreferrer">XXII,18 – XXIII,2</a
				>). Welche Schriften Cassian bereits zu Beginn seiner Arbeit vorlagen, lässt sich zur Gänze
				nicht mit letzter Sicherheit ermitteln. Der Umstand, dass er Nestorius schon im ersten Buch
				seiner Schrift mit dem Pelagianismus assoziiert, legt aber die Vermutung nahe, dass er
				zumindest CVer3 kannte, da Nestorius sich in diesem Brief ja eben danach erkundigt, wie er
				mit den Pelagianern in seiner Stadt umgehen solle. Bezeichnend ist weiterhin, dass Cassian
				im dritten Buch den Begriff <span data-lang="greek">θεοδόχος</span> verwendet, um
				wiederzugeben, wie sein anvisierter Gegner den Leib Christi charakterisiert. Diesen hatte
				Nestorius den verfügbaren Quellen nach in CPal20 (Dok. 1; s. oben S.&nbsp;<a
					href="#page-XXI"
					target="_blank"
					rel="noopener noreferrer">XXI,29 – XXII,4</a
				>) zum ersten Mal in nämlicher Weise benutzt. Man kann es daher als wahrscheinlich
				betrachten, dass Cassian auch diese Schrift kannte. Zu der Frage, zu welchem Zeitpunkt
				Nestorius selbst eine Auswahl seiner Predigten nach Rom gesandt hat, vgl. unten Anm.
				<a href="#ref-119" target="_blank" rel="noopener noreferrer">119</a>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-95">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">95<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-95"
					aria-label="Back to note 95"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV22, ACO I,1,1 S.&nbsp;110–112 (Dok. 8; CPG 5309).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-96">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">96<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-96"
					aria-label="Back to note 96"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Zu ihm vgl. Anm. zu <a href="" target="_blank" rel="noopener noreferrer">CV22,1,2</a> (Dok. 8).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-97">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">97<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-97"
					aria-label="Back to note 97"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a href="" target="_blank" rel="noopener noreferrer">CV22,1,3 – 4</a>, ACO I,1,1
				S.&nbsp;110,6 (Dok. 8):
				<span data-lang="greek">ὡς ἔγραψεν τοῖς μονάζουσιν, οὕτως φρονοῦμεν</span>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-98">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">98<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-98"
					aria-label="Back to note 98"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				S. hierzu oben S.&nbsp;<a href="#page-XXV" target="_blank" rel="noopener noreferrer"
					>XXV,3 – 10</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-99">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">99<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-99"
					aria-label="Back to note 99"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>S. oben Anm. <a href="#ref-86" target="_blank" rel="noopener noreferrer">86</a>.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-100">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">100<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-100"
					aria-label="Back to note 100"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV20, ACO I,1,1 S.&nbsp;108 (Dok. 9; CPG 5308).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-101">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">101<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-101"
					aria-label="Back to note 101"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV21, ACO I,1,1 S.&nbsp;109 (Dok. 10; CPG 5307).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-102">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">102<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-102"
					aria-label="Back to note 102"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <a
					href="/edition/vol1/CV21/text?line=4"
					data-type="internal_ref"
					document="CV21"
					doc_unit="text"
					document_end="CV21"
					doc_unit_end="text"
					line_start="4"
					line_end="6"
					debug_cte="10_CV21_dg.xml#r-AWyPWYAo 10_CV21_dg.xml#r-AWyPWYAo-e"
					target="_blank"
					rel="noopener noreferrer">CV21,4 – 6</a
				>, ACO I,1,1 S.&nbsp;109,7–9 (Dok. 10).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-103">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">103<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-103"
					aria-label="Back to note 103"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CV21/text?line=10"
					data-type="internal_ref"
					document="CV21"
					doc_unit="text"
					document_end="CV21"
					doc_unit_end="text"
					line_start="10"
					line_end="14"
					debug_cte="10_CV21_dg.xml#r-AWyPWcuc 10_CV21_dg.xml#r-AWyPWcuc-e"
					target="_blank"
					rel="noopener noreferrer">CV21,10 – 14</a
				>, ACO I,1,1 S.&nbsp;109,11–15 (Dok. 10): „Er aber hat es zugelassen, dass der schöne
				Dorotheos, der Bischof, in einer katholischen und rechtgläubigen Kirche öffentlich gesagt
				hat: ‚Jemand sei verdammt, wenn er behauptet, dass Maria Gottesgebärerin sei.‘ Und er hat,
				als er davon hörte, nicht nur geschwiegen, während jener sprach, sondern er nahm ihn sogar
				umgehend in die mystische Gemeinschaft auf und machte ihn zum Genossen.“ Auch Schwartz
				(1914b, S.&nbsp;255 Anm. 1) vertritt die Auffassung, dass die Äußerung des Dorotheos
				zeitlich dem Brief an die Mönche (CV1 [Dok. 5]) nachzuordnen ist.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-104">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">104<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-104"
					aria-label="Back to note 104"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				CV16, ACO I,1,1 S.&nbsp;98f. (Dok. 11; CPG 5314), hier <a
					href="/edition/vol1/CV16/text?line=7"
					data-type="internal_ref"
					document="CV16"
					doc_unit="text"
					document_end="CV16"
					doc_unit_end="text"
					line_start="7"
					line_end="12"
					debug_cte="11_CV16_dg.xml#r-AWxwMUwt 11_CV16_dg.xml#r-AWxwMUwt-e"
					target="_blank"
					rel="noopener noreferrer">CV16,7 – 12</a
				>, S.&nbsp;98,9–13: „Es genügte nämlich dem überaus frommen Bischof Nestorius nicht, in
				einer Kirche das auszusprechen, was in einer Kirche Anstoß erregt und den Glauben geschwächt
				hat, der sich auf unser aller Retter Christus richtet, sondern er ließ ja sogar zu, dass ein
				gewisser Dorotheos, ein Bischof, es wagte, in einer Kirche und vor einer Versammlung
				öffentlich zu sagen: ‚Wenn jemand Maria Gottesgebärerin nennt, sei er verdammt.‘“ Das
				öffentliche Auftreten des Dorotheos dient Kyrill auch später in seinem Brief an Coelestin
				dazu, dem Papst die Zustände in Konstantinopel als unhaltbar vorzuführen, vgl.
				<a
					href="/edition/vol1/CV144/3?line=1"
					data-type="internal_ref"
					document="CV144"
					doc_unit="3"
					document_end="CV144"
					doc_unit_end="3"
					line_start="1"
					line_end="6"
					debug_cte="27_CV144_dg.xml#r-AWxwNLeI 27_CV144_dg.xml#r-AWxwNLeI-e"
					target="_blank"
					rel="noopener noreferrer">CV144,3,1 – 6</a
				>, ACO I,1,5 S.&nbsp;11,6–10 (Dok. 27): „Es gab in Konstantinopel einen Bischof mit Namen
				Dorotheos, der dasselbe wie er dachte – einen Mann, der ein opportunistischer Schmeichler
				und vorschnell mit den Lippen war, wie geschrieben steht. Dieser stand, während der überaus
				gottesfürchtige Nestorius auf dem Thron der Kirche von Konstantinopel saß, bei einer
				Versammlung auf und erdreistete sich, mit lauter Stimme zu sagen: ‚Wenn jemand sagt, dass
				Maria eine Gottesgebärerin sei, soll er verdammt sein.‘ Und es kam zu lautem Geschrei von
				Seiten des gesamten Volkes und zu einem Aufbruch.“ Diesen Worten lässt Kyrill nicht nur
				genaue Ausführungen zu den Auswirkungen des Ereignisses auf das kirchliche Leben in der
				Kaiserstadt folgen, sondern auch durchblicken, dass Dorotheos auf Anweisung des Nestorius
				als dessen Werkzeug handelte (<a
					href="/edition/vol1/CV144/6?line=13"
					data-type="internal_ref"
					document="CV144"
					doc_unit="6"
					document_end="CV144"
					doc_unit_end="6"
					line_start="13"
					line_end="17"
					debug_cte="27_CV144_dg.xml#r-AWxwNSUN 27_CV144_dg.xml#r-AWxwNSUN-e"
					target="_blank"
					rel="noopener noreferrer">CV144,6,13 – 17</a
				>, S.&nbsp;12,16–19): „Und da er [sc. Nestorius] dies nicht mit seiner eigenen Stimme tun
				wollte, brachte er einen anderen in Stellung, den erwähnten Dorotheos, und gab die
				Anweisung, dies zu sagen, während er dasaß und zuhörte. Mit ihm ist er auch, als er vom
				Thron herunterstieg, sofort in Gemeinschaft getreten, als er die göttliche Mysterienfeier
				verrichtete.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-105">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">105<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-105"
					aria-label="Back to note 105"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Bevan (2016, S.&nbsp;134) ordnet CV16 chronologisch den beiden Briefen Kyrills an Johannes
				von Antiochia (CV13 [Dok. 33]) und Juvenal von Jerusalem (CV15 [Dok. 34]) zu, wonach der
				Brief zwischen August und November 430 anzusiedeln wäre. Doch gehört er seinem Inhalt nach
				eher in das Jahr 429, nicht zuletzt wegen des Hinweises auf Dorotheos.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-106">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">106<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-106"
					aria-label="Back to note 106"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV17, ACO I,1,1 S.&nbsp;99f. (Dok. 12; CPG 6479).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-107">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">107<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-107"
					aria-label="Back to note 107"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CPal31–34, ACO I,5 S.&nbsp;60–65 (Dok. 13–16).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-108">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">108<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-108"
					aria-label="Back to note 108"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Eine Übersetzung des Dokumentes findet sich in Anm. zu <a
					href="/edition/vol1/CPal31/text?line=1"
					data-type="internal_ref"
					document="CPal31"
					doc_unit="text"
					document_end="CPal31"
					doc_unit_end="text"
					line_start="1"
					line_end="1"
					debug_cte="13_CPal31_dg.xml#r-AWyPXVaJ 13_CPal31_dg.xml#r-AWyPXVaJ-e"
					target="_blank"
					rel="noopener noreferrer">CPal31,1</a
				> (Dok. 13).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-109">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">109<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-109"
					aria-label="Back to note 109"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. CPal30, ACO I,5 S.&nbsp;60,15–18.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-110">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">110<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-110"
					aria-label="Back to note 110"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Hierzu äußert sich schon Socr. <em>Hist</em>. e<em>ccl</em>. 7,29,4–13, ausführlich. Vgl.
				auch Holum (1982), S.&nbsp;150f.; Fraisse-Coué (1996), S.&nbsp;577f.; Wessel (2004),
				S.&nbsp;86–90; Millar (2006), bes. S.&nbsp;154–156; Bevan (2016), S.&nbsp;78–85;
				Leuenberger-Wenger (2019), S.&nbsp;20–22; Kinzig (2020), S.&nbsp;455.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-111">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">111<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-111"
					aria-label="Back to note 111"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CPal31/text?line=3"
					data-type="internal_ref"
					document="CPal31"
					doc_unit="text"
					document_end="CPal31"
					doc_unit_end="text"
					line_start="3"
					line_end="7"
					debug_cte="13_CPal31_dg.xml#r-AWyPXkAO 13_CPal31_dg.xml#r-AWyPXkAO-e"
					target="_blank"
					rel="noopener noreferrer">CPal31,3 – 7</a
				>, ACO I,5 S.&nbsp;60,21–23 (Dok. 13).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-112">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">112<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-112"
					aria-label="Back to note 112"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CPal31/text?line=107"
					data-type="internal_ref"
					document="CPal31"
					doc_unit="text"
					document_end="CPal31"
					doc_unit_end="text"
					line_start="107"
					line_end="108"
					debug_cte="13_CPal31_dg.xml#r-AWyPXpds 13_CPal31_dg.xml#r-AWyPXpds-e"
					target="_blank"
					rel="noopener noreferrer">CPal31,107 – 108</a
				>, ACO I,5 S.&nbsp;62,13f. (Dok. 13).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-113">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">113<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-113"
					aria-label="Back to note 113"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>ACO I,1,8 S.&nbsp;7.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-114">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">114<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-114"
					aria-label="Back to note 114"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CPal36, ACO I,5 S.&nbsp;65–70 (Dok. 17).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-115">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">115<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-115"
					aria-label="Back to note 115"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				CPal36, ACO I,5 S.&nbsp;65–70 (Dok. 17; CPL 781). Während das <em>Commonitorium</em> selbst 429
				entstanden ist, stammt die Vorbemerkung dazu aus der Zeit nach dem Konzil von Ephesus.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-116">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">116<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-116"
					aria-label="Back to note 116"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				CV2, ACO I,1,1 S.&nbsp;23–25 (Dok. 18; CPG 5302). So äußert sich auch Schwartz (1914a,
				S.&nbsp;3 mit Anm. 1) dahingehend, dass der Brief „noch im Jahr 429 abgefasst sein muss“, da
				der zweite in den Akten von Chalkedon auf die Zeit zwischen dem 26. Januar und 24. Februar
				datiert sei. Price/Grauman (2020, S.&nbsp;41 u. 113) hingegen datieren das Schreiben auf den
				Sommer bzw. – unter Berufung auf Kidd (1922, Bd. 3 S.&nbsp;211) – auf den Juni 429. Eine
				Quelle, auf die sich seine Datierung stützt, nennt Kidd jedoch nicht.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-117">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">117<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-117"
					aria-label="Back to note 117"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CV2/3?line=1"
					data-type="internal_ref"
					document="CV2"
					doc_unit="3"
					document_end="CV2"
					doc_unit_end="3"
					line_start="1"
					line_end="6"
					debug_cte="18_CV2_dg.xml#r-AWyPBQlx 18_CV2_dg.xml#r-AWyPBQlx-e"
					target="_blank"
					rel="noopener noreferrer">CV2,3,1 – 6</a
				>, ACO I,1,1 S.&nbsp;24,13–17 (Dok. 18): „Was soll ich nun machen (denn ich muss mich mit
				Deiner Gottesfurcht beraten), wenn der überaus fromme und gottesfürchtige Bischof von Rom
				Coelestin und die überaus gottesfürchtigen Bischöfe aus seinem Umfeld sich zu den irgendwie
				dorthin [sc. nach Rom] gelangten Schriften äußern, ob sie nun Deiner Gottesfurcht zuzuordnen
				sind oder nicht? Sie schreiben nämlich, als hätten sie großen Anstoß genommen.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-118">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">118<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-118"
					aria-label="Back to note 118"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Anders als in seinem späteren Band (ACO I,8 S.&nbsp;8) scheint Schwartz (1914b, S.&nbsp;252)
				offenbar noch davon auszugehen, dass es sich bei dem, was dem Papst vorlag, ausschließlich
				um die Zeugnisse handelt, die Eusebius von Dorylaeum nach Rom geschickt hatte, denn er hält
				es hier für möglich, dass Nestorius seinen ersten Brief an Coelestin (CVer3 [Dok. 7]) erst
				auf eben die Anspielung Kyrills in CV2 hin verfasst habe, nach der der Papst an Schriften
				des Nestorius gekommen sei, die ihm sehr missfielen. Dann wäre CVer3 erst Ende 429 oder
				Anfang 430 anzusiedeln. Dies ist jedoch mit Blick auf die größeren Abstände, die laut
				Nestorius zwischen seinen mindestens drei Briefen an den Papst in dieser Zeit lagen, eher
				unwahrscheinlich. S.&nbsp;hierzu auch oben S. <a
					href="#page-XXV"
					target="_blank"
					rel="noopener noreferrer">XXV,11 – XXVI,9</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-119">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">119<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-119"
					aria-label="Back to note 119"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CVer2/4?line=1"
					data-type="internal_ref"
					document="CVer2"
					doc_unit="4"
					document_end="CVer2"
					doc_unit_end="4"
					line_start="1"
					line_end="2"
					debug_cte="30_CVer2_dg.xml#r-AWyHJPiC 30_CVer2_dg.xml#r-AWyHJPiC-e"
					target="_blank"
					rel="noopener noreferrer">CVer2,4,1 – 2</a
				>, ACO I,2 S.&nbsp;8,5f. (Dok. 30). Vgl. die einleitenden Worte zu CVer2 in der
				<em>Collectio Casinensis</em>, ACO I,3 S.&nbsp;37,3f. (zit. in Anm zu
				<a
					href="/edition/vol1/CVer2/1?line=16"
					data-type="internal_ref"
					document="CVer2"
					doc_unit="1"
					document_end="CVer2"
					doc_unit_end="1"
					line_start="16"
					line_end="16"
					debug_cte="30_CVer2_dg.xml#r-AWyLEcQG 30_CVer2_dg.xml#r-AWyLEcQG-e"
					target="_blank"
					rel="noopener noreferrer">CVer2,1,1</a
				>): „Als aber der Erzbischof Roms, Coelestin, die ihm von Nestorius selbst durch Antiochus
				[überbrachten] Quaternionen mit [seinen] Darlegungen empfing […]“ und
				<a
					href="/edition/vol1/CVer6/3?line=5"
					data-type="internal_ref"
					document="CVer6"
					doc_unit="3"
					document_end="CVer6"
					doc_unit_end="3"
					line_start="5"
					line_end="8"
					debug_cte="32_CVer6_dg.xml#r-AWyPZDKm 32_CVer6_dg.xml#r-AWyPZDKm-e"
					target="_blank"
					rel="noopener noreferrer">CVer6,3,5 – 8</a
				>, ACO I,2 S.&nbsp;21,18–20 (Dok. 32): „[...] dies [sc. die Nachrichten bezüglich der
				Irrlehre des Nestorius] ist durch seine Bücher, die er selbst uns geschickt hatte,
				öffentlich gemacht worden, und dies ist, was von noch größerer Beweiskraft ist, durch seine
				an uns gesandten [und] durch die Unterschrift des Autors selbst gesicherten Briefe so
				offenbar geworden, dass nicht länger gezweifelt warden kann.“ Vgl. auch die Äußerungen
				Kyrills in seinen Briefen an Johannes von Antiochia (<a
					href="/edition/vol1/CV13/text?line=15"
					data-type="internal_ref"
					document="CV13"
					doc_unit="text"
					document_end="CV13"
					doc_unit_end="text"
					line_start="15"
					line_end="20"
					debug_cte="33_CV13_dg.xml#r-AWyPZTEA 33_CV13_dg.xml#r-AWyPZTEA-e"
					target="_blank"
					rel="noopener noreferrer">CV13,15 – 20</a
				>, ACO I,1,1 S.&nbsp;92,11–14 [Dok. 33]): „Er hat nämlich, indem er irgendwelche
				absonderlichen Dinge abfasste, einen langen Brief an meinen Herrn, den überaus frommen
				Bischof der Kirche von Rom Coelestin geschrieben […]. Ferner verschickte er auch
				Quaternionen mit seinen eigenen Deutungen [...]“, und an Juvenal von Jerusalem (<a
					href="/edition/vol1/CV15/text?line=27"
					data-type="internal_ref"
					document="CV15"
					doc_unit="text"
					document_end="CV15"
					doc_unit_end="text"
					line_start="27"
					line_end="30"
					debug_cte="34_CV15_dg.xml#r-AWyPZJSA 34_CV15_dg.xml#r-AWyPZJSA-e"
					target="_blank"
					rel="noopener noreferrer">CV15,27 – 30</a
				>, ACO I,1,1 S.&nbsp;97,18–21 [Dok. 34]): „Weil er aber glaubte, er werde die Kirche von Rom
				an sich reißen können, schrieb er an meinen überaus frommen und gottesfürchtigen Bruder und
				Mitdiener Coelestin, den Bischof der Kirche von Rom […]. Er hat aber auch zahlreiche
				Deutungen geschickt […].“ Ungeklärt ist die Frage, welchem seiner Schreiben Nestorius die
				Materialien beigefügt hatte. Die beiden noch vorhandenen Briefe an Coelestin (CVer3 u. 4
				[Dok. 7 u. 22]) enthalten hierauf keinen Hinweis. Ein dritter Brief (CPal55, ACO I,5
				S.&nbsp;182) wurde erst nach der Einberufung des Konzils verfasst, er kommt somit für die
				Übersendung der Predigten nicht mehr in Frage. Nach Schwartz (1914a, S.&nbsp;5; vgl. auch
				1914b, S.&nbsp;254f.) verschickte Nestorius den Brief mit seinen Schriften erst nach CVer3
				und CVer4, sie hätten Coelestin aber bereits vorgelegen, als der Gesandte Kyrills,
				Poseidonios, mit dem Dossier in Rom eintraf (zu den Dokumenten des Dossiers vgl. Anm. zu
				<a
					href="/edition/vol1/CU4/text?line=47"
					data-type="internal_ref"
					document="CU4"
					doc_unit="text"
					document_end="CU4"
					doc_unit_end="text"
					line_start="47"
					line_end="48"
					debug_cte="28_CU4_dg.xml#r-AWyFsUID 28_CU4_dg.xml#r-AWyFsUID-e"
					target="_blank"
					rel="noopener noreferrer">CU4,47 – 48</a
				>
				[Dok. 28]). Für diese Reihenfolge spricht, dass Nestorius in seinem zweiten überlieferten Schreiben
				zwar von mehreren Briefen spricht, die er an den Papst geschickt habe (<a
					href="/edition/vol1/CVer4/1?line=2"
					data-type="internal_ref"
					document="CVer4"
					doc_unit="1"
					document_end="CVer4"
					doc_unit_end="1"
					line_start="2"
					line_end="3"
					debug_cte="22_CVer4_dg.xml#r-AWyPZsJp 22_CVer4_dg.xml#r-AWyPZsJp-e"
					target="_blank"
					rel="noopener noreferrer">CVer4,1,2 – 3</a
				>, ACO I,2 S.&nbsp;14,5: „Oft habe ich Deiner Heiligkeit geschrieben wegen Julian, Orontius
				und der Übrigen […]“), nicht aber von beigefügten Materialien.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-120">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">120<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-120"
					aria-label="Back to note 120"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				S. unten S.&nbsp;<a href="#page-XXXV" target="_blank" rel="noopener noreferrer"
					>XXXV,33 – XXXVI,12</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-121">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">121<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-121"
					aria-label="Back to note 121"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV3, ACO I,1,1 S.&nbsp;25 (Dok. 19; CPG 5666).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-122">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">122<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-122"
					aria-label="Back to note 122"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Zu Lampon s. auch Anm. zu <a
					href="/edition/vol1/CV3/text?line=4"
					data-type="internal_ref"
					document="CV3"
					doc_unit="text"
					document_end="CV3"
					doc_unit_end="text"
					line_start="4"
					line_end="4"
					debug_cte="19_CV3_dg.xml#r-AWyPaBhH 19_CV3_dg.xml#r-AWyPaBhH-e"
					target="_blank"
					rel="noopener noreferrer">CV3,4</a
				> (Dok. 19).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-123">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">123<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-123"
					aria-label="Back to note 123"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV143, ACO I,1,5 S.&nbsp;7–10 (Dok. 20; CPG 5774).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-124">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">124<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-124"
					aria-label="Back to note 124"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. etwa <a
					href="/edition/vol1/CV143/4?line=1"
					data-type="internal_ref"
					document="CV143"
					doc_unit="4"
					document_end="CV143"
					doc_unit_end="4"
					line_start="1"
					line_end="4"
					debug_cte="20_CV143_dg.xml#r-AWyPaIuY 20_CV143_dg.xml#r-AWyPaIuY-e"
					target="_blank"
					rel="noopener noreferrer">CV143,4,1 – 4</a
				>, ACO I,1,5 S.&nbsp;9,4–6 (Dok. 20): „Wir rufen daher euren unsterblichen und überaus
				frommen Glauben dazu auf, von nun an nicht mehr darüber hinwegzusehen, dass die Kirche der
				Rechtgläubigen in euren, der rechtgläubigen und überaus frommen Kaiser Zeiten von Häretikern
				zum Ehebruch verführt wird […]“, und
				<a
					href="/edition/vol1/CV143/4?line=20"
					data-type="internal_ref"
					document="CV143"
					doc_unit="4"
					document_end="CV143"
					doc_unit_end="4"
					line_start="20"
					line_end="22"
					debug_cte="20_CV143_dg.xml#r-AWyPaMoH 20_CV143_dg.xml#r-AWyPaMoH-e"
					target="_blank"
					rel="noopener noreferrer">CV143,4,20 – 22</a
				>, S. 9,17–19: „[…] sondern er, indem er sich in Verachtung gegen alle gehüllt hat, weil er
				auf Geldmittel, die Macht einiger Verdorbener oder, um frei von Furcht zu sprechen, auch
				Eure Herrschaft vertraut, diese Dinge tut […].“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-125">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">125<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-125"
					aria-label="Back to note 125"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <a
					href="/edition/vol1/CV143/4?line=6"
					data-type="internal_ref"
					document="CV143"
					doc_unit="4"
					document_end="CV143"
					doc_unit_end="4"
					line_start="6"
					line_end="10"
					debug_cte="20_CV143_dg.xml#r-AWyPacyk 20_CV143_dg.xml#r-AWyPacyk-e"
					target="_blank"
					rel="noopener noreferrer">CV143,4,6 – 10</a
				>, ACO I,1,5 S.&nbsp;9,8–11 (Dok. 20): „Und Eure Herrschaft wird schon von daher befehlen,
				dass die heilige und weltweite Synode zustande kommt, auf dass, wenn die Synode zustande
				gekommen ist, Christus die hochheilige Kirche eint, sein Volk zusammenführt und es
				vollbringt, dass er die Priester in der Verkündung des wahren Glaubens zurückgewinnt, bevor
				sich die widerrechtliche Lehre ausbreitet“, und
				<a
					href="/edition/vol1/CV143/5?line=10"
					data-type="internal_ref"
					document="CV143"
					doc_unit="5"
					document_end="CV143"
					doc_unit_end="5"
					line_start="10"
					line_end="12"
					debug_cte="20_CV143_dg.xml#r-AWyPafrQ 20_CV143_dg.xml#r-AWyPafrQ-e"
					target="_blank"
					rel="noopener noreferrer">CV143,5,10 – 12</a
				>, ACO I,1,5 S.&nbsp;10,6–8: „Wir haben euch schließlich mit Blick auf eine weltweite Synode
				angerufen, welche in der Lage ist, das ins Schwanken Geratene oder eben Zusammengebrochene
				gründlich zu festigen bzw. aufzurichten.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-126">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">126<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-126"
					aria-label="Back to note 126"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				So heißt es etwa auch bei Millar (2006), S.&nbsp;155: „at some date before the defintive
				summoning of the Council in November 430“. Er identifiziert also die besagte Synode mit dem
				ephesinischen Konzil von 431 (vgl. auch ebd. S.&nbsp;156f.).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-127">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">127<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-127"
					aria-label="Back to note 127"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Price/Graumann (2020), S.&nbsp;189 u. 192 Anm. 352.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-128">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">128<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-128"
					aria-label="Back to note 128"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. auch schon Graumann (2002a), S.&nbsp;312f. mit Anm. 115.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-129">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">129<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-129"
					aria-label="Back to note 129"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CV143/4?line=30"
					data-type="internal_ref"
					document="CV143"
					doc_unit="4"
					document_end="CV143"
					doc_unit_end="4"
					line_start="30"
					line_end="34"
					debug_cte="20_CV143_dg.xml#r-AWyPEEZQ 20_CV143_dg.xml#r-AWyPEEZQ-e"
					target="_blank"
					rel="noopener noreferrer">CV143,4,30 – 34</a
				>, ACO I,1,5 S.&nbsp;9,23–27 (Dok. 20): „Er hat aber natürlich nicht nur seine Kleriker und
				Mitarbeiter hinzugezogen, sondern auch einige aus den außerhalb liegenden Gebieten, denen es
				nach den kirchlichen Regeln überhaupt nicht erlaubt ist, [sich] auf einen anderen
				Bischofssitz oder eine andere Gemeinde [auszurichten], sondern auf die eigenen Gebiete oder
				Städte, wo sie gewählt worden sind, [ausgerichtet] sein müssen […].“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-130">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">130<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-130"
					aria-label="Back to note 130"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>ACO I,1,8 S.&nbsp;8.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-131">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">131<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-131"
					aria-label="Back to note 131"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				D.h. Philipp von Side. Zu ihm s. auch S.&nbsp;<a
					href="#page-"
					target="_blank"
					rel="noopener noreferrer">XI,20 – 23</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-132">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">132<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-132"
					aria-label="Back to note 132"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CPal35/text?line=15"
					data-type="internal_ref"
					document="CPal35"
					doc_unit="text"
					document_end="CPal35"
					doc_unit_end="text"
					line_start="15"
					line_end="18"
					debug_cte="21_CPal35_dg.xml#r-AWyPEUfh 21_CPal35_dg.xml#r-AWyPEUfh-e"
					target="_blank"
					rel="noopener noreferrer">CPal35,15 – 18</a
				>, ACO I,5 S.&nbsp;65,27–29 (Dok. 21): „Die den Bischöfen des Westens, dem alexandrinischen
				[Bischof] und vielen [anderen] geschickten Briefe des Konzils sowie die Antwortschreiben
				haben euch gewiss unsere Ansicht deutlich gemacht, nämlich [euch] als den umsichtigen
				[Anhängern] desselben orthodoxen Bekenntnisses.“ Zu dem hier angesprochenen Konzil s. Anm.
				zu
				<a
					href="/edition/vol1/CPal35/text?line=16"
					data-type="internal_ref"
					document="CPal35"
					doc_unit="text"
					document_end="CPal35"
					doc_unit_end="text"
					line_start="16"
					line_end="16"
					debug_cte="21_CPal35_dg.xml#r-AWyQRAhU 21_CPal35_dg.xml#r-AWyQRAhU-e"
					target="_blank"
					rel="noopener noreferrer">CPal35,16</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-133">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">133<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-133"
					aria-label="Back to note 133"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CV5/8?line=7"
					data-type="internal_ref"
					document="CV5"
					doc_unit="8"
					document_end="CV5"
					doc_unit_end="8"
					line_start="7"
					line_end="10"
					debug_cte="24_CV5_dg.xml#r-AWyQRUfx 24_CV5_dg.xml#r-AWyQRUfx-e"
					target="_blank"
					rel="noopener noreferrer">CV5,8,7 – 10</a
				>, ACO I,1,1 S.&nbsp;32,9–11 (Dok. 24): „Erkenne aber, dass du fehlgeleitet worden bist
				durch jene, die damals durch die heilige Synode verdammt worden sind, da sie manichäisches
				Gedankengut pflegten, oder vielleicht durch Kirchenleute Deiner Zuneigung […].“ Vgl. hierzu
				Anm. zu
				<a
					href="/edition/vol1/CV5/8?line=8"
					data-type="internal_ref"
					document="CV5"
					doc_unit="8"
					document_end="CV5"
					doc_unit_end="8"
					line_start="8"
					line_end="9"
					debug_cte="24_CV5_dg.xml#r-AWyBlnZR 24_CV5_dg.xml#r-AWyBlnZR-e"
					target="_blank"
					rel="noopener noreferrer">CV5,8,8 – 9</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-134">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">134<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-134"
					aria-label="Back to note 134"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CU4/text?line=35"
					data-type="internal_ref"
					document="CU4"
					doc_unit="text"
					document_end="CU4"
					doc_unit_end="text"
					line_start="35"
					line_end="46"
					debug_cte="28_CU4_dg.xml#r-AWyQRoBk 28_CU4_dg.xml#r-AWyQRoBk-e"
					target="_blank"
					rel="noopener noreferrer">CU4,35 – 46</a
				>, ACO I,1,7 S.&nbsp;171,31–172,7 (Dok. 28): „Er [sc. Nestorius] stiftete Caelestius an,
				Schriften gegen den Presbyter Philippus vorzulegen, der ihn beschimpft und wegen der Häresie
				nicht mehr mit ihm verkehren will. In den Schriften stand aber der Vorwurf, dass er
				Manichäer sei. Darauf hat er den Menschen zu einer Versammlung gerufen, und jener kam, wobei
				er tat, was den Regeln entsprach, und bereit war, sich zu verteidigen. Da er aber nichts
				vorzuweisen hatte, machte Caelestius sich davon und erschien nicht in der Versammlung. Da er
				diesen Anlass nicht finden konnte, wich er auf einen anderen aus. Er fragte nämlich: Aus
				welchem Grund hast du eine private Zusammenkunft abgehalten und zu Hause eine Opferhandlung
				vollzogen? Obwohl beinahe der gesamte Klerus sagte: ‚Auch jeder von uns tut dies bei
				Gelegenheit und Bedarf‘, führte er ein Urteil auf Amtsenthebung gegen diesen Menschen
				herbei.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-135">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">135<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-135"
					aria-label="Back to note 135"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Zum Dossier vgl. Anm. zu <a
					href="/edition/vol1/CU4/text?line=47"
					data-type="internal_ref"
					document="CU4"
					doc_unit="text"
					document_end="CU4"
					doc_unit_end="text"
					line_start="47"
					line_end="48"
					debug_cte="28_CU4_dg.xml#r-AWyFsUID 28_CU4_dg.xml#r-AWyFsUID-e"
					target="_blank"
					rel="noopener noreferrer">CU4,47 – 48</a
				> (Dok. 28).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-136">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">136<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-136"
					aria-label="Back to note 136"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Freilich kann eine spätere Datierung nicht gänzlich ausgeschlossen werden. So macht Graumann
				(2002a, S.&nbsp;313f.) darauf aufmerksam, dass Basilius’ Väterliste, in der er Vertreter des
				rechten Glaubens anführt (<a
					href="/edition/vol1/CV143/1?line=18"
					data-type="internal_ref"
					document="CV143"
					doc_unit="1"
					document_end="CV143"
					doc_unit_end="1"
					line_start="18"
					line_end="29"
					debug_cte="20_CV143_dg.xml#r-AWyQSJuG 20_CV143_dg.xml#r-AWyQSJuG-e"
					target="_blank"
					rel="noopener noreferrer">CV143,1,18 – 29</a
				>, ACO I,1,5 S.&nbsp;7,19–28 [Dok. 20]), u.a. auch alle die Namen enthält, die auch Kyrill
				in seiner Schrift <em>Ad dominas</em> heranzieht, woraus Graumann den Schluss zieht,
				Basilius müsse dieses Werk als Ganzes bekannt gewesen sein, zumindest aber habe er Kenntnis
				davon gehabt, welche Väter von Kyrill darin angeführt wurden. Da jedoch die beiden Schriften
				an die Kaiserinnen <em>Ad dominas</em> und <em>Ad augustas</em> das Kaiserhaus wohl erst im
				Oktober oder Anfang November 430 erreicht haben (s. unten S.&nbsp;<a
					href="#page-XLII"
					target="_blank"
					rel="noopener noreferrer">XLII,24 – XLIII,7</a
				>), müsste man, sofern nicht Teile der Schriften schon im Vorfeld öffentlich wurden, von
				einem späteren Entstehungszeitpunkt des <em>Libellus ad Imperatores</em> ausgehen. Nach Graumann
				(ebd.) weisen weitere Namen, die Basilius nennt, zudem darauf, dass er auch die Dokumente der
				römischen Synode vom August 430 kannte, also ebenfalls ein Hinweis auf eine spätere Datierung.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-137">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">137<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-137"
					aria-label="Back to note 137"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CPal35, ACO I,5 S.&nbsp;65 (Dok. 21; CPG 5668).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-138">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">138<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-138"
					aria-label="Back to note 138"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				PL 48, Sp. 182f. Zu Einzelheiten s. auch Anm. zu <a
					href="/edition/vol1/CPal35/text?line=16"
					data-type="internal_ref"
					document="CPal35"
					doc_unit="text"
					document_end="CPal35"
					doc_unit_end="text"
					line_start="16"
					line_end="16"
					debug_cte="21_CPal35_dg.xml#r-AWyQRAhU 21_CPal35_dg.xml#r-AWyQRAhU-e"
					target="_blank"
					rel="noopener noreferrer">CPal35,16</a
				> (Dok. 21).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-139">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">139<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-139"
					aria-label="Back to note 139"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>ACO I,1,8 S.&nbsp;8.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-140">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">140<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-140"
					aria-label="Back to note 140"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				S. oben S.&nbsp;<a href="#page-XXXI" target="_blank" rel="noopener noreferrer"
					>XXXI,10 – XXXII,12</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-141">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">141<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-141"
					aria-label="Back to note 141"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CVer4, ACO I,2 S.&nbsp;14f. (Dok. 22; CPG 5667).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-142">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">142<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-142"
					aria-label="Back to note 142"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <a
					href="/edition/vol1/CVer4/3?line=4"
					data-type="internal_ref"
					document="CVer4"
					doc_unit="3"
					document_end="CVer4"
					doc_unit_end="3"
					line_start="4"
					line_end="8"
					debug_cte="22_CVer4_dg.xml#r-AWyQSxcO 22_CVer4_dg.xml#r-AWyQSxcO-e"
					target="_blank"
					rel="noopener noreferrer">CVer4,3,4 – 8</a
				>, ACO I,2 S.&nbsp;14,35–15,2 (Dok. 22).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-143">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">143<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-143"
					aria-label="Back to note 143"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <a
					href="/edition/vol1/CVer2/3?line=1"
					data-type="internal_ref"
					document="CVer2"
					doc_unit="3"
					document_end="CVer2"
					doc_unit_end="3"
					line_start="1"
					line_end="6"
					debug_cte="30_CVer2_dg.xml#r-AWyQcSPS 30_CVer2_dg.xml#r-AWyQcSPS-e"
					target="_blank"
					rel="noopener noreferrer">CVer2,3,1 – 6</a
				>, ACO I,2 S.&nbsp;7,21–25 (Dok. 30). Zu den Dokumenten des Dossiers vgl. Anm. zu
				<a
					href="/edition/vol1/CU4/text?line=47"
					data-type="internal_ref"
					document="CU4"
					doc_unit="text"
					document_end="CU4"
					doc_unit_end="text"
					line_start="47"
					line_end="48"
					debug_cte="28_CU4_dg.xml#r-AWyFsUID 28_CU4_dg.xml#r-AWyFsUID-e"
					target="_blank"
					rel="noopener noreferrer">CU4,47 – 48</a
				> (Dok. 28).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-144">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">144<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-144"
					aria-label="Back to note 144"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Auch hier gehen die Meinungen auseinander. Price/Graumann (2020, S.&nbsp;97) etwa nennen
				unter Vorbehalt Ende 429 als Entstehungsdatum.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-145">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">145<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-145"
					aria-label="Back to note 145"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV4, ACO I,1,1 S.&nbsp;25–28 (Dok. 23; CPG 5304).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-146">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">146<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-146"
					aria-label="Back to note 146"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>ACO II,1 S.&nbsp;104,14.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-147">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">147<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-147"
					aria-label="Back to note 147"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Hierzu s. oben S.&nbsp;<a href="#page-XXVII" target="_blank" rel="noopener noreferrer"
					>XXVII,9 – XXVIII,3</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-148">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">148<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-148"
					aria-label="Back to note 148"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CV144/4?line=15"
					data-type="internal_ref"
					document="CV144"
					doc_unit="4"
					document_end="CV144"
					doc_unit_end="4"
					line_start="15"
					line_end="18"
					debug_cte="27_CV144_dg.xml#r-AWyQceFE 27_CV144_dg.xml#r-AWyQceFE-e"
					target="_blank"
					rel="noopener noreferrer">CV144,4,15 – 18</a
				>, ACO I,1,5 S.&nbsp;11,25–27 (Dok. 27): „Dennoch kümmerte ich mich gar nicht um das, was
				seinerseits gegen mich ins Werk gesetzt wurde, sondern überließ es Gott, der alles weiß und
				vermag, und schrieb einen weiteren Brief an den Erwähnten […].“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-149">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">149<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-149"
					aria-label="Back to note 149"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CVer2/9?line=1"
					data-type="internal_ref"
					document="CVer2"
					doc_unit="9"
					document_end="CVer2"
					doc_unit_end="9"
					line_start="1"
					line_end="4"
					debug_cte="30_CVer2_dg.xml#r-AWyQcYai 30_CVer2_dg.xml#r-AWyQcYai-e"
					target="_blank"
					rel="noopener noreferrer">CVer2,9,1 – 4</a
				>, ACO I,2 S.&nbsp;9,18–20 (Dok. 30): „Obgleich [unser] Bruder Kyrill behauptet, dass er
				sich schon in zwei Briefen an dich gewendet habe, möchte ich dennoch, dass du nach der
				ersten und zweiten Zurechtweisung von seiner und dieser hier von unserer Seite, die also
				schon die dritte ist, erkennst, dass [...].“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-150">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">150<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-150"
					aria-label="Back to note 150"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV5, ACO I,1,1 S.&nbsp;29–32 (Dok. 24; CPG 5669).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-151">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">151<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-151"
					aria-label="Back to note 151"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				In einer in der <em>Collectio Casinensis</em> überlieferten lateinischen Fassung des
				Schreibens findet sich folgende Datierung:
				<em>Scripta est mense Iunio indictione tertia decima</em> (CCas7,8, ACO I,3 S.&nbsp;26,22), vgl.
				Schwartz (1914b), S.&nbsp;251. Bevan (2016, S.&nbsp;130) äußert ohne nähere Begründung, dass
				Kyrill den Brief des Nestorius bereits im Februar oder März erhielt.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-152">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">152<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-152"
					aria-label="Back to note 152"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CV5/8?line=13"
					data-type="internal_ref"
					document="CV5"
					doc_unit="8"
					document_end="CV5"
					doc_unit_end="8"
					line_start="13"
					line_end="14"
					debug_cte="24_CV5_dg.xml#r-AWyQcnDm 24_CV5_dg.xml#r-AWyQcnDm-e"
					target="_blank"
					rel="noopener noreferrer">CV5,8,13 – 14</a
				>, ACO I,1,1 S.&nbsp;32,14f. (Dok. 24): „Der Kaiserhof ist überaus freudig, da die Lehre in
				hellem Licht erscheint […].“ Vgl. auch die Anm. zu dieser Stelle.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-153">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">153<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-153"
					aria-label="Back to note 153"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				CV166, ACO I,1,6 S.&nbsp;13–106 (Dok. 25; CPG 5217). Price/Graumann (2020, S.&nbsp;42)
				datieren auf den Frühling 430.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-154">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">154<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-154"
					aria-label="Back to note 154"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				S. hierzu unten S.&nbsp;<a href="#page-XXXVI" target="_blank" rel="noopener noreferrer"
					>XXXVI,6 – 12</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-155">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">155<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-155"
					aria-label="Back to note 155"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV165, ACO I,1,6 S.&nbsp;3–13.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-156">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">156<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-156"
					aria-label="Back to note 156"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CPal29, ACO I,5 S.&nbsp;55–60 (Dok. 26).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-157">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">157<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-157"
					aria-label="Back to note 157"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>ACO I,5 S.&nbsp;XIIf.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-158">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">158<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-158"
					aria-label="Back to note 158"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Grillmeier (1979), S.&nbsp;666 Anm. 15.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-159">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">159<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-159"
					aria-label="Back to note 159"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Zur umstrittenen Frage, wie das Dokument einzuordnen ist, insgesamt vgl. auch Konoppa
				(2005), S.&nbsp;294–297.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-160">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">160<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-160"
					aria-label="Back to note 160"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Graumann (2002a), bes. S.&nbsp;318–320 mit Anm. 143.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-161">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">161<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-161"
					aria-label="Back to note 161"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Zu den Dokumenten des Dossiers vgl. auch Anm. zu <a
					href="/edition/vol1/CU4/text?line=47"
					data-type="internal_ref"
					document="CU4"
					doc_unit="text"
					document_end="CU4"
					doc_unit_end="text"
					line_start="47"
					line_end="48"
					debug_cte="28_CU4_dg.xml#r-AWyFsUID 28_CU4_dg.xml#r-AWyFsUID-e"
					target="_blank"
					rel="noopener noreferrer">CU4,47 – 48</a
				> (Dok. 28).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-162">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">162<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-162"
					aria-label="Back to note 162"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV60, CV165 u. CV166 (Dok. 25).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-163">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">163<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-163"
					aria-label="Back to note 163"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Die Bemerkung Kyrills in seinem ersten Brief an Nestorius (<a
					href="/edition/vol1/CV2/3?line=1"
					data-type="internal_ref"
					document="CV2"
					doc_unit="3"
					document_end="CV2"
					doc_unit_end="3"
					line_start="1"
					line_end="6"
					debug_cte="18_CV2_dg.xml#r-AWyPBQlx 18_CV2_dg.xml#r-AWyPBQlx-e"
					target="_blank"
					rel="noopener noreferrer">CV2,3,1 – 6</a
				>, ACO I,1,1 S.&nbsp;24,13–17 [Dok. 18]), er habe brieflich aus Rom erfahren, dass die
				dorthin gelangten Schriften des Nestorius auf Ablehnung gestoßen seien, legt die Vermutung
				nahe, es habe bereits vorher Kontakte zwischen Alexandria und Rom gegeben. Doch existieren
				diesbezüglich keine weiteren Quellen. In
				<a
					href="/edition/vol1/CV144/1?line=14"
					data-type="internal_ref"
					document="CV144"
					doc_unit="1"
					document_end="CV144"
					doc_unit_end="1"
					line_start="14"
					line_end="18"
					debug_cte="27_CV144_dg.xml#r-AWyQdjQN 27_CV144_dg.xml#r-AWyQdjQN-e"
					target="_blank"
					rel="noopener noreferrer">CV144,1,14 – 18</a
				>, ACO I,1,5 S.&nbsp;10,23–26 (Dok. 27) äußert Kyrill zudem Coelestin gegenüber, er wende
				sich nun zum ersten Mal wegen Nestorius an den Papst: „Ich habe daher die vergangene Zeit
				über geschwiegen und überhaupt gar nichts an Deine Frömmigkeit geschrieben über jenen, der
				nun in Konstantinopel sitzt und die Gemeinde verwaltet, und auch nicht an einen anderen
				unter den Mitdienern, da ich der Meinung war, dass Voreiligkeit in dieser Situation nicht in
				dem Bereich läge, der frei von Tadel wäre.“ Zu dieser Frage vgl. auch Anm. zu
				<a
					href="/edition/vol1/CV2/3?line=2"
					data-type="internal_ref"
					document="CV2"
					doc_unit="3"
					document_end="CV2"
					doc_unit_end="3"
					line_start="2"
					line_end="5"
					debug_cte="18_CV2_dg.xml#r-AWyFqKyK 18_CV2_dg.xml#r-AWyFqKyK-e"
					target="_blank"
					rel="noopener noreferrer">CV2,3,2 – 5</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-164">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">164<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-164"
					aria-label="Back to note 164"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV144, ACO I,1,5 S.&nbsp;10–12 (Dok. 27; CPG 5310).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-165">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">165<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-165"
					aria-label="Back to note 165"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. Jaffé (<span class="">3</span>2016–2020, Nr. 826), wo die Zeit von März bis Juni 430
				favorisiert wird, und Price/Graumann (2020, S.&nbsp;42 u. 127), die sich ebenfalls auf den
				Frühling oder Frühsommer 430 festlegen. Auch Bevan (2016, S.&nbsp;130) hat wohl diese
				Zeitspanne im Blick, wenn er sagt: „Cyril’s first letter to Celestine was written only after
				his second letter to Nestorius had been sent, and likely after Cyril had received Nestorius‘
				reply in February or March of 430.“ Zu Bevans Datierung von Nestorius‘ Antwortschreiben (CV5
				[Dok. 24]) s. oben Anm.
				<a href="#ref-151" target="_blank" rel="noopener noreferrer">151</a>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-166">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">166<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-166"
					aria-label="Back to note 166"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Dazu gehört auch, dass Kyrill Nestorius als Anstifter für den öffentlichen Auftritt des
				Dorotheos hinstellt, vgl. hierzu auch oben S.&nbsp;<a
					href="#page-XXVII"
					target="_blank"
					rel="noopener noreferrer">XXVII,9 – XXVIII,3</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-167">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">167<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-167"
					aria-label="Back to note 167"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Zu den Dokumenten des Dossiers vgl. auch Anm. zu <a
					href="/edition/vol1/CU4/text?line=47"
					data-type="internal_ref"
					document="CU4"
					doc_unit="text"
					document_end="CU4"
					doc_unit_end="text"
					line_start="47"
					line_end="48"
					debug_cte="28_CU4_dg.xml#r-AWyFsUID 28_CU4_dg.xml#r-AWyFsUID-e"
					target="_blank"
					rel="noopener noreferrer">CU4,47 – 48</a
				> (Dok. 28).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-168">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">168<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-168"
					aria-label="Back to note 168"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				CV144,6,17–23 ACO I,1,5 S.&nbsp;12,19–23: „Damit Deine Heiligkeit sicher weiß, welche Dinge
				es sind, die er selbst sagt und denkt, und welche unsere seligen und großen Väter, habe ich
				dir Dokumente geschickt, die Abschnitte mit den wichtigsten Punkten enthalten, wobei ich sie
				übersetzen ließ, wie es den Menschen in Alexandria möglich ist. Und die von mir verfassten
				Briefe habe ich dem liebenswerten Poseidonios gegeben mit der Anweisung, auch sie Deiner
				Vollkommenheit zuzuführen.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-169">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">169<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-169"
					aria-label="Back to note 169"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CU4, ACO I,1,7 S.&nbsp;171f. (Dok. 28; CPG 5311).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-170">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">170<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-170"
					aria-label="Back to note 170"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Hierzu s. oben S.&nbsp;<a href="#page-XXXI" target="_blank" rel="noopener noreferrer"
					>XXXI,10 – XXXII,12</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-171">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">171<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-171"
					aria-label="Back to note 171"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Die Frage, ob es sich bei der griechischen oder der lateinischen Version dieser und der
				späteren Briefe Coelestins um die originale Fassung handelt, wird in der Forschung
				kontrovers beantwortet. Der Gedanke liegt nahe, dass der Papst seine Schreiben zunächst
				lateinisch formuliert hat und diese dann entweder noch in Rom oder durch die Empfänger ins
				Griechische übersetzt wurden. Jüngst haben auch Price/Graumann (2020, S.&nbsp;151f. Anm.
				226) in Bezug auf CVer5 (Dok. 31) darauf verwiesen, dass die griechischen Zitate aus dem
				Neuen Testament Übersetzungen der lateinischen sind, diese also nicht dem griechischen
				Bibeltext entnommen wurden, eine Beobachtung, welche die Annahme lateinischer
				Originalfassungen der Briefe unterstützt. Auch für den vorliegenden Band dienen die
				lateinischen Versionen als Textbasis.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-172">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">172<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-172"
					aria-label="Back to note 172"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CVer1, ACO I,2 S.&nbsp;5f. (Dok. 29; CPL 1652, vgl. CPG 8638).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-173">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">173<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-173"
					aria-label="Back to note 173"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				S. <a
					href="/edition/vol1/CVer1/7?line=1"
					data-type="internal_ref"
					document="CVer1"
					doc_unit="7"
					document_end="CVer1"
					doc_unit_end="7"
					line_start="1"
					line_end="12"
					debug_cte="29_CVer1_dg.xml#r-AWyHBANf 29_CVer1_dg.xml#r-AWyHBANf-e"
					target="_blank"
					rel="noopener noreferrer">CVer1,7,1 – 12</a
				>, ACO I,2 S.&nbsp;6,21–28 (Dok. 29): „Nachdem du also die Autorität unseres Stuhles für
				dich in Anspruch genommen hast, sollst du sie an unserer Stelle gebrauchen und diesen
				Urteilsspruch mit Entschiedenheit umsetzen, dass er entweder innerhalb von zehn Tagen, die
				von dem Tag an zu zählen sind, [an dem ihm] dieser Beschluss [bekannt wurde], seine
				verkehrten Predigten in einer schriftlichen Erklärung verurteilt und versichert,
				hinsichtlich der Geburt unseres Gottes Christi an dem Glauben festzuhalten, den auch die
				römische Kirche und die Kirche Deiner Heiligkeit und die allgemeine Frömmigkeit bewahren.
				Oder, wenn er dies nicht tut, möge Deine Heiligkeit wissen, dass sie dann alsbald für jene
				Kirche Sorge tragen und ihn auf jede Art von unserem Leib abtrennen muss, [ihn], der die
				Fürsorge der Ärzte für sich nicht zulassen wollte und der so überaus Verderben bringend in
				seinen eigenen Untergang wie den aller ihm Anvertrauten geeilt ist.“ Der Wortlaut des
				Urteils weicht etwas von den drei anderen ebenfalls voneinander abweichenden Fassungen in
				den anderen Briefen vom 10. August 430 ab: So lautet es in
				<a
					href="/edition/vol1/CVer2/18?line=9"
					data-type="internal_ref"
					document="CVer2"
					doc_unit="18"
					document_end="CVer2"
					doc_unit_end="18"
					line_start="9"
					line_end="17"
					debug_cte="30_CVer2_dg.xml#r-AWyGnGAE 30_CVer2_dg.xml#r-AWyGnGAE-e"
					target="_blank"
					rel="noopener noreferrer">CVer2,18,9 – 17</a
				>, ACO I,2 S.&nbsp;12,6–12 (Dok. 30): „Du [sc. Nestorius] sollst also klar wissen, dass dies
				unser Urteil ist, dass, wenn du nicht über unseren Gott Christus das predigst, woran die
				römische und alexandrinische und die ganze katholische Kirche festhält, wie auch die
				allerheiligste Kirche der Stadt Konstantinopel bis zu dir in vollem Umfang daran
				festgehalten hat, und wenn du nicht diese gottlose Neuerung, die danach trachtet, das zu
				trennen, was die ehrwürdige Schrift verbindet, vor Ablauf des zehnten Tages vom ersten Tag
				an gezählt, an dem dir dieser Beschluss bekannt wird, in einer öffentlichen und
				schriftlichen Erklärung verurteilst, dass du [dann] weißt, dass du aus der Gemeinschaft der
				ganzen katholischen Kirche hinausgeworfen bist“, in
				<a
					href=""
					data-type="internal_ref"
					document=""
					doc_unit=""
					document_end=""
					doc_unit_end=""
					line_start=""
					line_end=""
					debug_cte="31_CVer5_dg.xml#r-AWyGnnKm 31_CVer5_dg.xml#r-AWyGnnKm-e"
					target="_blank"
					rel="noopener noreferrer">CVer5,23,1 – 9</a
				>, ACO I,2 S.&nbsp;20,26–30 (Dok. 31): „Du sollst also öffentlich erfahren, dass dieses
				unser Urteil ist, dass du, wenn du nicht über unseren Gott Christus das darlegst, was die
				römische und die alexandrinische und die ganze katholische Kirche glaubt, so wie es auch die
				Kirche von Konstantinopel bis zu dir, Teuerster, gedacht hat, und wenn du nicht diese
				gottlose Neuerung von der anbetungs- und verehrungswürdigen Schrift entfernst und sie nicht
				innerhalb von zehn Tagen, nachdem dir [dieses Urteil] bekannt geworden ist, wobei der Tag
				seiner Bekanntmachung hinzuzurechnen ist, in einem öffentlichen und schriftlichen Bekenntnis
				verdammst, wirst du von der ganzen katholischen Kirche exkommuniziert werden“, und in
				<a
					href="/edition/vol1/CVer6/5?line=8"
					data-type="internal_ref"
					document="CVer6"
					doc_unit="5"
					document_end="CVer6"
					doc_unit_end="5"
					line_start="8"
					line_end="15"
					debug_cte="32_CVer6_dg.xml#r-AXASCqTE 32_CVer6_dg.xml#r-AXASCqTE-e"
					target="_blank"
					rel="noopener noreferrer">CVer6,5,8 – 15</a
				>, ACO I,2 S.&nbsp;22,12–17 (Dok. 32): „[…] soll [auch] Deine Heiligkeit [sc. Johannes von
				Antiochia u.a.] wissen, dass über eben diesen Nestorius von uns, [oder] vielmehr von
				[unserem] Gott Christus folgendes Urteil gefällt wurde, [nämlich] dass er entweder innerhalb
				von zehn Tagen, die [von dem Tag] an zu rechnen sind, [an dem ihm] der heutige Beschluss
				[bekannt wird], seine gottlosen Predigten über die Geburt Christi in einem schriftlichen
				Bekenntnis verdammen und bekennen solle, dem Glauben zu folgen, den die römische,
				alexandrinische und die ganze Kirche bewahren, oder dass er ausgeschlossen aus der
				Gemeinschaft der Bischöfe erkenne, dass er seinen Untergang [selbst] herbeigeführt hat.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-174">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">174<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-174"
					aria-label="Back to note 174"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <a
					href="/edition/vol1/CVer1/7?line=12"
					data-type="internal_ref"
					document="CVer1"
					doc_unit="7"
					document_end="CVer1"
					doc_unit_end="7"
					line_start="12"
					line_end="14"
					debug_cte="29_CVer1_dg.xml#r-AWyQeQzH 29_CVer1_dg.xml#r-AWyQeQzH-e"
					target="_blank"
					rel="noopener noreferrer">CVer1,7,12 – 14</a
				>, ACO I,2 S.&nbsp;6,28–30 (Dok. 29).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-175">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">175<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-175"
					aria-label="Back to note 175"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV144, ACO I,1,5 S.&nbsp;10–12 (Dok. 27).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-176">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">176<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-176"
					aria-label="Back to note 176"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				CVer2, ACO I,2 S.&nbsp;7–12 (Dok. 30; CPL 1652, vgl. CPG 8639), am 30. November 430 an
				Nestorius übergeben.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-177">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">177<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-177"
					aria-label="Back to note 177"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Wahrscheinlich Flavius Antiochus, <em>praefectus praetorio Orientis</em> 430/1 und Konsul
				des Ostens 431. Dies vermutet schon Schwartz (1914a), S.&nbsp;5 Anm. 3 und ACO I,1,8
				S.&nbsp;8. Vgl. auch Art. Antiochus (7), in: Martindale (1971–1992), Bd. 2 S.&nbsp;103f. u.
				Holum (1982), S.&nbsp;158. Price/Graumann (2020, S.&nbsp;139 Anm. 150) verweisen auf die
				Möglichkeit, dass es sich auch um den <em>praefectus praetorio</em> Illyriens des Jahres 427
				handeln könnte. Zu diesem s. Art. Antiochus (6), in: Martindale (1971–1992), Bd. 2 S.&nbsp;102f.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-178">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">178<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-178"
					aria-label="Back to note 178"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Zum Wortlaut s. oben Anm. <a href="#ref-173" target="_blank" rel="noopener noreferrer"
					>173</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-179">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">179<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-179"
					aria-label="Back to note 179"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				S. hierzu oben S.&nbsp;<a href="#page-XXXVII" target="_blank" rel="noopener noreferrer"
					>XXXVII,8 – XXXVIII,5</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-180">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">180<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-180"
					aria-label="Back to note 180"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CVer5, ACO I,2 S.&nbsp;15–20 (Dok. 31; CPL 1652, vgl. CPG 8640).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-181">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">181<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-181"
					aria-label="Back to note 181"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <a
					href=""
					data-type="internal_ref"
					document=""
					doc_unit=""
					document_end=""
					doc_unit_end=""
					line_start=""
					line_end=""
					debug_cte="31_CVer5_dg.xml#r-AWyQfDVK 31_CVer5_dg.xml#r-AWyQfDVK-e"
					target="_blank"
					rel="noopener noreferrer">CVer5,22,1 – 8</a
				>, ACO I,2 S.&nbsp;20,15–20 (Dok. 31). Zur Stellvertreterfunktion Kyrills s. auch oben
				S.&nbsp;<a href="#page-XXXVII" target="_blank" rel="noopener noreferrer"
					>XXXVII,8 – XXXVIII,5</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-182">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">182<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-182"
					aria-label="Back to note 182"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>S. oben Anm. <a href="#ref-173" target="_blank" rel="noopener noreferrer">173</a>.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-183">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">183<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-183"
					aria-label="Back to note 183"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CVer6, ACO I,2 S.&nbsp;21f. (Dok. 32; CPL 1652, vgl. CPG 8641).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-184">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">184<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-184"
					aria-label="Back to note 184"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CVer6/1?line=3"
					data-type="internal_ref"
					document="CVer6"
					doc_unit="1"
					document_end="CVer6"
					doc_unit_end="1"
					line_start="3"
					line_end="4"
					debug_cte="32_CVer6_dg.xml#r-AWyQfSIk 32_CVer6_dg.xml#r-AWyQfSIk-e"
					target="_blank"
					rel="noopener noreferrer">CVer6,1,3 – 4</a
				>, ACO I,2 S.&nbsp;21,3f. (Dok. 32):
				<em
					>Caelestinus episcopus Iohanni Iuvenali Rufo et Flaviano episcopis per Orientem a pari</em
				>. Vgl. auch die Ankündigung dieser Schreiben im Brief Coelestins an Kyrill (<a
					href="/edition/vol1/CVer1/7?line=12"
					data-type="internal_ref"
					document="CVer1"
					doc_unit="7"
					document_end="CVer1"
					doc_unit_end="7"
					line_start="12"
					line_end="14"
					debug_cte="29_CVer1_dg.xml#r-AWyQeQzH 29_CVer1_dg.xml#r-AWyQeQzH-e"
					target="_blank"
					rel="noopener noreferrer">CVer1,7,12 – 14</a
				>, ACO I,2 S. 6,28–30 [Dok. 29]), s. oben S.
				<a href="#page-XXXVII" target="_blank" rel="noopener noreferrer">XXXVII,8 – XXXVIII,5</a>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-185">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">185<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-185"
					aria-label="Back to note 185"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>S. oben Anm. <a href="#ref-173" target="_blank" rel="noopener noreferrer">173</a>.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-186">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">186<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-186"
					aria-label="Back to note 186"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CVer6/5?line=15"
					data-type="internal_ref"
					document="CVer6"
					doc_unit="5"
					document_end="CVer6"
					doc_unit_end="5"
					line_start="15"
					line_end="18"
					debug_cte="32_CVer6_dg.xml#r-AWyQfXXr 32_CVer6_dg.xml#r-AWyQfXXr-e"
					target="_blank"
					rel="noopener noreferrer">CVer6,5,15 – 18</a
				>, ACO I,2 S.&nbsp;22,17–19 (Dok. 32): „Damit das, was von uns beschlossen wurde, wirksamer
				ausgeführt werde, wollten wir, dass unsere Briefe durch unseren Sohn Poseidonios, den Diakon
				der Kirche Alexandrias, zuverlässig zu Deiner Liebe gelangten.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-187">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">187<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-187"
					aria-label="Back to note 187"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Freilich kann nicht gänzlich ausgeschlossen werden, dass Kyrill die alexandrinische Synode
				aus taktischen Gründen bewusst verschwiegen hat, wie etwa Schwartz (1914b, S.&nbsp;261) es
				für Kyrills Brief an Johannes von Antiochia annimmt.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-188">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">188<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-188"
					aria-label="Back to note 188"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV13, ACO I,1,1 S.&nbsp;92f. (Dok. 33; CPG 5313).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-189">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">189<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-189"
					aria-label="Back to note 189"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Das Zitat zu dieser Stelle findet sich oben Anm. <a
					href="#ref-117"
					target="_blank"
					rel="noopener noreferrer">117</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-190">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">190<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-190"
					aria-label="Back to note 190"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				S. hierzu auch oben S.&nbsp;<a href="#page-XXXVII" target="_blank" rel="noopener noreferrer"
					>XXXVII,8 – XXXVIII,5</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-191">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">191<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-191"
					aria-label="Back to note 191"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV15, ACO I,1,1 S.&nbsp;41f. (Dok. 34; CPG 5316).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-192">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">192<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-192"
					aria-label="Back to note 192"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CV14/2?line=4"
					data-type="internal_ref"
					document="CV14"
					doc_unit="2"
					document_end="CV14"
					doc_unit_end="2"
					line_start="4"
					line_end="9"
					debug_cte="35_CV14_dg.xml#r-AWyQfwtN 35_CV14_dg.xml#r-AWyQfwtN-e"
					target="_blank"
					rel="noopener noreferrer">CV14,2,4 – 9</a
				>, ACO I,1,1 S.&nbsp;93,20–24 (Dok. 35): „[…] sah ich mich daher gedrängt, das, was uns
				neulich aus Rom und Alexandria geschrieben worden ist, Deiner Heiligkeit bekannt zu machen.
				Es kamen nämlich auf einmal Kleriker aus Alexandria hierher und haben uns verschiedene
				Briefe übergeben, die unter Bezug auf Deine Gottesliebe abgesandt worden waren, zum einen
				den des überaus heiligen Bischofs Coelestin, zum anderen die des überaus gottgefälligen
				Bischofs Kyrill. Deren Abschriften schicke ich […].“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-193">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">193<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-193"
					aria-label="Back to note 193"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				CV14, ACO I,1,1 S.&nbsp;93–96 (Dok. 35; CPG 6316). Dieses Schreiben müsste als Reaktion des
				Johannes von Antiochia auf den Erhalt der Briefe Kyrills und Coelestins gemäß den
				Ordnungskriterien eigentlich direkt hinter CV13 (Dok. 33) erscheinen. Da jedoch auch CV13
				und CV15 (Dok. 34) als eine Einheit zu sehen sind, wurde CV14 den beiden nachgeordnet.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-194">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">194<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-194"
					aria-label="Back to note 194"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. hierzu auch Anm. zu <a
					href="/edition/vol1/CV14/2?line=8"
					data-type="internal_ref"
					document="CV14"
					doc_unit="2"
					document_end="CV14"
					doc_unit_end="2"
					line_start="8"
					line_end="9"
					debug_cte="35_CV14_dg.xml#r-AWyQgGPf 35_CV14_dg.xml#r-AWyQgGPf-e"
					target="_blank"
					rel="noopener noreferrer">CV14,2,8 – 9</a
				> (Dok.35).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-195">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">195<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-195"
					aria-label="Back to note 195"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Zu dieser <em>sacra</em>, mit der der Kaiser das Konzil von Ephesus einberief, s. unten
				S.&nbsp;<a href="#page-XLIII" target="_blank" rel="noopener noreferrer">XLIII,8 – 14</a>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-196">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">196<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-196"
					aria-label="Back to note 196"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				CV6, ACO I,1,1 S.&nbsp;33–42 (Dok. 36; CPG 5317). Seiner Übersetzung des Briefes CV6 ins
				Lateinische hat Dionysius Exiguus eine <em>Praefatio</em> vorangestellt (CD.E., ACO I,5
				S.&nbsp;235f.). Eine Übersetzung dieser <em>Praefatio</em> ins Deutsche findet sich in Anm.
				zu
				<a
					href="/edition/vol1/CV6/1?line=1"
					data-type="internal_ref"
					document="CV6"
					doc_unit="1"
					document_end="CV6"
					doc_unit_end="1"
					line_start="1"
					line_end="2"
					debug_cte="36_CV6_dg.xml#r-AWyLFnIo 36_CV6_dg.xml#r-AWyLFnIo-e"
					target="_blank"
					rel="noopener noreferrer">CV6,1,1 – 2</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-197">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">197<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-197"
					aria-label="Back to note 197"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Zu den Anathematismen vgl. auch Anm. zu <a
					href="/edition/vol1/CV6/12?line=4"
					data-type="internal_ref"
					document="CV6"
					doc_unit="12"
					document_end="CV6"
					doc_unit_end="12"
					line_start="4"
					line_end="5"
					debug_cte="36_CV6_dg.xml#r-AWyQkBuS 36_CV6_dg.xml#r-AWyQkBuS-e"
					target="_blank"
					rel="noopener noreferrer">CV6,12,4 – 5</a
				> (Dok. 36).
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-198">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">198<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-198"
					aria-label="Back to note 198"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Die beiden lateinischen Versionen des Briefes sind mit einer Datumsangabe versehen, s.
				CVer17,12, ACO I,2 S.&nbsp;51,33: <em>Data mense Novembrio die XXX indictione XIIII</em> und
				CCas8,12, ACO I,3 S.&nbsp;35,16: <em>Dat[a] mens. Novemb. die XXX indict. XIIII</em>. Schon
				Schwartz verweist jeweils in einer Fußnote zur Stelle darauf, dass es sich hier nicht um das
				Abfassungsdatum des Briefes, sondern um das Datum seiner Übergabe an Nestorius handeln muss.
				Als Beleg führt er eine Überschrift an, die <em>sermo</em> 18 des Nestorius (CPal23, ACO I,5
				S.&nbsp;39, 19–22) vorangestellt ist: „Ebenso die Predigt desselben, die er in der Kirche hielt,
				nachdem er die Briefe mit der Androhung des römischen Bischofs Coelestin und des alexandrinischen
				[Bischofs] Kyrill empfangen hatte, am achten [Tag] vor den Iden des Dezembers unter dem dreizehnten
				Konsulat des [Augustus] Theodosius und dem dritten des Augustus Valentinian, am sechsten Tag
				nach Erhalt dieser Briefe.“ Vgl. auch die Ausführungen von Schwartz (1914b), S.&nbsp;261f. Anm.
				2. Zur Übergabe von CV6 zusammen mit dem Schreiben Coelestins an Nestorius (CVer2 [Dok. 30])
				vgl. CV49–50, ACO I,1,2 S.36,26–37,22.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-199">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">199<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-199"
					aria-label="Back to note 199"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Zu der <em>sacra</em>, mit der der Kaiser das Konzil von Ephesus einberief, s. unten
				S.&nbsp;<a href="#page-XLIII" target="_blank" rel="noopener noreferrer">XLIII,8 – 14</a>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-200">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">200<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-200"
					aria-label="Back to note 200"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				In <a
					href="/edition/vol1/CV24/text?line=7"
					data-type="internal_ref"
					document="CV24"
					doc_unit="text"
					document_end="CV24"
					doc_unit_end="text"
					line_start="7"
					line_end="9"
					debug_cte="37_CV24_dg.xml#r-AWyQkhxW 37_CV24_dg.xml#r-AWyQkhxW-e"
					target="_blank"
					rel="noopener noreferrer">CV24,7 – 9</a
				>, ACO I,1,1 S.&nbsp;113,7–9: „Der Bischof Kyrill und die Synode, die in Alexandria aus der
				ägyptischen Diözese zusammengekommen ist, grüßen die geliebten und ersehnten Presbyter und
				Diakone und das Volk von Konstantinopel im Herrn“, und
				<a
					href="/edition/vol1/CV24/text?line=20"
					data-type="internal_ref"
					document="CV24"
					doc_unit="text"
					document_end="CV24"
					doc_unit_end="text"
					line_start="20"
					line_end="30"
					debug_cte="37_CV24_dg.xml#r-AWyQkmFE 37_CV24_dg.xml#r-AWyQkmFE-e"
					target="_blank"
					rel="noopener noreferrer">CV24,20 – 30</a
				>, S.&nbsp;113,17–25: „Da wir aber […] herausgefunden haben, dass er in die Irre geht und
				sich im Hinblick auf den Glauben in nicht unbeträchtlichem Maße gottlos verhält, sind wir
				schließlich notgedrungen dahin gekommen, ihm durch ein synodales Schreiben bescheinigen zu
				müssen, dass […] er keinen Ort der Gemeinschaft mit den Priestern Gottes habe, sondern allen
				fremd sein soll“, und in
				<a
					href="/edition/vol1/CV145/text?line=2"
					data-type="internal_ref"
					document="CV145"
					doc_unit="text"
					document_end="CV145"
					doc_unit_end="text"
					line_start="2"
					line_end="4"
					debug_cte="38_CV145_dg.xml#r-AWyQkvse 38_CV145_dg.xml#r-AWyQkvse-e"
					target="_blank"
					rel="noopener noreferrer">CV145,2 – 4</a
				>, ACO I,1,5 S.&nbsp;12,26–28: „Kyrill und die heilige Synode, die in Alexandria
				zusammengetreten ist, grüßen die überaus frommen und gottesfürchtigen Väter der Klöster im
				großen Konstantinopel im Herrn“, und
				<a
					href="/edition/vol1/CV145/text?line=24"
					data-type="internal_ref"
					document="CV145"
					doc_unit="text"
					document_end="CV145"
					doc_unit_end="text"
					line_start="24"
					line_end="26"
					debug_cte="38_CV145_dg.xml#r-AWyQkzgt 38_CV145_dg.xml#r-AWyQkzgt-e"
					target="_blank"
					rel="noopener noreferrer">CV145,24 – 26</a
				>, S.&nbsp;13,8–10: „[…] hielten wir es für richtig, dass er, ermahnt durch dieses dritte
				Schreiben, welches von uns und unserem überaus heiligen und gottesfürchtigen Bruder und
				Mitdiener Coelestin, dem Bischof des großen Roms, abgesandt wurde […].“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-201">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">201<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-201"
					aria-label="Back to note 201"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV24, ACO I,1,1 S.&nbsp;113f. (Dok. 37; CPG 5318).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-202">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">202<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-202"
					aria-label="Back to note 202"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV145, ACO I,1,5 S.&nbsp;12f. (Dok. 38; CPG 5319).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-203">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">203<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-203"
					aria-label="Back to note 203"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. hierzu Kinzig (2016), bes. S.&nbsp;CXII–CXV.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-204">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">204<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-204"
					aria-label="Back to note 204"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>Vgl. oben Anm. <a href="#ref-152" target="_blank" rel="noopener noreferrer">152</a>.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-205">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">205<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-205"
					aria-label="Back to note 205"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Über den Abfassungszeitpunkt dieser Schriften herrscht in der Forschung im Wesentlichen
				Einigkeit. Nach Holum (1982, S.&nbsp;159f.) wurden die Abhandlungen im Spätsommer oder
				Herbst des Jahres 430 verfasst, nach Bevan (2016) wurde CV7 im Sommer geschrieben (S. 126),
				alle drei Schriften bis zum Herbst (S. 134), nach Graumann (2002a, S.&nbsp;323) entstanden
				die Schriften „im Spätsommer oder Herbst des Jahres 430“ und nach Price/Graumann (2020,
				S.&nbsp;200 Anm. 373) im Herbst 430.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-206">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">206<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-206"
					aria-label="Back to note 206"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				S. unten S.&nbsp;<a href="#page-XLIII" target="_blank" rel="noopener noreferrer"
					>XLIII,15 – XLIV,6</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-207">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">207<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-207"
					aria-label="Back to note 207"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				CV7, ACO I,1,1 S.&nbsp;42–72 (Dok. 39; CPG 5218). Obwohl die Schrift offiziell an den Kaiser
				adressiert ist, äußert Kyrill an etwas späterer Stelle, dass sie auch an die Kaiserinnen
				gerichtet sei (<a
					href="/edition/vol1/CV7/4?line=4"
					data-type="internal_ref"
					document="CV7"
					doc_unit="4"
					document_end="CV7"
					doc_unit_end="4"
					line_start="4"
					line_end="11"
					debug_cte="39_CV7_dg.xml#r-AWyOCpkH 39_CV7_dg.xml#r-AWyOCpkH-e"
					target="_blank"
					rel="noopener noreferrer">CV7,4,4 – 11</a
				>, ACO I,1,1 S.&nbsp;44,15–21): „[…] fühle ich mich notgedrungen bemüßigt, die Überlieferung
				des rechten und apostolischen Glaubens in diesem Buch aufzuschreiben und Eurer Herrschaft
				als gleichsam geistiges Gastgeschenk zu überreichen und ebenso den wahrhaft gottgefälligsten
				Kaiserinnen, die zusammen mit Eurer Friedfertigkeit strahlen: Die eine jubelt über die von
				euch innigst erflehten Nachkommen und trägt dem Zepter die Hoffnung auf immerwährenden
				Fortbestand zu, die andere steht zusammen mit den jungfräulichen Sprossen in Blüte und
				eignet sich die Sorge um euer überaus ruhmreiches Reich an.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-208">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">208<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-208"
					aria-label="Back to note 208"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV150, ACO I,1,5 S.&nbsp;62–118 (Dok. 40; CPG 5219).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-209">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">209<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-209"
					aria-label="Back to note 209"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				CV149, ACO I,1,5 S.&nbsp;26–61 (Dok. 41; CPG 5220). Zur Frage, wer genau sich hinter den
				Adressatinnen in <em>Ad dominas</em> und <em>Ad augustas</em> verbirgt, vgl. Anm. zu
				<a
					href=""
					data-type="internal_ref"
					document=""
					doc_unit=""
					document_end=""
					doc_unit_end=""
					line_start=""
					line_end=""
					debug_cte="40_CV150_dg.xml#r-AWyLHhaD 40_CV150_dg.xml#r-AWyLHhaD-e"
					target="_blank"
					rel="noopener noreferrer">CV150,1,3</a
				>
				(Dok. 40) und zu
				<a
					href="/edition/vol1/CV149/1?line=10"
					data-type="internal_ref"
					document="CV149"
					doc_unit="1"
					document_end="CV149"
					doc_unit_end="1"
					line_start="10"
					line_end="2"
					debug_cte="41_CV149_dg.xml#r-AWyLHUjl 41_CV149_dg.xml#r-AWyLHUjl-e"
					target="_blank"
					rel="noopener noreferrer">CV149,1,1 – 2</a
				>.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-210">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">210<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-210"
					aria-label="Back to note 210"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV25, ACO I,1,1 S.&nbsp;114–116 (Dok. 42; CPG 8651).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-211">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">211<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-211"
					aria-label="Back to note 211"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>D.h. zum 7. Juni 431.</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-212">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">212<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-212"
					aria-label="Back to note 212"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CV25/2?line=8"
					data-type="internal_ref"
					document="CV25"
					doc_unit="2"
					document_end="CV25"
					doc_unit_end="2"
					line_start="8"
					line_end="17"
					debug_cte="42_CV25_dg.xml#r-AWyQlrJq 42_CV25_dg.xml#r-AWyQlrJq-e"
					target="_blank"
					rel="noopener noreferrer">CV25,2,8 – 17</a
				>, ACO I,1,1 S.&nbsp;115,19–26 (Dok. 42): „Damit das, was sich bei der vorliegenden Prüfung
				des in diesem Falle Angebrachten ergeben hat, indem es vernachlässigt wird, keinen Ausschlag
				zum Schlechteren bewirkt, was der Frömmigkeit unserer Zeiten fremd ist, soll Deine
				Gottesfurcht dafür Sorge tragen, so Gott will, nach dem kommenden heiligen Osterfest am Tage
				des heiligen Pfingstfestes in der Stadt Ephesus in Asien zu erscheinen. Und sie soll
				Vorbereitungen dafür treffen, dass einige auserwählte überaus heilige Bischöfe aus der ihr
				untergeordneten Provinz ebenda zusammenkommen, so dass es sowohl an jenen, die in dieser
				Provinz den überaus heiligen Gemeinden Dienste leisten, als auch an jenen, die für die
				Synode nützlich sind, keinesfalls mangelt.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-213">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">213<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-213"
					aria-label="Back to note 213"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. <a
					href="/edition/vol1/CV8/5?line=1"
					data-type="internal_ref"
					document="CV8"
					doc_unit="5"
					document_end="CV8"
					doc_unit_end="5"
					line_start="1"
					line_end="2"
					debug_cte="43_CV8_dg.xml#r-AWyQmJpV 43_CV8_dg.xml#r-AWyQmJpV-e"
					target="_blank"
					rel="noopener noreferrer">CV8,5,1 – 2</a
				>, ACO I,1,1 S.&nbsp;74,17f. (Dok. 43): „Daher soll Deine Frömmigkeit zu jenem Termin
				erscheinen, den das andere Schreiben eröffnet, welches an alle Bischöfe der Metropolen
				versandt worden ist […].“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-214">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">214<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-214"
					aria-label="Back to note 214"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV8, ACO I,1,1 S.&nbsp;73f. (Dok. 43; CPG 8652).</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-215">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">215<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-215"
					aria-label="Back to note 215"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				<a
					href="/edition/vol1/CV8/3?line=2"
					data-type="internal_ref"
					document="CV8"
					doc_unit="3"
					document_end="CV8"
					doc_unit_end="3"
					line_start="2"
					line_end="10"
					debug_cte="43_CV8_dg.xml#r-AWyQmRkH 43_CV8_dg.xml#r-AWyQmRkH-e"
					target="_blank"
					rel="noopener noreferrer">CV8,3,2 – 10</a
				>, ACO I,1,1 S.&nbsp;73,20–25 (Dok. 43): „Du sollst allerdings wissen, dass du alles [so] in
				Bewegung versetzt hast, wie es nicht hätte sein dürfen. Und es ist nicht bewundernswert,
				wenn jemand, weil er das Maß überschritten hat, sein Vorhaben nicht auf die Gemeinden und
				Mitpriester beschränkt, sondern sogar über uns selbst etwas denkt, was unserer Frömmigkeit
				nicht würdig ist. Oder welchen Grund hatte es, das eine an uns und die überaus fromme
				Augusta Eudokia, meine Gattin, zu schreiben, das andere aber an meine Schwester, die überaus
				fromme Augusta Pulcheria? Du glaubtest entweder, dass wir unterschiedlicher Meinung seien,
				oder hofftest, dass wir aufgrund der Schriften Deiner Gottesfurcht zu unterschiedlichen
				Meinungen kämen.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-216">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">216<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-216"
					aria-label="Back to note 216"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Überliefert in der <em>Collectio Casinensis</em>, ACO I,3 und I,4. Zu Rusticus und seinem
				Synodicon s. aus jüngster Zeit Price/Graumann (2020), S.&nbsp;5–9.
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-217">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">217<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-217"
					aria-label="Back to note 217"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>
				Vgl. CCas20 (Vorbemerkung), ACO I,3 S.&nbsp;47,9–13, vgl. Anm. zu <a
					href="/edition/vol1/CV8/text?line=23"
					data-type="internal_ref"
					document="CV8"
					doc_unit="text"
					document_end="CV8"
					doc_unit_end="text"
					line_start="23"
					line_end="23"
					debug_cte="43_CV8_dg.xml#r-AWyQmXQE 43_CV8_dg.xml#r-AWyQmXQE-e"
					target="_blank"
					rel="noopener noreferrer">CV8T,0</a
				>: „Als der Gotteslästerer [sc. Nestorius] erkannte, dass der Erzbischof Kyrill es nicht
				duldete, dass die Kirchen so in Unruhe versetzt und die Völker durch Predigten dieser Art
				verführt wurden, richtete er es ein, dass der frömmste Kaiser, an dessen Amtsgewalt er sich
				heranschlich, diesem eine mit Brandmalen angefüllte <em>sacra</em> bestimmte, weil er glaubte,
				kraft dessen [sc. des Kaisers] Heiligkeit seiner Verschwiegenheit aushändigen [zu können], was
				eben dem Häretiker Nestorius zum Vorteil ist.“
			</p>
			<!---->
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-1" id="note-218">
			<p class="s-Q0jtzNDKPuIC text-right">
				<sup class="s-Q0jtzNDKPuIC">218<!----></sup>
				<a
					class="back-link s-Q0jtzNDKPuIC inline-block"
					title="Back to note"
					href="#ref-218"
					aria-label="Back to note 218"
					><!----><svg
						xmlns="http://www.w3.org/2000/svg"
						width="24"
						height="24"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
						class="lucide-icon lucide lucide-arrow-up"
						><!----><path d="m5 12 7-7 7 7"></path><!----><path d="M12 19V5"
						></path><!----><!----><!----></svg
					><!----></a
				>
			</p>
		</div>
		<div class="s-Q0jtzNDKPuIC col-span-1 col-start-2">
			<p>CV23, ACO I,1,1 S.&nbsp;112 (Dok. 44; CPG 8653</p>
			<!---->
		</div>
		<!---->
	</div>
	<!--]--><!---->
</div>

<style>
	@reference "tailwindcss";
	@reference "@skeletonlabs/skeleton";

	.maintext :global(.note-ref) {
		@apply text-secondary-500;
	}
	.footnotes :global(a) {
		@apply text-secondary-500;
	}
</style>
