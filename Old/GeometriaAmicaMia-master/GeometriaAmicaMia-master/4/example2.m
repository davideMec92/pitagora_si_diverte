(* 
	Esempio 2
	Costruzione punto medio di un segmento con circonferenze
	L'obiettivo e' quello di disegnare nel modo corretto le circonferenze
	che portano ad una giusta costruzione
*)

DynamicModule[{},
  
  ptA2 = {-10, 0};
  
  Print[
   Manipulate[
    Graphics[{
    	
	(* disegna segmento iniziale AB *)
      {
       Black,
       Thick,
       Line[{ptA2, {ptA2[[1]] + A, ptA2[[2]]}}]
       },
       
       (* disegna la proiezione verticale che taglia AB *)
       {
       Dashed,
       Line[{{ptA2[[1]] + 
           A / 2, - ptA2[[2]] - (A * Sqrt[3]) / 2}, {ptA2[[1]] + 
           A / 2,  ptA2[[2]] + (A * Sqrt[3]) / 2}}]
       },
         
      (* disegna i punti e le etichette necessarie *)
      Black,
      Disk[ptA2, .5],
      Text["A", {ptA2[[1]] - 2, ptA2[[2]] - 2}],
      Translate[Disk[ptA2, .5], {A, 0}],
      Translate[Text["B", ptA2], {A + 2, -2}],
      Disk[{ptA2[[1]] + A / 2, ptA2[[2]] + (A * Sqrt[3]) / 2}, .5],
      Text[
       "C", {ptA2[[1]] + A / 2, ptA2[[2]] + (A * Sqrt[3]) / 2 + 2}],
      Disk[{ptA2[[1]] + A / 2, - ptA2[[2]] - (A * Sqrt[3]) / 2}, .5],
      Text[
       "D", {ptA2[[1]] + A / 2, - ptA2[[2]] - (A * Sqrt[3]) / 2 - 2}],
      Disk[{ptA2[[1]] + A / 2, 0}, .5],
      Text["M", {ptA2[[1]] + A / 2 + 1, - 2}],
      
      Text[ToString@N[A / 2, 2], {ptA2[[1]] + A / 4, 1}],
      Text[ToString@N[A / 2, 2], {ptA2[[1]] + A / 4 * 3, 1}],
      
      (* disegna le circonferenze *)
      Circle[ptA2, A],
      Translate[Circle[ptA2, A], {A, 0}]
      },
     PlotRange -> {{-50, 50}, {-25, 25}}, ImageSize -> 700],
    Style["Lunghezza segmento AB", 12, Bold], {A, 10, 20}
    ]
   ];
  
  ];

Print[TextCell["L'ipotesi", "Subsection"]];

Print[TextCell[Row[{"La lunghezza del segmento ", Style["AB", Bold], " e' nota"}], "Text", TextJustification -> 1]];

Print[TextCell["Il procedimento", "Subsection"]];

CellPrint[{TextCell[Row[{"Costruisci una circonefenza con centro nel punto ", Style["A", Bold], " e raggio pari ad ", Style["AB", Bold], ";"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Costruisci una circonefenza con centro nel punto ", Style["B", Bold], " e raggio pari ad ", Style["AB", Bold], ";"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Chiama ", Style["C", Bold], " e ", Style["D", Bold], " i punti di intersezione delle due circonferenze;"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Costruisci il segmento ", Style["CD", Bold], ";"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Sia ", Style["M", Bold], " il punto di intersezione tra i segmenti ", Style["AB", Bold], " e ", Style["CD", Bold], ";"}], {"Item"}]}];

CellPrint[TextCell[Row[{"\[Implies] Il punto ", Style["M", Bold], " ottenuto e' punto medio del segmento ", Style["AB", Bold], "."}], "Text"]];

Print[TextCell["Dimostrazione", "Subsection"]];

Print[TextCell["Se vuoi dimostrare il procedimento sopra descritto, puoi continuare a leggere i passaggi che potrano alla dimostrazione della costruzione:", "Text"]];

CellPrint[{TextCell[Row[{"Costruisci a partire da ", Style["AB", Bold], " il triangolo equilatero ", Style["ABC", Bold], ", proposizione 1 del primo libro;"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Traccia la bisettrice dell'angolo ", Style["C", Bold], ", che incontri ", Style["AB", Bold], " nel punto ", Style["M", Bold], ", proposizione 9 del primo libro;"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Considera i triangoli ", Style["AMC", Bold], " e ", Style["BMC", Bold], ", questi sono congruenti per il primo criterio di congruenza: ", Style["CM", Bold], " e' in comune, ", Style["AC", Bold], "=", Style["BC", Bold], " perche' ", Style["ABC", Bold], " e' un triangolo equilatero, ", Style["ACM", Bold], "=", Style["MCB", Bold], " perche' ", Style["MC", Bold], " e' bisettrice di ", Style["C", Bold], ";"}], {"Item"}]}];

CellPrint[TextCell[Row[{"\[Implies] In particolare, dal punto precedente, ", Style["AM", Bold], "=", Style["MB", Bold], "."}], "Text"]];