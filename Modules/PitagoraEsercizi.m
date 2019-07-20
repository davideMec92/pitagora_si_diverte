(* ::Package:: *)

(*  

  /$$$$$$$ /$$  /$$                                                                /$$             /$$/$$                             /$$             
| $$__  $|__/ | $$                                                               |__/            | $|__/                            | $$             
| $$  \ $$/$$/$$$$$$   /$$$$$$  /$$$$$$  /$$$$$$  /$$$$$$    /$$$$$$      /$$$$$$$/$$       /$$$$$$$/$$/$$    /$$/$$$$$$  /$$$$$$ /$$$$$$   /$$$$$$ 
| $$$$$$$| $|_  $$_/  |____  $$/$$__  $$/$$__  $$/$$__  |____  $$     /$$_____| $       /$$__  $| $|  $$  /$$/$$__  $$/$$__  $|_  $$_/  /$$__  $$
| $$____/| $$ | $$     /$$$$$$| $$  \ $| $$  \ $| $$  \__//$$$$$$$     |  $$$$$$| $$     | $$  | $| $$\  $$/$$| $$$$$$$| $$  \__/ | $$   | $$$$$$$$
| $$     | $$ | $$ /$$/$$__  $| $$  | $| $$  | $| $$     /$$__  $$      \____  $| $$     | $$  | $| $$ \  $$$/| $$_____| $$      | $$ /$| $$_____/
| $$     | $$ |  $$$$|  $$$$$$|  $$$$$$|  $$$$$$| $$    |  $$$$$$$       /$$$$$$$| $$     |  $$$$$$| $$  \  $/ |  $$$$$$| $$       |  $$$$|  $$$$$$$
|__/     |__/  \___/  \_______/\____  $$\______/|__/     \_______/      |_______/|__/       \_______|__/   \_/   \_______|__/        \___/  \_______/
                               /$$  \ $$                                                                                                             
                              |  $$$$$$/                                                                                                             
                               \______/                                                                                                              

Progetto d'esame di Matematica computazionale
Anno accademico 2018-2019

Sviluppato su Wolfram Mathematica 11.3
							   
							   
Davide Nunzio Maccarrone (0000843825)
Bruno Quintero Panaro 	 (0000850912)  
*)


(* In questo modulo sono presenti funzioni per la rappresentazione grafica dei 4 esercizi su Pitagora e la loro verifica *)

Import["Modules/File_manager.m"];
Import["Modules/EuclideEsercizi.m"];

xFirstPoint = null;
yFirstPoint = null;
xSecondPoint = null;
ySecondPoint = null;

(* Modulo generale che gestisce i quattro diversi moduli relativi a diversi esercizi *)
ModulePitagoraEsercizi[] := Module[{},


(* Sezione riproduzione audio teorema *)


 
 pitagoraEserciziStartButton = Button[
					Image[ Import[ NotebookDirectory[] <> "Images/hophop.png" ], ImageSize->Medium ],
					(
						userSessionName = GetUserSession[];
						
						If[ userSessionName != "", ( 
							
							userData = AddUser[ userSessionName ];
						
							If[ userData[[GetIndexEx1Euclide[]]] == 0, (
								MessageDialog[ "E' necessario completare il primo esercizio nella sezione relativa ad Euclide prima di procedere"];
							), (
								If[ userData[[GetIndexEx2Euclide[]]] == 0, (
									MessageDialog[ "E' necessario completare il secondo esercizio nella sezione relativa ad Euclide prima di procedere"];
								), (
									PitagoraEsercizio1[];
                                    PitagoraEsercizio2[];
                                    PitagoraEsercizio3[];
                                    PitagoraEsercizio4[];
								)];
							
							) ];
						), (
							MessageDialog[ "E' necessario effettuare il login, dal menu utente, prima di procedere"];
						)];
					),
				FrameMargins->None,
				Background->None,
				Appearance->"Frameless"
];
				
				
 EserciziBGrid = Grid[{
{"", pitagoraEserciziStartButton },
{"",Style[ "       Clicca per iniziare gli esercizi!","Text"]}
}, ItemSize->{{Scaled[0.28], Scaled[0.3]}}];


 Print[EserciziBGrid];
 
 
 Print["\n\n"];
 
 	Print[Grid[
				{{Button["Slide Precedente",NotebookLocate["_PitagoraEsempi"],Background -> RGBColor[29,131,118],FrameMargins->Medium],"","",Button["Torna alla Home",NotebookLocate["_intro"],Background -> RGBColor[29,131,118],FrameMargins->Medium]}},
		 		ItemSize -> {{Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber]}}, Frame -> Transparent
		 	]];
	
];

(* Questa funzione rappresenta graficamente il corrispondente esercizio su Pitagora e ne verifica la
correttezza matematica, salvando i progressi utente in caso di esito positivo. In questa funzione vengono 
preimpostate 3 semplici terne pitagoriche. Da queste viene prelevata, in modo randomico, la terne che apparir\[AGrave]
nell'esericizio all'utente. *)
PitagoraEsercizio1[] := DynamicModule[{},
	
	pitagorasTriads = List[{3,4,5},{5,12,13},{7,24,25}];
	n = RandomInteger[{1, 3}];
	
	Print[Style[ "Data la triade pitagorica a,b,c determinare b sapendo che a = " <> ToString[pitagorasTriads[[n,1]]] <> " e c = " <> ToString[pitagorasTriads[[n,3]]], "Text"]];
	Print[Style[ "Nel caso di risultato con cifre decimali, arrotondare alla prima cifra", "Text"]];
	
	resultEx1 = N[pitagorasTriads[[n,2]], 2];
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
						If[ GetPitagoraExercise1[userData] == 1, 
						(
							MessageDialog[ "Hai gi\[AGrave] completato con successo questo esercizio!"];
						),
						(
							(* Verifico risultato esercizio *)
							If [ EqualTo[ ToExpression[ userValue1 ] ][ ToExpression[ resultEx1 ] ], (											
								
								(* Aggiorno progressi utente *)
								userData[[GetIndexEx1Pitagora[]]] = 1;
								SaveUserData[ userData];
								MessageDialog[ "Complimenti, risposta esatta!"];
							), (
								MessageDialog[ "Risposta errata, riprova!"];
							)];
							
						) ];
						
					), (
						MessageDialog[ "E' necessario effettuare il login, dal menu utente, prima di procedere"];
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

(* Questa funzione rappresenta graficamente il corrispondente esercizio su Pitagora e ne verifica la
correttezza matematica, salvando i progressi utente in caso di esito positivo. La funzione presente \[EGrave]
una "complicazione" dell'esercizio 1 su Pitagora, viene generata randomicamente una terna pitagorica che 
rispetti la relazione a^2 + b^2 = c^2 *)
PitagoraEsercizio2[] := Module[{},
	
	m = RandomInteger[{5, 10}];
	n = RandomInteger[{1, 10}];
	
	While[ n >= m, n = RandomInteger[{1, 10}]; ];
	
	a = ( m^2 - n^2 );
	b = (2 * m * n);
	c = (m^2 + n^2);
	
	Print[Style[ "Data la triade pitagorica a,b,c determinare b sapendo che a = " <> ToString[a] <> " e c = " <> ToString[c], "Text"]];
	Print[Style[ "Nel caso di risultato con cifre decimali, arrotondare alla prima cifra", "Text"]];
	
	resultEx2 = N[b, 2];
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
						If[ GetPitagoraExercise2[userData] == 1, 
						(
							MessageDialog[ "Hai gi\[AGrave] completato con successo questo esercizio!"];
						),
						(
							(* Verifico risultato esercizio *)
							If [ EqualTo[ ToExpression[ userValue2 ] ][ ToExpression[ resultEx2 ] ], (	
																	
								(* Aggiorno progressi utente *)
								userData[[GetIndexEx2Pitagora[]]] = 1;
								SaveUserData[ userData];
								MessageDialog[ "Complimenti, risposta esatta!"];
							), (
								MessageDialog[ "Risposta errata, riprova!"];
							)];
							
						) ];
						
					), (
						MessageDialog[ "E' necessario effettuare il login, dal menu utente, prima di procedere"];
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



(* Questa funzione rappresenta graficamente il corrispondente esercizio su Pitagora e ne verifica la
correttezza matematica, salvando i progressi utente in caso di esito positivo  *)
PitagoraEsercizio3[] := Module[{},
	
	exerciseImage = Graphics[{
	{EdgeForm[{Gray}],LightBlue,Polygon[{{6,2},{10,0},{12,4},{8,6}}]},
	{EdgeForm[{Gray}],LightPurple,Rectangle[{5,0},{10,-5}]},
	{EdgeForm[{Gray}],LightGray,Triangle[{{5,0},{6,2},{10,0}}]},
	{EdgeForm[{Blue}],LightGray, Polygon[{{6,2},{6.2,1.9},{6.1,1.7},{5.9,1.8}}]},

	{EdgeForm[{Gray}],LightRed,Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
			Black,
			Text[Style[ Subscript[Q,c1] ,"Subtitle",Bold],{4.5,1.5}],
			Text[Style[ Subscript[Q,c2] ,"Subtitle",Bold],{9,3}],
			Text[Style[ Subscript[Q,"i"] ,"Subtitle",Bold],{7.5,-2.5}],
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "B" ,"Text",Bold],{5.97,2.25}],
			Text[Style[ "C" ,"Text",Bold],{10.2,-0.2}],
			Text[Style[ "5 cm" ,"Text",Bold],{7.5,-0.2}],
			Text[Style[ "6 cm" ,"Text",Bold],{8,1.4}],
			Text[Style[ "?" ,"Text",Bold],{5.35,1.2}]
	},ImageSize->{600,500}, Axes->False];
	
	Print[ exerciseImage ];
	Qc1 = ToString[Subscript["Q","c1"], FormatType -> StandardForm];
	Print[Style[ "Dato il triangolo ABC, calcolare la lunghezza del cateto AB e l'area del quadrato " <> Qc1 <> " sapendo che il lato AC \[EGrave] lungo 5cm e il lato BC \[EGrave] lungo 6cm", "Text"]];
	Print[Style[ "Nel caso di risultato con cifre decimali, arrotondare alla prima cifra", "Text"]];
	
	ac = 5;
	bc = 6;
	
	resultEx3 = N[(Sqrt[ (bc)^2 - ( ac )^2 ])^2, 3];
	userValue3 = null;
		
	verifyButton3 = Button[
				"Verifica",
				(	
					(* Ottengo username utente attualente in sessione *)
					userSessionName = GetUserSession[];
						
					(* Verifico se \[EGrave] presente un utente in sessione *)
					If[ userSessionName != "", (
										
						(* Ottengo dati utente *)	
						userData = AddUser[ userSessionName ];
							
						(* Verifico se l'utente ha gi\[AGrave] completato con successo l'esercizio attuale *)
						If[ GetPitagoraExercise3[userData] == 1, 
						(
							MessageDialog[ "Hai gi\[AGrave] completato con successo questo esercizio!"];
						),
						(
							(* Verifico risultato esercizio *)
							If [ EqualTo[ ToExpression[ userValue3 ] ][ ToExpression[ resultEx3 ] ], (											
							
								(* Aggiorno progressi utente *)
								userData[[GetIndexEx3Pitagora[]]] = 1;
								SaveUserData[ userData];
								MessageDialog[ "Complimenti, risposta esatta!"];
							), (
								MessageDialog[ "Risposta errata, riprova!"];
							)];
							
						) ];
						
					), (
						MessageDialog[ "E' necessario effettuare il login, dal menu utente, prima di procedere"];
					)];		
							  
				)
			];
					
	userExercise3Verify = Grid[{
		{Row[{
			InputField[ Dynamic[userValue3], String ],
			verifyButton3
		}]} 
	}, Frame->Transparent];
	
	Print[userExercise3Verify];
	

];

(* Questa funzione rappresenta graficamente il corrispondente esercizio su Pitagora e ne verifica la
correttezza matematica, salvando i progressi utente in caso di esito positivo  *)
PitagoraEsercizio4[] := Module[{},
	
	mainDirectory = NotebookDirectory[] <> "Images/";
	
	ex1Image = Import[ FileNameJoin[{ mainDirectory,"diagonal_distance_square.png"}] ];
	
	suggestionButton = Button[
				"Suggerimento?",
				(					
					MessageDialog[
						Image[ ex1Image, ImageSize->Medium ]
					];				  
				)
			];
			
	Print[suggestionButton];
	
	(* Genero le coordinate del primo punto in modo casuale con un range tra 1 e 4 *)
	xFirstPoint = GenerateRandomInt[];
	yFirstPoint = GenerateRandomInt[];
	
	(* Genero la coordinata x del secondo punto in modo casuale con un range tra 1 e 4 *)
	xSecondPoint = GenerateRandomInt[];
	
	(* Nel caso la coordinata x del secondo punto sia uguale a quella del primo punto
	la rigenero fino ad ottenerne una differente *)
	While[ xSecondPoint == xFirstPoint, xSecondPoint = GenerateRandomInt[]; ];
	
	(* Genero la coordinata y del secondo punto in modo casuale con un range tra 1 e 4 *)
	ySecondPoint = GenerateRandomInt[];
	
	(* Nel caso la coordinata y del secondo punto sia uguale a quella del primo punto
	la rigenero fino ad ottenerne una differente *)
	While[ ySecondPoint == yFirstPoint, ySecondPoint = GenerateRandomInt[]; ];
	
	(* Rappresento sul piano cartesiano i punti cos\[IGrave] ottenuti *)
	cartesianPlot = ListPlot[ {{ xFirstPoint, yFirstPoint}, {xSecondPoint, ySecondPoint} }->{"A","B"}, LabelingFunction->Above, ImageSize->Large, PlotStyle->{ Dashed, PointSize[Large] }, AspectRatio->1, PlotRange-> {{2.5,2.5}, {2.5,2.5}}, GridLines-> Automatic];
   
    (* Stampo plot *)
    Print[cartesianPlot];
    
    distanceResult = N[Sqrt[ (xFirstPoint - xSecondPoint )^2 + ( yFirstPoint - ySecondPoint )^2 ], 2];
        
	Print[Style[ "Calcola la distanza tra i due punti A e B sul piano cartesiano", "Text"]];
	Print[Style[ "Nel caso di risultato con cifre decimali, arrotondare alla prima cifra", "Text"]];
		
	userValue4 = null;
		
	verifyButton = Button[
				"Verifica",
				(					
					(* Ottengo username utente attualente in sessione *)
					userSessionName = GetUserSession[];
						
					(* Verifico se \[EGrave] presente un utente in sessione *)
					If[ userSessionName != "", (
								
						(* Ottengo dati utente *)			
						userData = AddUser[ userSessionName ];
							
						(* Verifico se l'utente ha gi\[AGrave] completato con successo l'esercizio attuale *)
						If[ GetPitagoraExercise4[userData] == 1, 
						(
							MessageDialog[ "Hai gi\[AGrave] completato con successo questo esercizio!"];
						),
						(
							(* Verifico risultato esercizio *)
							If [ EqualTo[ ToExpression[ userValue4 ] ][ ToExpression[ distanceResult ] ], (											
							
								(* Aggiorno progressi utente *)
								userData[[GetIndexEx4Pitagora[]]] = 1;
								SaveUserData[ userData];
								MessageDialog[ "Complimenti, risposta esatta!"];
							), (
								MessageDialog[ "Risposta errata, riprova!"];
							)];
							
						) ];
						
					), (
						MessageDialog[ "E' necessario effettuare il login, dal menu utente, prima di procedere"];
					)];
									  
				)
			];
					
	userExercise4Verify = Grid[{
		{Row[{
			InputField[ Dynamic[userValue4], String ],
			verifyButton
		}]} 
	}, Frame->Transparent];
	
	Print[userExercise4Verify];
];

GenerateRandomInt[] := Module[{ randomInt },

	randomInt = RandomInteger[{1, 4}];

	Return[ randomInt ];
	
];

(* Funzione che restituisce l'indice, nella lista dei progressi utente, relativa
all'esercizio 1 di Pitagora *)
GetIndexEx1Pitagora[]:=Module[{index},
   index = 4;
   Return[index];
];

(* Funzione che restituisce l'indice, nella lista dei progressi utente, relativa
all'esercizio 2 di Pitagora *)
GetIndexEx2Pitagora[]:=Module[{index},
   index = 5;
   Return[index];
];

(* Funzione che restituisce l'indice, nella lista dei progressi utente, relativa
all'esercizio 3 di Pitagora *)
GetIndexEx3Pitagora[]:=Module[{index},
   index = 6;
   Return[index];
];

(* Funzione che restituisce l'indice, nella lista dei progressi utente, relativa
all'esercizio 4 di Pitagora *)
GetIndexEx4Pitagora[]:=Module[{index},
   index = 7;
   Return[index];
];
