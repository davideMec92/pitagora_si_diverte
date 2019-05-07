(* 
	Esercizio 1
	Costruzione per la bisettrice di un angolo
	L'obiettivo e' quello di disegnare circonferenze che abbiano una ampiezza tale che
	permettano di realizzare la costruzione per l'ottenimento della bisettrice di angolo
*)
DynamicModule[{
   checkEx41correct
   },
  {
   
   Ex41pointA = {-20, -5};
   Ex41pointD = {14, -5};
   Ex41endLowerSegment = {35, -5};
   
   rotTransf = RotationTransform[35 Degree, Ex41pointA];
   rotTransfMiddle = RotationTransform[17.5 Degree, Ex41pointA];
   
   (* funzione per il controllo della correttezza dell'esercizio, verificando il raggio delle varie circonferenze e la posizione del punto F *)
   checkEx41correct[pA_, pE_ , cA_, pD_, cD_, cE_, pF_, lower_, pI_] := (
     
     Ex41lenAE = 
      N[Sqrt[(pE[[1]] - pA[[1]])^2 + (pE[[2]] - pA[[2]])^2]];
     circAlen = N[Sqrt[(pA[[1]] - cA[[1]])^2 + (pA[[2]] - cA[[2]])^2]];
     circElen = N[Sqrt[(pE[[1]] - cE[[1]])^2 + (pE[[2]] - cE[[2]])^2]];
     circDlen = N[Sqrt[(pD[[1]] - cD[[1]])^2 + (pD[[2]] - cD[[2]])^2]];
     Ex41lenED = 
      N[Sqrt[(pE[[1]] - pD[[1]])^2 + (pE[[2]] - pD[[2]])^2]];
     
     Ex41lenLowMiddle = (Ex41pointA[[2]] - pF[[2]]) / (Ex41pointA[[1]] - 
     pF[[1]]);
     
     MessageDialog[Ex41lenLowMiddle];
     
     If[circAlen > Ex41lenAE - 2 && circAlen < Ex41lenAE + 2  && 
       circDlen > Ex41lenED - 2 && circDlen < Ex41lenED + 2 && 
       circElen > Ex41lenED - 2 && circElen < Ex41lenED + 2 && 
       Ex41lenLowMiddle < 0.35 && Ex41lenLowMiddle > 0.28 && pF[[1]] > 20, 
       	{
	       	Speak["La risposta e' corretta"]; 
       	 	ModuleQuizAnswer[4, 1, 1]; 
       		MessageDialog["La risposta e' corretta!"]
       	},
       	 {
       	 	Speak["La risposta e' sbagliata"]; 
	       	ModuleQuizAnswer[4, 1, 0]; 
	       	MessageDialog["La risposta e' sbagliata!"]
       	}];
     );
   
   
   Ex41pointE = rotTransf[Ex41pointD];
   
   Ex41pointI = rotTransfMiddle[Ex41endLowerSegment];
   
   Print[
    Manipulate[
     Graphics[
      {
      	
      	(* stampa dei dati relativi all'ampiezza dei raggi delle circonferenze *)
       Text[
        StringJoin[{"Circonferenza nel punto E = ", 
          ToString@
           N[Sqrt[(Ex41pointE[[1]] - 
                 Ex41circleE[[1]])^2 + (Ex41pointE[[2]] - 
                 Ex41circleE[[2]])^2]]}], {-35, 20}],
       Text[
        StringJoin[{"Circonferenza nel punto D = ", 
          ToString@
           N[Sqrt[(Ex41pointD[[1]] - 
                 Ex41circleD[[1]])^2 + (Ex41pointD[[2]] - 
                 Ex41circleD[[2]])^2]]}], {-35, 17}],
       Text[
        StringJoin[{"Lunghezza segmento AE = ", 
          ToString@
           N[Sqrt[(Ex41pointE[[1]] - 
                 Ex41pointA[[1]])^2 + (Ex41pointE[[2]] - 
                 Ex41pointA[[2]])^2]]}], {-35, 14}],
       Text[
        StringJoin[{"Lunghezza segmento AD = ", 
          ToString@
           N[Sqrt[(Ex41pointD[[1]] - 
                 Ex41pointA[[1]])^2 + (Ex41pointD[[2]] - 
                 Ex41pointA[[2]])^2]]}], {-35, 11}],
       
       (* disegna lati dell'angolo e varie etichette per i punti *)
       Disk[Ex41pointA, .5],
       Translate[
        Text["A", Ex41pointA],
        {-2, -2}
        ],
       
       {Thick, Line[{Ex41pointA, Ex41endLowerSegment}]},
       {Thick, 
        Rotate[Line[{Ex41pointA, Ex41endLowerSegment}], 35 Degree, 
         Ex41pointA]},
       
       Disk[Ex41pointD, .5],
       Translate[
        Text["D", Ex41pointD],
        {0, -2}
        ],
       
       Disk[Ex41pointE, .5],
       Translate[
        Text["E", Ex41pointE],
        {0, -2}
        ],
       
       Translate[
        Text["F", Ex41pointF],
        {3, 0}
        ],
       
       (* circonferenze della costruzione con manipolatore *)
       Circle[Ex41pointA, 
        Sqrt[(Ex41pointA[[1]] - 
             Ex41circleA[[1]])^2 + (Ex41pointA[[2]] - 
             Ex41circleA[[2]])^2]],
       
       Circle[Ex41pointE, 
        Sqrt[(Ex41pointE[[1]] - 
             Ex41circleE[[1]])^2 + (Ex41pointE[[2]] - 
             Ex41circleE[[2]])^2]],
       
       Circle[Ex41pointD, 
        Sqrt[(Ex41pointD[[1]] - 
             Ex41circleD[[1]])^2 + (Ex41pointD[[2]] - 
             Ex41circleD[[2]])^2]],
       
       EventHandler[{Inset[
          Button["Verifica l'esercizio", BaseStyle -> {White}, Background -> Red, FrameMargins -> Medium], {-40, -20}]}, \
{"MouseClicked" :> (
           
           checkEx41correct[Ex41pointA, Ex41pointE, Ex41circleA, 
             Ex41pointD, Ex41circleD, Ex41circleE, Ex41pointF, 
             Ex41endLowerSegment, Ex41pointI];
           )}],
       
       {Red, Thick, Line[{Ex41pointA, Ex41pointF}]}
       
       
       },
      PlotRange -> {{-60, 60}, {-40, 40}},
      ImageSize -> 780
      ],
     {{Ex41circleA, {-25, 5}}, Locator}, {{Ex41circleE, {6, 19}}, 
      Locator}, {{Ex41circleD, {25, -8}}, 
      Locator}, {{Ex41pointF, {40, 3}}, Locator}
     ]
    ];
   
   },
  
  Initialization :> (
    SetAttributes[checkEx41correct, HoldAll]
    )
  ];
  
Print[TextCell["Suggerimenti", "Subsection"]];

CellPrint[{TextCell[Row[{"Traccia una circonferenza con centro nel punto ", Style["A", Bold], " e raggio qualunque;"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Indica con ", Style["D", Bold], " ed ", Style["E", Bold], " i punti di intersezione tra la circonferenza e i lati dell'angolo;"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Traccia una circonferenza con centro nel punto ", Style["D", Bold], " e che interseca il punto ", Style["E", Bold], ";"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Traccia una circonferenza con centro nel punto ", Style["E", Bold], " e che interseca il punto ", Style["D", Bold], ";"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"La bisettrice passa per il punto ", Style["F", Bold], ", individuato dall'intersezione delle due circonferenze."}], {"Item"}]}];

Print[TextCell["Vuoi la dimostrazione?", "Subsection"]];

Print[TextCell["Lo scopo dell'esercizio sarebbe eseguire una costruzione analoga a quella fatta da Euclide, ma se vuoi una dimostrazione allora anche in questo caso ci si deve appoggiare su proposizioni precedentemente dimostrate:", "Text"]];

CellPrint[{TextCell[Row[{"Dato l'angolo al vertice ", Style["A", Bold], ", si tracci la circonferenza di centro ", Style["A", Bold], " e raggio qualsiasi e si indichi con ", Style["D", Bold], " ed ", Style["E", Bold], " i punti di intersezione coi lati dell'angolo;"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Si congiunga ", Style["D", Bold], " con ", Style["E", Bold], " e si costruisca a partire da ", Style["DE", Bold], " il triangolo equilatero ", Style["DEF", Bold], ", proposizione 1 del primo libro di Euclide;"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"I triangoli ", Style["ADF", Bold], " e ", Style["AEF", Bold], " sono congruenti per il terzo criterio di congruenza dei triangoli: ", Style["AD", Bold], " = ", Style["AE", Bold], " perche' raggi della stessa circonferenza di centro ", Style["A", Bold], ", ", Style["AF", Bold], " in comune, ", Style["AE", Bold], " = ", Style["AF", Bold], " perche' lati di un triangolo equilatero;"}], {"Item"}]}];

CellPrint[TextCell[Row[{"\[Implies] In particolare, dal punto precedente, gli angoli ", Style["DAF", Bold], " e ", Style["EAF", Bold], " sono congruenti."}], "Text"]];