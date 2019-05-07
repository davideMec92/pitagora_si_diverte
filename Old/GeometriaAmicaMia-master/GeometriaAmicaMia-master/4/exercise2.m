(* 
	Esercizio 2
	Costruzione per segmento perpendicolare ad altro segmento
	L'obiettivo e' quello di disegnare circonferenze che abbiano una ampiezza tale che
	permettano di realizzare la costruzione per l'ottenimento di segmenti perpendicolari tra loro
*)
DynamicModule[{
   checkEx42correct
   },
  {
  	
   (* funzione per il controllo della correttezza dell'esercizio, verificando il raggio delle varie circonferenze e la posizione del punto F *)
   checkEx42correct[pA_, pB_ , pC_, pD_, pF_, cA_, cB_, cC_, 
     pI_] := (
     
     Ex42lenAB = 
      N[Sqrt[(pB[[1]] - pA[[1]])^2 + (pB[[2]] - pA[[2]])^2]];
     Ex42pointFI = 
      N[Sqrt[(pI[[1]] - pF[[1]])^2 + (pI[[2]] - pF[[2]])^2]];
     circBlen = N[Sqrt[(pB[[1]] - cB[[1]])^2 + (pB[[2]] - cB[[2]])^2]];
     circClen = N[Sqrt[(pC[[1]] - cC[[1]])^2 + (pC[[2]] - cC[[2]])^2]];
     circAlen = N[Sqrt[(pA[[1]] - cA[[1]])^2 + (pA[[2]] - cA[[2]])^2]];
     
     If[circAlen > Ex42lenAB - 2 && circAlen < Ex42lenAB + 2  && 
       circBlen > Ex42lenAB * 2 - 2 && circBlen < Ex42lenAB * 2 + 2  &&

              circClen > Ex42lenAB * 2 - 2 && 
       circClen < Ex42lenAB * 2 + 2 &&
       Ex42pointFI >= 2, 
      {
       Speak["La risposta e' corretta"]; ModuleQuizAnswer[4, 2, 1]; 
       MessageDialog["La risposta e' corretta!"]
       }, {
       Speak["La risposta e' sbagliata"]; ModuleQuizAnswer[4, 2, 0]; 
       MessageDialog["La risposta e' sbagliata!"]
       }];
     );
   
   Ex42pointA = {0, 0};
   Ex42pointB = {-15, 0};
   Ex42pointC = {15, 0};
   Ex42pointI = {0, 23};
   
   Print[
    Manipulate[
     Graphics[
      {
      	(* disegna i segmenti *)
       {Black , Line[{{-40, 0}, {40, 0}}]},
       {Red , Thick, Line[{Ex42pointA, Ex42pointF}]},
       
       (* disegna le etichette per i punti *)
       Disk[Ex42pointA, .5],
       Translate[
        Text["A", Ex42pointA],
        {0, -2}
        ],
       
       Disk[Ex42pointB, .5],
       Translate[
        Text["B", Ex42pointB],
        {-2, -2}
        ],
       
       Disk[Ex42pointC, .5],
       Translate[
        Text["C", Ex42pointC],
        {2, -2}
        ],
       
       Translate[
        Text["F", Ex42pointF],
        {0, 2}
        ],
       
       (* disegna le circonferenze generate dallo spostamento dei manipolatori *)
       Circle[Ex42pointB, 
        Sqrt[(Ex42pointB[[1]] - 
             Ex42circleB[[1]])^2 + (Ex42pointB[[2]] - 
             Ex42circleB[[2]])^2]],
       
       Circle[Ex42pointC, 
        Sqrt[(Ex42pointC[[1]] - 
             Ex42circleC[[1]])^2 + (Ex42pointC[[2]] - 
             Ex42circleC[[2]])^2]],
       
       Circle[Ex42pointA, 
        Sqrt[(Ex42pointA[[1]] - 
             Ex42circleA[[1]])^2 + (Ex42pointA[[2]] - 
             Ex42circleA[[2]])^2]],
       
       (* disegna il bottone per verificare la correttezza dell'esercizio *)
       EventHandler[{Inset[
          Button["Verifica l'esercizio", BaseStyle -> {White}, 
           Background -> Red, 
           FrameMargins -> 
            Medium], {-40, -20}]}, {"MouseClicked" :> (
           
           checkEx42correct[Ex42pointA, Ex42pointB, Ex42pointC, 
             Ex41pointD, Ex42pointF, Ex42circleA, Ex42circleB, 
             Ex42circleC, Ex42pointI];
           )}]     
       
       },
      PlotRange -> {{-60, 60}, {-40, 40}},
      ImageSize -> 700
      ],
     {{Ex42circleB, {-20, 5}}, Locator}, {{Ex42circleC, {30, -3}}, 
      Locator}, {{Ex42circleA, {3, 3}}, 
      Locator}, {{Ex42pointF, {-20, 20}}, Locator}
     ]
    ];
   
   },
  
  Initialization :> (
    SetAttributes[checkEx42correct, HoldAll]
    )
  ];
  
Print[TextCell["Suggerimenti", "Subsection"]];

CellPrint[{TextCell[Row[{"Traccia una circonferenza con centro nel punto ", Style["A", Bold], " e raggio qualunque;"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Indica con ", Style["B", Bold], " e ", Style["C", Bold], " i punti di intersezione tra la circonferenza e il segmento dato;"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Traccia una circonferenza con centro nel punto ", Style["B", Bold], " e che interseca il punto ", Style["C", Bold], ";"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Traccia una circonferenza con centro nel punto ", Style["C", Bold], " e che interseca il punto ", Style["B", Bold], ";"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"L'intersezione delle due circonferenze individua il punto ", Style["F", Bold], ", tale che il segmento ", Style["AF", Bold], " e' perpendicolare a ", Style["BC", Bold], "."}], {"Item"}]}];

Print[TextCell["Vuoi la dimostrazione?", "Subsection"]];

Print[TextCell["Lo scopo dell'esercizio sarebbe eseguire una costruzione analoga a quella fatta da Euclide, ma se vuoi una dimostrazione allora anche in questo caso ci si deve appoggiare su proposizioni precedentemente dimostrate:", "Text"]];

CellPrint[{TextCell[Row[{"Costruisci a partire da ", Style["BC", Bold], " il triangolo equilatero ", Style["BCF", Bold], ", proposizione 1 del primo libro;"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Considera i triangoli ", Style["ABF", Bold], " e ", Style["ACF", Bold], ", questi sono congruenti per il terzo criterio di congruenza: ", Style["FA", Bold], " e' in comune, ", Style["AC", Bold], " = ", Style["BC", Bold], " perche' raggi di una stessa circonferenza, ", Style["FB", Bold], "=", Style["FC", Bold], " perche' ", Style["BCF", Bold], " e' un triangolo equilatero;"}], {"Item"}]}];

CellPrint[TextCell[Row[{"\[Implies] In particolare, dal punto precedente, gli angoli ", Style["FAB", Bold], " e ", Style["FAC", Bold], " sono congruenti, ma anche supplementari quindi possiamo concludere che sono retti."}], "Text"]];