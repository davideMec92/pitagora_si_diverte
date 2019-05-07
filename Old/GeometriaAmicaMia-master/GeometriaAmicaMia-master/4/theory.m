
Print[TextCell["L'opera \"Elementi\"", "Subsection"]];

Print[TextCell[
   "Negli Elementi di Euclide fu raccolto tutto il sapere matematico dell\[CloseCurlyQuote]epoca. I 13 libri non sono un\[CloseCurlyQuote]opera originale, cio\[EGrave] Euclide non fu l\[CloseCurlyQuote]autore dei risultati qui raggiunti, ma organizzo' in un sistema logico e completo tutto quanto era stato scoperto fino ad allora nel campo della matematica.", "Text", 
   TextJustification -> 1]] ;

Print[TextCell[
   Row[{"Euclide tratto' nei primi libri i \"Termini\", ovvero delle definizioni, a seguire introdusse cinque ", Tooltip[Style["postulati", "Text", Brown, Bold],
"Un postulato e' una proposizione che, senza essere stata dimostrata viene considerata vera.", 
TooltipStyle -> {Background -> RGBColor[1, 1, 0.85]}]," e una serie di ", Tooltip[Style["nozioni comuni", "Text", Brown, Bold],
"Oggi chiamati assiomi ossia proposizioni o un principi che sono considerati veri perche' ritenuti evidenti o forniscono il punto di partenza di un quadro teorico di riferimento.", 
TooltipStyle -> {Background -> RGBColor[1, 1, 0.85]}], " utili. I restanti libri un grosso numero di ", Tooltip[Style["teoremi", "Text", Brown, Bold],
"Un teorema e' una proposizione dimostrata logicamente a partire da postulati o assiomi o da altre proposizioni gia' dimostrate.", 
TooltipStyle -> {Background -> RGBColor[1, 1, 0.85]}], " e ", Tooltip[Style["corollari", "Text", Brown, Bold],
"Un corollario e' l'immediata conseguenza di un teorema o una proposizione precedentemente dimostrati.", 
TooltipStyle -> {Background -> RGBColor[1, 1, 0.85]}], ", formando una raccolta a 360 gradi."}], "Text", 
   TextJustification -> 1]] ;

Print[TextCell[
   "Gli Elementi di Euclide offrono un\[CloseCurlyQuote]esposizione logicamente ordinata (cio\[EGrave] tutto \[EGrave] dimostrato a partire da concetti precedentemente enunciati e dimostrati) che comprende le parti fondamentali della geometria e dell\[CloseCurlyQuote]aritmetica, cio\[EGrave] quelle nozioni matematiche che stanno a base di ogni superiore sviluppo.", "Text", TextJustification -> 1]] ;



Print[TextCell["Definizioni", "Subsection"]];

CellPrint[{TextCell[Row[{"Un punto \[EGrave] ci\[OGrave] che non ha parti."}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Una linea \[EGrave] una lunghezza senza larghezza."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Gli estremi di una linea sono punti."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Una retta \[EGrave] una linea che giace ugualmente rispetto ai punti su di essa."}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Una superficie \[EGrave] ci\[OGrave] che ha soltanto lunghezza e larghezza."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Gli estremi di una superficie sono linee."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Una superficie piana \[EGrave] quella che giace ugualmente rispetto alle rette su di essa."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Un angolo piano \[EGrave] l'inclinazione reciproca di due linee in un piano le quali, si incontrino e non giacciano in linea retta."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Quando le linee che comprendono l'angolo sono rette, l'angolo \[EGrave] detto rettilineo."}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Quando una retta innalzata a partire da un'altra retta forma con essa angoli adiacenti uguali fra loro, ciascuno dei due angoli \[EGrave] retto, e la retta si dice perpendicolare a quella su cui \[EGrave] innalzata."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Dicesi angolo ottuso l'angolo maggiore di un angolo retto."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Dicesi acuto l'angolo minore di un angolo retto."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Dicesi termine \[EGrave] ci\[OGrave] che \[EGrave] estremo di qualche cosa."}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Dicesi figura e' cio' che e' compreso da uno o piu' termini."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Dicesi cerchio una figura piana delimitata da un'unica linea tale che tutte le rette che terminano su di essa a partire da un medesimo punto fra quelli interni alla figura, siano uguali fra loro."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Quel punto si chiama centro del cerchio."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Dicesi diametro del cerchio e' una retta condotta per il centro e terminata da ambedue le parti dalla circonferenza del cerchio, la quale retta taglia anche il cerchio per meta'."}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Dicesi semicerchio e' la figura compresa dal diametro e dalla circonferenza da esso tagliata. E centro del semicerchio e' quello stesso che e' anche centro del cerchio."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Dicesi rettilinee le figure delimitate da rette, vale a dire: figure trilatere quelle comprese da tre rette, quadrilatere quelle comprese da quattro rette e multilatere quelle comprese da piu' di quattro rette."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Dicesi triangolo equilatero la figura trilatera che ha i tre lati uguali, triangolo isoscele quella che ha soltanto due lati uguali, e scaleno quella che ha i tre lati disuguali."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Dicesi inoltre triangolo rettangolo la figura trilatera che ha un angolo retto, triangolo ottusangolo quella che ha un angolo ottuso, e triangolo acutangolo quella che ha i tre angoli acuti."}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Dicesi quadrato la figura quadrilatera che ha i lati uguali e gli angoli retti."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Diconsi parallele rette giacenti nello stesso piano che, prolungate illimitatamente in entrambe le direzioni, non si incontrino fra loro da nessuna delle due parti."}], {"Item"}]}];


Print[TextCell["Postulati", "Subsection"]];

CellPrint[{TextCell[Row[{"E' possibile condurre una linea retta da un qualsiasi punto ad ogni altro punto."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"E' possibile prolungare illimitatamente una retta finita in linea retta."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"E' possibile descrivere un cerchio con qualsiasi centro e distanza (raggio) qualsiasi."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Tutti gli angoli retti sono uguali fra loro."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Se (in un piano) una retta, intersecando due altre rette, forma con esse, da una medesima parte, angoli interni la cui somma \[EGrave] minore di due angoli retti, allora queste due rette indefinitamente prolungate finiscono con l'incontrarsi dalla parte detta."}], {"Item"}]}];


Print[TextCell["Nozioni comuni", "Subsection"]];

CellPrint[{TextCell[Row[{"Cose uguali a un'altra medesima sono tra loro uguali."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Se a cose uguali si aggiungono cose uguali, allora si ottengono cose uguali."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Se da cose uguali si tolgono cose uguali, allora si ottengono cose uguali."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Cose che possono essere portate a sovrapporsi l'una con l'altra sono uguali tra loro."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Il tutto \[EGrave] maggiore della parte."}], {"Item"}]}];
