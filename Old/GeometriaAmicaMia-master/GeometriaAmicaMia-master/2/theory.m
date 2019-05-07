
Print[TextCell["Concetti di base", "Subsection"]];

Print[TextCell[
   "Per parlare di criteri di congruenza, bisogna che siano ben \
chiari alcuni elementi fondamentali dei triangoli.", "Text", 
   TextJustification -> 1]];

CellPrint[{TextCell[
    Row[{"Vertici del triangolo: i punti estremi dei lati"}], \
{"Item"}]}];

Print[TextCell[
   "Identifica i vertici del triangolo sottostante con un click del \
mouse:", "Text", TextJustification -> 1, ParagraphIndent -> 15]];

(* 
	Teoria esempio 1
	Individua i tre vertici del triangolo con il click del mouse
*)
theo1[] :=
    (
    DynamicModule[
    {
    pt1 = {RandomInteger[{-28, -20}], RandomInteger[{-28, -20}]},
    pt2 = {RandomInteger[{-10, 22}], RandomInteger[{20, 25}]},
    pt3 = {RandomInteger[{20, 25}], RandomInteger[{-10, 15}]},
    clicked1 = 0,
    clicked2 = 0,
    clicked3 = 0,
    solution = "",
    bottomT = TranslationTransform[{-2,-2}],
    topT = TranslationTransform[{2,2}]
    },
    
    (* 
    		Controlla che tutti e tre i vertici siano stati cliccati almeno una volta  
    		Imposta il valore della stringa s__ in caso positivo
    	*)
    checkSolved[c1_, c2_, c3_, s__] :=
        (
        If[ c1 > 0 && c2 > 0 && c3 > 0,
            {s = "Bravo!"}
        ];
      );
      
    Dynamic[
     
     (* dentro a Graphics, usa EventHandler per catturare gli eventi click sui vertici del triangolo *)
     Graphics[
      {
       LightBlue,
       Triangle[{pt1, pt2, pt3}],
       Black,
       Disk[pt1, .5],
       Disk[pt2, .5],
       Disk[pt3, .5],
       
       EventHandler[{ Transparent, Rectangle[bottomT[pt1], topT[pt1]]}, {"MouseClicked" :> (clicked1 = 1;
                                         checkSolved[clicked1, clicked2, clicked3, solution];)}],
       EventHandler[{ Transparent, Rectangle[bottomT[pt2], topT[pt2]]}, {"MouseClicked" :> (clicked2 = 1;
                                         checkSolved[clicked1, clicked2, clicked3, solution];)}],
       EventHandler[{ Transparent, Rectangle[bottomT[pt3], topT[pt3]]}, {"MouseClicked" :> (clicked3 = 1;
                                         checkSolved[clicked1, clicked2, clicked3, solution];)}],
                                         
       (* Stampa una stringa "solution" con valore vuoto ma passala alla funzione come Dynamic *)                                  
       Inset[Dynamic@solution, BaseStyle -> {Large}]
       
       },  
      
      ImageSize -> 350,
      PlotRange -> {{-30, 30}, {-30, 30}},
      Axes -> False
      ]
     ],
    
    Initialization :> (
    		(* fa in modo che la funzione riceva i parametri come reference e non solo come valore *)
    		SetAttributes[checkSolved, HoldAll]
    )
    
    ]
    );

Print[theo1[]];

CellPrint[{TextCell[
    Row[{"Angolo adiacente ad un lato, verifica le seguenti \
proprieta':"}], {"Item"}]}];

Print[TextCell[
   "- Uno dei due lati dell'angolo coincide con il lato considerato", 
   "Text", TextJustification -> 1, ParagraphIndent -> 15]];
Print[TextCell[
   "- Entrambi i lati dell'angolo sono lati del poligono", "Text", 
   TextJustification -> 1, ParagraphIndent -> 15]];

Print[TextCell[
   Row[{"Identifica, cliccandolo col mouse, il lato adiacente agli \
angoli ", OverHat[A], " e ",  OverHat[C], ":"}], "Text", 
   TextJustification -> 1, ParagraphIndent -> 15]];

(* 
	Teoria esercizio 2
	Individua e clicca il segmento adiacente ai due angoli indicati 
*)
theo2[] :=
    (
    DynamicModule[
    {
    pt1 = {RandomInteger[{-28, -20}], RandomInteger[{-28, -20}]},
    pt2 = {RandomInteger[{-10, 28}], RandomInteger[{20, 25}]},
    pt3 = {RandomInteger[{20, 25}], RandomInteger[{-10, 15}]},
    solution = ""
    },
    
    checkSolved[s__] :=
        (
        s = "Bravo!"
        );
    Dynamic[
     
     Graphics[
      {
       LightBlue,
       EdgeForm[Thick],
       Triangle[{pt1, pt2, pt3}],
       Red, Thick,
       Line[{pt1, pt2}],
       Line[{pt1, pt2}],
       Line[{pt1, pt2}],
       
       Black,
       EventHandler[{Line[{pt1, pt2}]}, {"MouseClicked" :> ( 
           checkSolved[ solution];)}],
           
       Translate[
        Text[TraditionalForm[A], pt1 , 
         BaseStyle -> {Medium}], {-2, -2}],
       Translate[
        Text[TraditionalForm[C], pt2 , BaseStyle -> {Medium}], {-2, 
         2}],
       Translate[
        Text[TraditionalForm[B], pt3 , 
         BaseStyle -> {Medium}], {2, -1}],
         
       Inset[Dynamic@solution, BaseStyle -> {Large}]
       },  
      
      ImageSize -> 350,
      PlotRange -> {{-30, 30}, {-30, 30}},
      Axes -> False
      ]
     ],
    
    Initialization :> (
    		SetAttributes[checkSolved, HoldAll]
    )
    ]
);

Print[theo2[]];

Print[TextCell["Congruenza di triangoli", "Subsection"]];

Print[TextCell["Due triangoli si dicono congruenti quando:", "Text", 
   TextJustification -> 1]];
Print[TextCell["- Gli angoli corrispondenti sono congruenti", "Text", 
   TextJustification -> 1, ParagraphIndent -> 15]];
Print[TextCell["- I lati corrispondenti sono congruenti", "Text", 
   TextJustification -> 1, ParagraphIndent -> 15]];
Print[TextCell[
   "Esistono pero' tre criteri di congruenza che mettono in relazione \
alcuni elementi dei triangoli", "Subsubtitle", 
   TextJustification -> 1]];

Print[TextCell["Primo criterio di congruenza", "Subsection"]];
Print[TextCell[
   "Se due triangoli hanno rispettivamente congruenti due lati e \
l'angolo tra essi compreso, allora sono congruenti.", "Text", 
   TextJustification -> 1]];
 
Print[Import[
   FileNameJoin[{NotebookDirectory[], directoryNumber, "primocriterio.png"}]]];
   
Print[TextCell[
   Row[{"Posti ", Style["AB", Bold], " = ", Style["A'B'", Bold], " e ", Style["BC", Bold], " = ", Style["B'C'", Bold], ", clicca sui rispettivi angoli che rendono i triangoli ", Style["ABC", Bold], " e ", Style["A'B'C'", Bold], " congruenti per il primo criterio di congruenza."}], "Text", 
   TextJustification -> 1]];

(* 
	Teoria esercizio 3
	Individua e clicca gli angoli che rendono i triangoli congruenti per il primo criterio 
*)
theo3[] :=
    (
    ptAtheo3 = {-40, -20};
    ptBtheo3 = {0, -20};
    ptCtheo3 = {-25, 0};
    
    DynamicModule[{
      clicked1 = 0,
      clicked2 = 0,
      solution = ""
      }, 
     
     centroid = RegionCentroid[Triangle[{ptAtheo3, ptBtheo3, ptCtheo3}]];
     ttheo3 = TranslationTransform[{40, 10}];
     rnd = RandomInteger[{110, 130}];
     rtheo3 = RotationTransform[rnd Degree, ttheo3[centroid]];
     tmtheo3 = TranslationTransform[{-3, -3}];
     tptheo3 = TranslationTransform[{3, 3}];
     
     checkSolved[c1_, c2_, s__] :=
         (
         If[ c1 > 0 && c2 > 0,
             {s = "Bravo!"}
         ];
      );
      
     Dynamic[
      Graphics[{
        Thick,
        Green, Line[{ptAtheo3, ptBtheo3}],
        Blue, Line[{ptBtheo3, ptCtheo3}],
        Black, Line[{ptCtheo3, ptAtheo3}],
        
        Green, Line[{rtheo3[ttheo3[ptAtheo3]], rtheo3[ttheo3[ptBtheo3]]}],
        Blue, Line[{rtheo3[ttheo3[ptBtheo3]], rtheo3[ttheo3[ptCtheo3]]}],
        Black, Line[{rtheo3[ttheo3[ptCtheo3]], rtheo3[ttheo3[ptAtheo3]]}],
        
        Translate[
         Text[TraditionalForm[A], ptAtheo3 , 
          BaseStyle -> {Medium}], {-2, -2}],
        Translate[
         Text[TraditionalForm[C], ptCtheo3 , BaseStyle -> {Medium}], {-1, 
          2}],
        Translate[
         Text[TraditionalForm[B], ptBtheo3 , 
          BaseStyle -> {Medium}], {2, -1}],
        
        Translate[
         Text[TraditionalForm[A'], rtheo3[ttheo3[ptAtheo3]] , 
          BaseStyle -> {Medium}], {-1, -2}],
        Translate[
         Text[TraditionalForm[C'], rtheo3[ttheo3[ptCtheo3]] , 
          BaseStyle -> {Medium}], {-2, 0}],
        Translate[
         Text[TraditionalForm[B'], rtheo3[ttheo3[ptBtheo3]] , 
          BaseStyle -> {Medium}], {2, 2}],
        
        (* elemento per catturare il click sul primo angolo *)
        EventHandler[{Transparent, 
          Rectangle[tmtheo3[rtheo3[ttheo3[ptBtheo3]]], 
           tptheo3[rtheo3[ttheo3[ptBtheo3]]]]}, {"MouseClicked" :> (clicked1 = 1;
                                                                    checkSolved[clicked1, clicked2, solution])}],
                                                                    
        (* elemento per catturare il click sul secondo angolo *)
        EventHandler[{Transparent, 
          Rectangle[tmtheo3[ptBtheo3], 
           tptheo3[ptBtheo3]]}, {"MouseClicked" :> (clicked2 = 1;
                                                    checkSolved[clicked1, clicked2, solution])}],
        
        Inset[Dynamic@solution, BaseStyle -> {Large}]
        },
        ImageSize -> 600, PlotRange -> {{-50, 50}, {-25, 25}}
       ]
      ],
     
     Initialization :> (
       SetAttributes[checkSolved, HoldAll]
       )
     
     ]);

Print[theo3[]];

Print[TextCell["Secondo criterio di congruenza", "Subsection"]];
Print[TextCell[
   "Se due triangoli hanno rispettivamente congruenti due angoli ed \
il lato tra essi compreso, allora sono congruenti.", "Text", 
   TextJustification -> 1]];

Print[TextCell[Row[{"Posti ", OverHat[A], "=", OverHat[A'], " e ", OverHat[C], "=", OverHat[C'], " clicca sul lato che rende i triangoli ", Style["ABC", Bold], " e ", Style["A'B'C'", Bold], " congruenti per il secondo criterio di congruenza."}], "Text", 
   TextJustification -> 1]];

(* 
	Teoria esercizio 4
	Individua e clicca sul lato che rende i triangoli congruenti per il secondo criterio 
*)   
theo4[] :=
    (
    ptA = {-40, -20};
    ptB = {0, -20};
    ptC = {-25, 0};
    
    DynamicModule[{
      clicked1 = 0,
      clicked2 = 0,
      solution = ""
      }, 
     
     (* funzioni di traslazione e rotazione per generare triangolo simile che sembri casuale *)
     centroid = RegionCentroid[Triangle[{ptA, ptB, ptC}]];
     t4 = TranslationTransform[{40, 10}];
     tBottom4 = TranslationTransform[{-2, -2}];
	tTop4 = TranslationTransform[{2, 2}];
	tBottomRight4 = TranslationTransform[{2, -2}];
	tTopLeft4 = TranslationTransform[{-2, 2}];

     rnd = RandomInteger[{110, 130}];
     r4 = RotationTransform[rnd Degree, t4[centroid]];
     
     checkSolved[c1_, c2_, s__] :=
         (
         If[ c1 > 0 && c2 > 0,
             {s = "Bravo!"}
         ];
      );
      
     Dynamic[
      Graphics[{
        Thick,
        Line[{ptA, ptB}],
        Line[{ptB, ptC}],
        Line[{ptC, ptA}],
        
        Line[{r4[t4[ptA]], r4[t4[ptB]]}],
        Line[{r4[t4[ptB]], r4[t4[ptC]]}],
        Line[{r4[t4[ptC]], r4[t4[ptA]]}],
        
        Blue, 
        Translate[
         Text[TraditionalForm[A], ptA , 
          BaseStyle -> {Medium, Bold}], {-2, -2}],
        Green, 
        Translate[
         Text[TraditionalForm[C], ptC , 
          BaseStyle -> {Medium, Bold}], {-1, 2}],
        Black, 
        Translate[
         Text[TraditionalForm[B], ptB , 
          BaseStyle -> {Medium, Bold}], {2, -1}],
        
        Blue, 
        Translate[
         Text[TraditionalForm[A'], r4[t4[ptA]] , 
          BaseStyle -> {Medium, Bold}], {-1, -2}],
        Green, 
        Translate[
         Text[TraditionalForm[C'], r4[t4[ptC]] , 
          BaseStyle -> {Medium, Bold}], {-2, 0}],
        Black, 
        Translate[
         Text[TraditionalForm[B'], r4[t4[ptB]] , 
          BaseStyle -> {Medium, Bold}], {2, 2}],
        
        EventHandler[{Transparent, 
  			Polygon[{r4[t4[tBottom4[ptA]]], r4[t4[tBottomRight4[ptA]]], 
    				r4[t4[tTop4[ptC]]], 
    					r4[t4[tTopLeft4[ptC]]]}]}, {"MouseClicked" :> (clicked1 = 1;
    			checkSolved[clicked1, clicked2, 
     				solution])}],
 		EventHandler[{Transparent, 
  			Polygon[{tBottom4[ptA], tBottomRight4[ptA], tTop4[ptC], 
    				tTopLeft4[ptC]}]}, {"MouseClicked" :> (clicked2 = 1;
    					checkSolved[clicked1, clicked2, solution])}],
    
        Inset[Dynamic@solution, BaseStyle -> {Large}]
        },
        ImageSize -> 600, PlotRange -> {{-50, 50}, {-25, 25}}
       ]
      ],
     
     Initialization :> (
       SetAttributes[checkSolved, HoldAll]
       )
     
     ]);

Print[theo4[]];

Print[TextCell["Terzo criterio di congruenza", "Subsection"]];
Print[TextCell[
   "Se due triangoli hanno rispettivamente congruenti tutti e tre i \
lati, allora sono congruenti.", "Text", TextJustification -> 1]];

Print[Import[
   FileNameJoin[{NotebookDirectory[], directoryNumber, "terzocriterio.png"}]]];

Print[TextCell["Similitudine di triangoli", "Subsection"]];

Print[TextCell["Due triangoli si dicono simili quando:", "Text", 
   TextJustification -> 1]];
Print[TextCell["- Gli angoli corrispondenti sono congruenti", "Text", 
   TextJustification -> 1, ParagraphIndent -> 15]];
Print[TextCell["- I lati corrispondenti sono proporzionali", "Text", 
   TextJustification -> 1, ParagraphIndent -> 15]];
Print[TextCell[
   "Esistono pero' tre criteri di similitudine che mettono in \
relazione alcuni elementi dei triangoli", "Subsubtitle", 
   TextJustification -> 1]];

Print[TextCell["Primo criterio di similitudine", "Subsection"]];
Print[TextCell[
   "Due triangoli sono simili se hanno rispettivamente i due angoli congruenti.", 
   "Text", TextJustification -> 1]];

Print[Import[
   FileNameJoin[{NotebookDirectory[], directoryNumber,
     "primocriteriosimilitudine.png"}]]];

Print[TextCell["Secondo criterio di similitudine", "Subsection"]];

Print[TextCell["- Due lati del primo triangolo sono proporzionali ad altri due lati del secondo;", "Text", 
   TextJustification -> 1, ParagraphIndent -> 15]];
Print[TextCell["- L'angolo compreso tra i due lati del primo triangolo e' congruente all'angolo compreso tra i due lati dell'altro triangolo.", "Text", 
   TextJustification -> 1, ParagraphIndent -> 15]];

Print[Import[
   FileNameJoin[{NotebookDirectory[], directoryNumber,
     "secondocriteriosimilitudine.png"}]]];

Print[TextCell["Terzo criterio di similitudine", "Subsection"]];
Print[TextCell[
   "Due triangoli sono simili se hanno i tre lati rispettivamente proporzionali.", "Text", TextJustification -> 1]];

Print[Import[
   FileNameJoin[{NotebookDirectory[], directoryNumber,
     "terzocriteriosimilitudine.png"}]]]
