(* 
	Genera un triangolo con etichette, scalato e ruotato
	
	aP_, bP_, cP_: coordinate dei tre punti
	rot_: gradi di rotazione della figura, 0 default
	sca_: coefficente di scala della figura, 1 default
	lens_: valori booleani per indicare se mostrare l'etichetta con lungheza segmento
	rectA_: valore booleano per richiedere angolo retto in A
	labels_: etichette da visualizzare per i tre punti
 *)
generateTriangleWithLabels[aP_, bP_, cP_, rot_ : 0,  sca_ : {1, 1}, 
   lens_ : {1, 1, 1}, rectA_ : 1, labels_ : {"A", "B", "C"}] :=
    (
    Module[ {
    (* inizializzazione trasformazioni *)
    
    r = RotationTransform[rot Degree],
    s = ScalingTransform[sca , {0, 0}],
    
    (* calcolo lunghezze segmenti e punti medi in cui inserire le eventuali etichette *)
    
    midAB = {((aP [[1]] + bP [[1]])/ 2), ((aP[[2]] + bP[[2]])/ 2)},
    lenAB = 
    Sqrt[(aP [[1]] * sca[[1]] - 
    bP [[1]] * sca[[1]])^2 + (aP[[2]] * sca[[2]] - 
    bP[[2]] * sca[[2]])^2],
    midBC = {((cP [[1]] + bP [[1]])/ 2), ((cP[[2]] + bP[[2]])/ 2)},
    lenBC = 
    Sqrt[(cP [[1]] * sca[[1]] - 
    bP[[1]] * sca[[1]])^2 + (cP[[2]] * sca[[2]] - 
    bP[[2]] * sca[[2]])^2],
    midAC = {((aP [[1]] + cP [[1]])/ 2), ((aP[[2]] + cP[[2]])/ 2)},
    lenAC = 
    Sqrt[(aP [[1]] * sca[[1]] - 
    cP [[1]] * sca[[1]])^2 + (aP[[2]] * sca[[2]] - 
    cP[[2]] * sca[[2]])^2]
    },
        centroid = 
         RegionCentroid[Triangle[{s[r[aP]], s[r[bP]], s[r[cP]]}]];
        t = TranslationTransform[{-centroid[[1]], -centroid[[2]]}];
        Graphics[{
          (* disegna triangolo *)
          LightBlue, 
          Triangle[{t[s[r[aP]]], t[s[r[bP]]], t[s[r[cP]]]}],
          (* disegna etichette punti *)
           Black,
          Translate[
           Text[labels[[1]], t[s[r[aP]]], 
            BaseStyle -> {FontSize -> Medium}], {-5, -5}],
          Translate[
           Text[labels[[2]], t[s[r[bP]]], 
            BaseStyle -> {FontSize -> Medium}], {5, -5}],
          Translate[
           Text[labels[[3]], t[s[r[cP]]], 
            BaseStyle -> {FontSize -> Medium}], {0, 5}],
          (* disegna i punti *)
          Disk[t[s[r[aP]]], .5],
          Disk[t[s[r[bP]]], .5],
          Disk[t[s[r[cP]]], .5],
          
          (* disegna etichette segmenti *)
          Black,
          If[ lens[[1]] > 0,
              Text[IntegerPart[lenAB], t[s[r[midAB]]], 
               BaseStyle -> {FontSize -> Medium}],
              {}
          ],
          If[ lens[[2]] > 0,
              Text[IntegerPart[lenBC], t[s[r[midBC]]], 
               BaseStyle -> {FontSize -> Medium}],
              {}
          ],
          If[ lens[[3]] > 0,
              Text[IntegerPart[lenAC], t[s[r[midAC]]], 
               BaseStyle -> {FontSize -> Medium}],
              {}
          ],
          If[ rectA > 0,
              {EdgeForm[Thin], Transparent, 
              Rotate[Rectangle[
              t[s[r[aP]]], {t[s[r[aP]]][[1]] + 5, t[s[r[aP]]][[2]] + 5}], 
              rot Degree, t[s[r[aP]]]]},
              {}
          ]
          },
         
         ImageSize -> 300,
         PlotRange -> {{-55, 55}, {-55, 55}},
         Axes -> False
         ]
    ]
    );

(* 
	Genera due triangoli simili
*)
computeTriangles[] :=
    (
    Module[ {},
        pA = {RandomInteger[{-48, 0}], RandomInteger[{-48, 0}]};
        pB = {RandomInteger[{10, 48}], RandomInteger[{-48, 20}]};
        pC = {RandomInteger[{-43, 40}], RandomInteger[{20, 40}]};
        t1 = generateTriangleWithLabels[pA, pB, pC , 
          0, {1, 1}, {0, 0, 0}, 0];
        t2 = generateTriangleWithLabels[pA, pB, pC , 
          0, {1, 1}, {0, 0, 0}, 0, {"A'", "B'", "C'"}];
        Return[{t1, t2}, Module]
    ]
    );


(* 
	Esegue operazioni in base alla correttezza dell'esercizio:
	- La sintesi volcale pronuncia l'esito
	- Una finestra di teto mostra l'esito
	- Il punteggio utente per l'esercizio corretnte viene aggiornato
*)
exercise3Correctedness[corr_, actual_, exe_] :=
    (
    If[ corr[[1]] != actual[[1]] || (corr[[2]] != actual[[2]] && corr[[2]] != -1),
        {
        		If[corr[[1]] == 1 && corr[[1]] == actual[[1]] && actual[[2]] == -1, 
        			{
        				Speak["Risposta incompleta. rispondi ad entrambe le domande!"];
			        MessageDialog["Risposta incompleta. rispondi ad entrambe le domande!"]
        			}, 
        			{
    					Speak["La risposta \[EGrave] sbagliata"];
		         	ModuleQuizAnswer[2,exe,0];
			        MessageDialog["La risposta \[EGrave] sbagliata!"]
        			}]
	        
         },
        {Speak["La risposta \[EGrave] corretta"];
         ModuleQuizAnswer[2,exe,1];
         MessageDialog["La risposta \[EGrave] corretta!"]}
    ];
   );

(* 
	Genera l'esercizio 2 punto A: trinagoli simili per il primo criterio
*)
exercise23LLA[] :=
    (
    Module[ {},
        Print[Style["Date le seguenti condizioni determinare se i due triangoli sono congruenti:", "Subsubtitle"]];
        
        triangles = computeTriangles[];
        
        Print[Grid[{{
            triangles[[1]],
            triangles[[2]]
            }}]];
            
        Print[Style["Si sa che sono congruenti", "Subsubtitle"]];
        
        points0 = 
         RandomSample[{"i lati AB con A'B'", "i lati AC con A'C'", 
           "l'angolo in A con A'"}];
        For[i = 1, i <= Length[points0], 
         i++, { CellPrint[{TextCell[Row[{points0[[i]]}], {"Item"}]}] }];
         
        Print[Style["I triangoli sono congruenti?", "Subsubtitle"]];
        
        ex1LLAAnswer = -1;
        Print[
         RadioButtonBar[Dynamic[ex1LLAAnswer], {1 -> "S\[IGrave]" , 0 -> "No"}]];
         
        Print[
         Style["Se s\[IGrave], per quale criterio di congruenza?", "Subsubtitle"]];
         
        ex2LLAAnswer = -1;
        Print[
         RadioButtonBar[
          Dynamic[ex2LLAAnswer], {1 -> "Primo criterio" , 
           0 -> "Secondo criterio", 2 -> "Terzo criterio"}]];
           
        Print[
         Button["Verifica l'esercizio", 
          exercise3Correctedness[{1, 1}, {ex1LLAAnswer, ex2LLAAnswer}, 
           2], Background -> LightGray, FrameMargins -> Large]];
           
    ]);


(* 
	Genera l'esercizio 2 punto B: triangoli non simili
*)
exercise23AAA[] :=
    (
    Module[ {},
        Print[Style["Date le seguenti condizioni determinare se i due triangoli sono congruenti:", "Subsubtitle"]];
        
        triangles = computeTriangles[];
        
        Print[Grid[{{
            triangles[[1]],
            triangles[[2]]
            }}]];
            
        Print[Style["Si sa che sono congruenti", "Subsubtitle"]];
        
        points0 = 
         RandomSample[{"l'angolo in A con A'", "l'angolo in B con B'", 
           "l'angolo in C con C'"}];
           
        For[i = 1, i <= Length[points0], 
         i++, { CellPrint[{TextCell[Row[{points0[[i]]}], {"Item"}]}] }];
         
        Print[Style["I triangoli sono congruenti?", "Subsubtitle"]];
        
        ex1AAAAnswer = -1;
        Print[
         RadioButtonBar[Dynamic[ex1AAAAnswer], {0 -> "S\[IGrave]" , 1 -> "No"}]];
         
        Print[
         Style["Se s\[IGrave], per quale criterio di congruenza?", "Subsubtitle"]];
         
        ex2AAAAnswer = -1;
        Print[
         RadioButtonBar[
          Dynamic[ex2AAAAnswer], {1 -> "Primo criterio" , 
           0 -> "Secondo criterio", 2 -> "Terzo criterio"}]];
           
        Print[
         Button["Verifica l'esercizio", 
          exercise3Correctedness[{1, -1}, {ex1AAAAnswer, ex2AAAAnswer}, 
           3], Background -> LightGray, FrameMargins -> Large]];
          
    ]);


(* 
	Genera l'esercizio 2 punto C: triangoli non simili
*)
exercise23LLAW[] :=
    (
    Module[ {},
        Print[Style["Date le seguenti condizioni determinare se i due triangoli sono congruenti:", "Subsubtitle"]];
        
        triangles = computeTriangles[];
        
        Print[Grid[{{
            triangles[[1]],
            triangles[[2]]
            }}]];
            
        Print[Style["Si sa che sono congruenti", "Subsubtitle"]];
        
        points0 = 
         RandomSample[{"i lati AB con A'B'", "i lati BC con B'C'", 
           "l'angolo in A con A'"}];
           
        For[i = 1, i <= Length[points0], 
         i++, { CellPrint[{TextCell[Row[{points0[[i]]}], {"Item"}]}] }];
         
        Print[Style["I triangoli sono congruenti?", "Subsubtitle"]];
        
        ex1LLAWAnswer = -1;
        Print[
         RadioButtonBar[
          Dynamic[ex1LLAWAnswer], {0 -> "S\[IGrave]" , 1 -> "No"}]];
          
        Print[
         Style["Se s\[IGrave], per quale criterio di congruenza?", "Subsubtitle"]];
         
        ex2LLAWAnswer = -1;
        Print[
         RadioButtonBar[
          Dynamic[ex2LLAWAnswer], {1 -> "Primo criterio" , 
           0 -> "Secondo criterio", 2 -> "Terzo criterio"}]];
           
        Print[
         Button["Verifica l'esercizio", 
          exercise3Correctedness[{1, -1}, {ex1LLAWAnswer, ex2LLAWAnswer}, 
           4], Background -> LightGray, FrameMargins -> Large]];

    ]);

exercise23LLA[];
exercise23AAA[];
exercise23LLAW[];
