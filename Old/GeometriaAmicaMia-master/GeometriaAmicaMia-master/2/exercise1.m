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
         
         ImageSize -> 250,
         PlotRange -> {{-55, 55}, {-55, 55}},
         Axes -> False
         ]
    ]
    );


(* 
	Genera l'esercizio 1 di Talete con i 4 triangoli 
	
	Restituisce il triangolo iniziale, e altre 4 scelte,
	di cui tre errate per la soluzione dell'esercizio
*)
computeRectTriangles[] :=
    (
    Module[ {},
        pA = {RandomInteger[{-20, 0}], RandomInteger[{-20, 0}]};
        pB = {pA[[1]], RandomInteger[{20, 48}]};
        pC = {RandomInteger[{10, 48}], pA[[2]]};
        tExercise = 
         generateTriangleWithLabels[pA, pB, pC, 0, {1, 1}, {1, 0, 1}];
        
        (* triangolo giusto, ruotato e scalato *)
        tCorrect = 
         generateTriangleWithLabels[pA, pB, pC, 
          RandomInteger[{0, 360}], {1.2, 1.2}, {1, 0, 1} ];
        
        (* tringolo sbagliato 1 *)
        tWrong1 = 
         generateTriangleWithLabels[pA, pB, pC, 0, {1.2, 0.9}, {1, 0, 1} ];
        pA = {RandomInteger[{-20, 0}], RandomInteger[{-20, 0}]};
        pB = {pA[[1]], RandomInteger[{20, 48}]};
        pC = {RandomInteger[{10, 48}], pA[[2]]};
        
        (* tringolo sbagliato 2 *)
        tWrong2 = 
         generateTriangleWithLabels[pA, pB, pC, 
          RandomInteger[{0, 360}], {1, 1}, {1, 0, 1} ];
        pA = {RandomInteger[{-48, 0}], RandomInteger[{-48, 0}]};
        pB = {RandomInteger[{10, 48}], RandomInteger[{-48, 20}]};
        pC = {RandomInteger[{-48, 48}], RandomInteger[{20, 48}]};
        
        (* tringolo sbagliato 3 *)
        tWrong3 = 
         generateTriangleWithLabels[pA, pB, pC, 
          RandomInteger[{0, 360}], {1, 1}, {1, 1, 1} , 0];
        Return[{tExercise, tCorrect, tWrong1, tWrong2, tWrong3 }, Module]
    ]
    );
 
(* 
	Esegue operazioni in base alla correttezza dell'esercizio:
	- La sintesi volcale pronuncia l'esito
	- Una finestra di teto mostra l'esito
	- Il punteggio utente per l'esercizio corretnte viene aggiornato
*)
exercise1Correctedness[res_] :=
    (
    If[ res == 0,
        {Speak["La risposta e' sbagliata"];
         ModuleQuizAnswer[2,1,1];
         MessageDialog["La risposta e' sbagliata!"] },
        {Speak["La risposta e' corretta"];
         ModuleQuizAnswer[2,1,0];
         MessageDialog["La risposta e' corretta!"] }
    ];
   );
   
SetAttributes[printCorrectedness, HoldAll];


(* 
	Genera la parte visiva dell'esercizio con i vari bottoni 
*)
exercise21[] :=
    (
    Module[ {},
    	
        triangles = computeRectTriangles[];
        (* mostra triangolo originariamente proposto *)
        Print[triangles[[1]]];
        
        (* randomizza le 4 scelte, mantenendo aggiornato l'indice che corrisponde alla risposta corretta *)
        idxs = RandomSample[Range[4]];
        correctIdx = idxs[[1]];
        For[i = 1, i < Length[idxs], i++, 
         If[ idxs[[i]] == 1,
             { correctIdx = i },
             {}
         ]];
        answers = Take[triangles, -4][[idxs]];
        
        (* stampa la griglia con i 4 quattro bottoni contenenti le relative figure *)
        Print[Grid[{{
            Button[answers[[1]], 
             exercise1Correctedness[If[ correctIdx == 1,
                                                 1,
                                                 0
                                             ]]],
            Button[answers[[2]], 
             exercise1Correctedness[
              If[ correctIdx == 2,
                  1,
                  0
              ]]], 
            Button[answers[[3]], 
             exercise1Correctedness[If[ correctIdx == 3,
                                                 1,
                                                 0
                                             ]]],
            Button[answers[[4]], 
             exercise1Correctedness[If[ correctIdx == 4,
                                                 1,
                                                 0
                                             ]]]
            }}]];
            
    ]);
    
exercise21[];