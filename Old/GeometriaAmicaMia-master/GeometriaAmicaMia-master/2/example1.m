Print[TextCell[
   "Talete ha risolto questo problema sfruttando il criterio di congruenza dei triangoli. Vediamo il suo geniale stratagemma:", "Text"]];

Print[TextCell[
   Row[{"Immagina di essere sulla spiaggia fermo in un punto chiamato ", Style["A", Bold], " e \
di vedere davanti a te una nave ferma in mezzo al mare in un punto ", Style["B", Bold], ". \
Quello che vuoi fare e' calcolare la distanza della nave da te, ossia \
la distanza tra ", Style["A", Bold], " e ", Style["B", Bold], "."}], "Text", TextJustification -> 1]];

Print[TextCell[
   Row[{"Passeggia lungo la spiaggia, tenendo sempre il mare alla tua destra, ossia spostati perpendicolarmente al segmento ", Style["AB", Bold], ", finche non sei stanco, quindi fermati in un punto che chiameremo ", Style["C", Bold], " ricordandoti di fare un segno sulla spiaggia quando sei a meta' della passeggiata, quel segno sara' il punto ", Style["D", Bold], ". Immagina che da dove sei adesso, nel punto ", Style["C", Bold], ", passi una retta parallela al segmento ", Style["AB", Bold], ". Spostati lungo questa retta finche' con un raggio laser puntato sulla nave, questo non incontra il punto ", Style["D", Bold], ", quindi fermati e chiamiamo ", Style["F", Bold], " il punto in cui ti sei fermato."}], "Text", 
   TextJustification -> 1]];

Print[TextCell[
   Row[{"Talete ovviamente non aveva un raggio laser, ma si e' semplicemente spostato lungo la spiaggia finche' non vede il punto ", Style["D", Bold], " davanti alla nave, questo e' sufficiente per dire che sono allineati."}], "Text", TextJustification -> 1]];
   
(* 
	Esempio di manipulate per chiarire la costruzione utilizzata per
	calcolare la distanza di una nave dalla costa
	
	Il manipulate e' stato introdotto per cambiare dinamicamente la posizione
	della barca in mare
*)
DynamicModule[{},
	
  ptCenter = {0, 0};
  bg = Import[
    FileNameJoin[{NotebookDirectory[], directoryNumber, 
      "rimini.png"}]];
  barca = 
   Import[FileNameJoin[{NotebookDirectory[], directoryNumber, 
      "boat.png"}]];
      
  Print[Manipulate[
    Graphics[{
      (* disegna lo sfondo *)
      
      Inset[bg, {-50, -25}, {-50, 25}, {100, 400}],
      
      (* disegna le linee rette *)
      {Dashed, 
       InfiniteLine[{pt1, {pt1[[1]] - 10, pt1[[2]]}}]},
      {Dashed, 
       InfiniteLine[{{pt1[[1]], -pt1[[2]]}, {pt1[[1]] - 
           10, -pt1[[2]]}}]},
      {Dashed, InfiniteLine[{{-5, 10}, {5, -10}}]},
      
      (* disegna i punti *)
      Black, Disk[ptCenter, .5],
      Black, Disk[{-pt1[[2]]/2, pt1[[2]]}, .5],
      Black, Disk[{pt1[[2]]/2, -pt1[[2]]}, .5],
      
      (* 
      ...e le loro etichette, tutte opportunamente traslate di qualche punto in 
      modo da non coprire la costruzione 
      *)
      
      Translate[Text["D", ptCenter, BaseStyle -> {Large}], {2, 2}], 
      Translate[Text["B", pt1, BaseStyle -> {Large}], {2, -2}], 
      Translate[
       Text["F", {((-pt1[[2]] + 
              ptCenter[[2]])*((pt1[[1]] + ptCenter[[1]]))/(pt1[[2]] + 
               ptCenter[[2]])) - ptCenter[[1]], -pt1[[2]]}, 
        BaseStyle -> {Large}], {0, -3}], 
      Translate[
       Text["A", {-pt1[[2]]/2, pt1[[2]]}, 
        BaseStyle -> {Large}], {-2, -2}], 
      Translate[
       Text["C", {pt1[[2]]/2, -pt1[[2]]}, BaseStyle -> {Large}], {2, 
        2}],
      
      Line[{pt1, {((-pt1[[2]] + 
              ptCenter[[2]])*((pt1[[1]] + ptCenter[[1]]))/(pt1[[2]] + 
               ptCenter[[2]])) - ptCenter[[1]], -pt1[[2]]}}], Black, 
      Disk[{((-pt1[[2]] + 
             ptCenter[[2]])*((pt1[[1]] + ptCenter[[1]]))/(pt1[[2]] + 
              ptCenter[[2]])) - ptCenter[[1]], -pt1[[2]]}, .5],
      
      (* disegna l'immagine della barca dove c'e' il Locator da muovere *)
      
      Translate[Inset[barca, pt1, {6, 6}, {6, 6}], {1, 1}]}, 
     PlotRange -> {{-50, 50}, {-25, 25}}, ImageSize -> 700],
    
    {{pt1, {35, -10}}, Locator}]
   ];
  ];

Print[TextCell["La risoluzione", "Subsection"]];

Print[TextCell[
   Row[{"I triangoli ", Style["FCD", Bold], " e ", Style["ABD", Bold], " sono congruenti per il secondo criterio di \
congruenza dei triangoli, infatti:"}], "Text", 
   TextJustification -> 1]];
CellPrint[{TextCell[
    Row[{Style["AD", Bold], " \[Congruent] ", Style["DC", Bold], ", perche' ", Style["D", Bold], " e' punto medio di ", Style["AC", Bold], ";"}], \
{"Item"}]}];
CellPrint[{TextCell[
    Row[{OverHat[A] \[Congruent] OverHat[C] \[Congruent] \[Pi]/2, 
      ", perche' ", Style["AC", Bold], " e' perpendicolare ad ", Style["AB", Bold], " e ", Style["FC", Bold], " per costruzione;"}], \
{"Item"}]}];
CellPrint[{TextCell[
    Row[{Style["BDA", Bold], " \[Congruent] ", Style["CDA", Bold], ", perche' angoli opposti al vertice."}], \
{"Item"}]}];

Print[TextCell[
   Row[{"\[Implies] La distanza ", Style["CF", Bold], " sara' uguale a quella cercata ", Style["AB", Bold], ", ma \
questa volta ", Style["CF", Bold], " e' calcolabile in quanto ", Style["F", Bold], " e' un punto sulla terra."}], 
   "Text"]];