(* ::Package:: *)

(* Il modulo include una funzione generale "ModuleEuclideEsercizi" che richiama le diverse funzioni relative alla
rappresentazione grafica e alla verifica degli esercizi *)

Import["Modules/File_manager.m"];
Import["Modules/User.m"];

ModuleEuclideEsercizi[]:=Module[{},
	EuclideEsercizio1[];
	EuclideEsercizio2[];
	
	Print[Grid[
				{{Button["Slide Precedente",NotebookLocate["_EuclideEsempi"],Background -> RGBColor[29,131,118],FrameMargins->Medium],"","",Button["Torna alla Home",NotebookLocate["_intro"],Background -> RGBColor[29,131,118],FrameMargins->Medium]}},
		 		ItemSize -> {{Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber]}}, Frame -> Transparent
		 	]];

];

(* Funzione che rappresenta graficamente la sezione del primo esercizio su Euclide e ne verfica la correttezza matematica *)
EuclideEsercizio1[]:=Module[{},

ecuclideEsercizio1Grafico = Graphics[{
	{EdgeForm[{Gray}],White,Triangle[{{5,0},{6,2},{10,0}}]},
	{EdgeForm[{Blue}],White, Polygon[{{6,2},{6.2,1.9},{6.1,1.7},{5.9,1.8}}]},
	{EdgeForm[{Dashed}],Dashed, Opacity[0.7],Line[{{6,2},{6,0}}]},
			Black,
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "C" ,"Text",Bold],{5.97,2.25}],
			Text[Style[ "B" ,"Text",Bold],{10.2,-0.2}],
			Text[Style[ "10 cm" ,"Text",Bold],{7.5, -0.2}],
			Text[Style[ "2.5 cm" ,"Text",Bold],{5.5, -0.2}],
			Text[Style[ "H" ,"Text",Bold],{6.2,-0.2}]
	},ImageSize-> Medium,
Axes->False];

Print[ecuclideEsercizio1Grafico];

Print[Style[ "Calcolare la lunghezza del lato AC del triangolo rettangolo la cui ipotenusa misura 10 cm e la proiezione del cateto minore sull'ipotenusa misura 2.5 cm","Text"]];
Print[Style[ "Nel caso di risultato con cifre decimali, arrotondare alla prima cifra", "Text"]];
	
resultEx1 = N[ Sqrt[(10*2.5)], 2];
	
	userValue1 = null;
	
	verifyButton1 = Button[
				"Verifica",
				(	
					(* Ottengo username utente attualente in sessione *)
					userSessionName = GetUserSession[];
						
					(* Verifico se \[EGrave] presente un utente in sessione *)
					If[ userSessionName != "", (
									
						(* Ottengo dati utente *)		
						userData = AddUser[ userSessionName ];
						
						(* Verifico se l'utente ha gi\[AGrave] completato con successo l'esercizio attuale *)
						If[ GetEuclideExercise1[userData] == 1, 
						(
							MessageDialog[ "Hai gi\[AGrave] completato con successo questo esercizio!"];
						),
						(
							(* Verifico risultato esercizio *)
							If [ EqualTo[ ToExpression[ userValue1 ] ][ ToExpression[ resultEx1 ] ], (	
							
								(* Aggiorno progressi utente *)
								userData[[GetIndexEx1Euclide[]]] = 1;
								SaveUserData[ userData];
								MessageDialog[ "Complimenti, risposta esatta!"];
							), (
								MessageDialog[ "Risposta errata, riprova!"];
							)];
							
						) ];
						
					),(
						MessageDialog[ "Esegui prima il login, per svolgere gli esercizi"];
					)];						  
				)
			];
					
	userExercise1Verify = Grid[{
		{Row[{
			InputField[ Dynamic[userValue1], String ],
			verifyButton1
		}]} 
	}, Frame->Transparent];
	
	Print[userExercise1Verify];

];

EuclideEsercizio2[]:=Module[{},

ecuclideEsercizio1Grafico = Graphics[{
	{EdgeForm[{Gray}],White,Triangle[{{5,0},{6,2},{10,0}}]},
	{EdgeForm[{Blue}],White, Polygon[{{6,2},{6.2,1.9},{6.1,1.7},{5.9,1.8}}]},
	{EdgeForm[{Dashed}],Dashed, Opacity[0.7],Line[{{6,2},{6,0}}]},
			Black,
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "C" ,"Text",Bold],{5.97,2.25}],
			Text[Style[ "B" ,"Text",Bold],{10.2,-0.2}],
			Text[Style[ "10 cm" ,"Text",Bold],{7.5, -0.2}],
			Text[Style[ "4.9 cm" ,"Text",Bold],{5.5, -0.2}],
			Text[Style[ "H" ,"Text",Bold],{6.2,-0.2}]
	},ImageSize-> Medium,
Axes->False];

Print[ecuclideEsercizio1Grafico];

Print[Style[ "Calcolare il perimetro del triangolo rettangolo la cui ipotenusa misura 10 cm e la proiezione del cateto minore sull'ipotenusa misura 4.9 cm","Text"]];
Print[Style[ "Nel caso di risultato con cifre decimali, arrotondare alla seconda cifra", "Text"]];
	
ac = N[ Sqrt[(10*4.9)], 2];
bh = 10 - 4.9;
bc = N[ Sqrt[(10*bh)], 2];

resultEx2 = N[ (10 + 7 + 7.14), 2];

userValue2 = null;
verifyButton2 = Button[
			"Verifica",
			(
				(* Ottengo username utente attualente in sessione *)
				userSessionName = GetUserSession[];
				
				(* Verifico se \[EGrave] presente un utente in sessione *)
				If[ userSessionName != "", (
									
					(* Ottengo dati utente *)		
					userData = AddUser[ userSessionName ];
					
					(* Verifico se l'utente ha gi\[AGrave] completato con successo l'esercizio attuale *)
					If[ GetEuclideExercise2[userData] == 1, 
					(
						MessageDialog[ "Hai gi\[AGrave] completato con successo questo esercizio!"];
					),
					(
						(* Verifico risultato esercizio *)
						If [ EqualTo[ ToExpression[ userValue2 ] ][ ToExpression[ resultEx2 ] ], (
							
							(* Aggiorno progressi utente *)
							userData[[GetIndexEx2Euclide[]]] = 1;
							SaveUserData[ userData];
							MessageDialog[ "Complimenti, risposta esatta!"];
						), (
							MessageDialog[ "Risposta errata, riprova!"];
						)];
							
					) ];
						
				),(
					MessageDialog[ "Esegui prima il login, per svolgere gli esercizi"];
				)];	
								  
			)
		];
					
	userExercise2Verify = Grid[{
		{Row[{
			InputField[ Dynamic[userValue2], String ],
			verifyButton2
		}]} 
	}, Frame->Transparent];
	
	Print[userExercise2Verify];

];

(* Funzione che restituisce l'indice, della lista progressi utente, relativo all'esercizio 1 di Euclide *)
GetIndexEx1Euclide[]:=Module[{index},
   index = 2;
   Return[index];
];

(* Funzione che restituisce l'indice, della lista progressi utente, relativo all'esercizio 2 di Euclide *)
GetIndexEx2Euclide[]:=Module[{index},
   index = 3;
   Return[index];
];
