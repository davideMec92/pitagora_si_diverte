(* ::Package:: *)

Print[TextCell[
   "E' possibile misurare l'altezza di un monumento senza salirci sopra? Talete e' stato il primo a riuscirci nel VI secolo a.C.. Si racconta in proposito che, durante un viaggio in Egitto, egli trovo' un metodo semplice e pratico per misurare l'altezza della piramide di Cheope, suscitando stupore e ammirazione tra gli abitanti di quel paese.", "Text", TextJustification -> 1]];

background = Import[FileNameJoin[{NotebookDirectory[], directoryNumber, "piramide.png"}]];
sicon = Import[FileNameJoin[{NotebookDirectory[], directoryNumber, "sun.png"}]];
man = Import[FileNameJoin[{NotebookDirectory[], directoryNumber, "man.png"}]];

(*
	Modulo per l'esempio che spiega come calcolare facilmente l'altezza di un monumento, come le piramidi
	
	E' stato adottato un manipulate per permettare all'utente di cambiare dinamicamente la posizione
	del sole, in modo da mostrare come varia la lunghezza dell'obra proiettata
*)
Print[
	DynamicModule[
 	{
	 	(* cima della piramide *)
	 	pyrTop = {-27.5, 5.5}, 
	 	(* base della piramide *)
	 	pyrBottom = {-27.5, -18.6},
	 	
	 	(* cima del bastone *)
	   	basTop = {20, -13}, 
	   	(* base del bastone*)
	   	basBottom = {20, -25}
   	}, 
   	
	 Manipulate[
	  Graphics[
	   {
	   	(* colore di sfondo e immagine *)
	    LightBlue, Rectangle[{-50, -35}, {50, 35}],
	    Black, Inset[background, {-50, -35}, {0, 0}, 100],
	    
	    (* disegna l'ombra della piramide *)
	    Disk[pyrTop, 0.3],
	    Disk[pyrBottom, 0.3],
	    {Dashed, Line[{pyrTop, pyrBottom}]},
	    Disk[{ ((-19 - sun[[2]]) / (5.5 - sun[[2]])) * (pyrBottom[[1]] - 
	          sun[[1]]) + sun[[1]], -19}, 0.3],
	    {RGBColor[0, 0., 0.01, 0.43], 
	     Triangle[{pyrTop, 
	       pyrBottom,  {((-19 - sun[[2]]) / (5.5 - sun[[2]])) * (-27.5 - 
	            sun[[1]]) + sun[[1]], -19}}]},
	    
	    (* disegna l'ombra del bastone *)
	    {Thick, Line[{basBottom, basTop}]},
	    {RGBColor[0, 0., 0.01, 0.43], 
	     Triangle[{basTop, 
	       basBottom,  {(20 * (5.5 - sun[[2]]) / (-27.5 - sun[[1]]) - 
	           12) / ((5.5 - sun[[2]]) / (-27.5 - sun[[1]])), -25}}]},
	    
	    (* calcolo e visualizzazione dell'angolo formato dall'ombra col piano terrestre e lo riporta sotto la piramide *)
	    Translate[
	     Text[Style[
	       "P = " <> ToString[
	         NumberForm[
	          N[ArcTan[
	             23.1 / Abs[
	               pyrBottom[[
	                 1]] - (((-19 - sun[[2]]) / (5.5 - 
	                    sun[[2]])) * (pyrBottom[[1]] - sun[[1]]) + 
	                  sun[[1]])]] / Degree], 3]] <> "\[Degree]", 
	       "Subsection", White, 
	       Bold], { ((-19 - sun[[2]]) / (5.5 - 
	             sun[[2]])) * (pyrBottom[[1]] - sun[[1]]) + 
	        sun[[1]], -19}], {0, -2}],
	    
	    (* calcolo e visualizzazione dell'angolo formato dall'ombra col piano terrestre e lo riporta sotto il bastone *)
	    Translate[
	     Text[Style[
	       "P' = " <> 
	        ToString[
	         NumberForm[
	          N[ArcTan[
	             23.1 / Abs[
	               pyrBottom[[1]] - (((-19 - sun[[2]]) / (5.5 - 
	                    sun[[2]])) * (pyrBottom[[1]] - sun[[1]]) + 
	                  sun[[1]])]] / Degree], 3]] <> "\[Degree]", 
	       "Subsection", White, 
	       Bold], { (20 * (5.5 - sun[[2]]) / (-27.5 - sun[[1]]) - 
	          12) / ((5.5 - sun[[2]]) / (-27.5 - 
	            sun[[1]])), -25}], {0, -2}],
	    
	    (* altre icone varie e etichette *)
	    Translate[Inset[sicon, sun, {0, 0}, 10], {-5, -5}],
	    Inset[man, {14, -25}, {0, 0}, 5],
	    Text[Style["h", "Subsection", White, Bold], {-29, -8}]
	    
	    }, PlotRange -> {{-50, 50}, {-35, 35}}, ImageSize -> {700, 500}, 
	   ImagePadding -> None, Frame -> None],
	  {{sun, {-40, 25}}, Locator}
	  ]
	 ]
];

Print[TextCell["I passaggi", "Subsection"]];

CellPrint[{TextCell[
    Row[{"Si pianta verticalmente un bastone nel terreno, in modo che il bastone, il raggio solare che passa per la cima di esso e l'ombra proiettata dal bastone formino un triangolo rettangolo;"}], \
{"Item"}]}];

CellPrint[{TextCell[
    Row[{"Si aspetta che il sole proietti l'ombra del bastone di una lunghezza pari all'altezza del bastone stesso formando cosi' un triangolo rettangolo isoscele, questo vuol dire che i raggi solari formavano angoli di 45 gradi col suolo (perche' un triangolo isoscele rettangolo ha i due angoli opposti ai lati congruenti di 45 gradi ciascuno);"}], \
{"Item"}]}];

CellPrint[{TextCell[
    Row[{"Poiche' Talete assume che i raggi solari arrivano paralleli sulla Terra, anche il raggio di sole che
passa per la cima della piramide formera' col terreno un angolo di 45 gradi;"}], \
{"Item"}]}];

CellPrint[{TextCell[
    Row[{"Il triangolo che ha per lati l'altezza della piramide, il raggio di sole che passa per la sommita' di questa e l'ombra proiettata e' simile, per il primo criterio di similitudine, a quello formato dal bastone, il raggio di sole che passa per la sua cima e l'ombra proiettata;"}], {"Item"}]}];

Print[TextCell[
   Row[{"\[Implies] Si ricava che il lati dei due triangoli sono ", Tooltip[Style["tra loro proporzionali", "Text", Brown, Bold],
"Diremo che due grandezze A e B sono direttamente proporzionali (o semplicemente proporzionali) quando il loro rapporto e' costante, ossia B/A=K. In particolare, dati due triangoli ABC e A'B'C' diremo che i lati corrispondenti sono proporzionali se AB/A'B'=AC/A'C'=BC/B'C', ossia il rapporto tra i lati corrispondenti e' lo stesso per ogni coppia di lati considerata.", 
 TooltipStyle -> {Background -> RGBColor[1, 1, 0.85], 
        CellFrameColor -> Red, CellFrame -> 2, CellFrameMargins -> 20,
         TextAlignment -> Center}], " in particolare essendo anche isosceli, Talete misuro' la lunghezza dell'ombra proiettata dalla piramide e da questa ottiene anche l'altezza della piramide stessa."}], "Text"]];
