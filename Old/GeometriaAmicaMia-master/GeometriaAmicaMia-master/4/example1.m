(* 
	Esempio 1
	Costruzione di triangolo equilatero con due circonferenze 
*)
DynamicModule[{},
  
  ptA3 = {-10, 0};
  Print[
   Manipulate[
    Graphics[{
    	
      {
      	(* disegna i segmenti del triangolo in rosso *)
       Red,
       Thick,
       Line[{ptA3, {ptA3[[1]] + A, ptA3[[2]]}}],
       Line[{ptA3, {ptA3[[1]] + A / 2,  
          ptA3[[2]] + (A * Sqrt[3]) / 2}}],
       Line[{{ptA3[[1]] + A, ptA3[[2]]}, {ptA3[[1]] + A / 2,  
          ptA3[[2]] + (A * Sqrt[3]) / 2}}]
       },
       
       
       (* disegna punti e etichette *)
      Black,
      Disk[ptA3, .5],
      Text["A", {ptA3[[1]] - 2, ptA3[[2]] - 2}],
      Translate[Disk[ptA3, .5], {A, 0}],
      Translate[Text["B", ptA3], {A + 2, -2}],
      Translate[Disk[ptA3, .5], {A, 0}],
      Disk[{ptA3[[1]] + A / 2, ptA3[[2]] + (A * Sqrt[3]) / 2}, .5],
      Text[
       "C", {ptA3[[1]] + A / 2, ptA3[[2]] + (A * Sqrt[3]) / 2 + 2}],
      
      (* disegna circonferenze *)
      Circle[ptA3, A],
      Translate[Circle[ptA3, A], {A, 0}]
      },
     PlotRange -> {{-50, 50}, {-25, 25}}, ImageSize -> 700],
    Style["Lunghezza segmento AB", 12, Bold], {A, 10, 20}
    ]
   ];
  
  ];

Print[TextCell["L'ipotesi", "Subsection"]];

Print[TextCell[Row[{"La lunghezza del segmento ", Style["AB", Bold], " e' nota"}], "Text", TextJustification -> 1]];

Print[TextCell["Il procedimento", "Subsection"]];

CellPrint[{TextCell[Row[{"Costruisci una circonfenza con centro nel punto ", Style["A", Bold], " e raggio pari ad ", Style["AB", Bold], ";"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Costruisci una circonfenza con centro nel punto ", Style["B", Bold], " e raggio pari ad ", Style["AB", Bold], ";"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Chiama ", Style["C", Bold], " uno dei due punti di intersezione delle due circonferenze;"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"I segmenti ", Style["AC", Bold], " e ", Style["AB", Bold], " sono congruenti perche' raggi della stessa circonferenza;"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"I segmenti ", Style["BC", Bold], " e ", Style["AB", Bold], " sono congruenti perche' raggi della stessa circonferenza;"}], {"Item"}]}];

CellPrint[TextCell[Row[{"\[Implies] Per le due deduzioni sopra, ", Style["AB", Bold], " = ", Style["BC", Bold], " = ", Style["AC", Bold], " quindi il triangolo ", Style["ABC", Bold], " e' equilatero."}], "Text"]];