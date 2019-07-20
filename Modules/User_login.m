(* ::Package:: *)

(*  

  /$$$$$$$ /$$  /$$                                                                /$$             /$$/$$                             /$$             
| $$__  $|__/ | $$                                                               |__/            | $|__/                            | $$             
| $$  \ $$/$$/$$$$$$   /$$$$$$  /$$$$$$  /$$$$$$  /$$$$$$    /$$$$$$      /$$$$$$$/$$        /$$$$$$$/$$/$$    /$$/$$$$$$  /$$$$$$ /$$$$$$   /$$$$$$ 
| $$$$$$$| $|_  $$_/  |____  $$/$$__  $$/$$__  $$/$$__  |____  $$     /$$_____| $      /$$__  $| $|  $$  /$$/$$__  $$/$$__  $|_  $$_/  /$$__  $$
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


(* Il presente modulo gestisce le funzioni, principalmente grafiche, del form di login utente. *)

(* Questa funzione si occupa di definire graficamente il from di login utente mediante l'utilizzo di un oggetto Grid, 
al suo interno troviamo un Button che richiama tutti i moduli necessari alla verifica e inizializzazione dei dati utente *)

Import["Modules/User.m"];

GetUserLoginGraphicInterface[]:=DynamicModule[{},

	Print[Style[ "Registrazione", "Title"]];
	Print[Style[ "Inserisci il tuo nome nel campo seguente per salvare i tuoi progressi", "Text"]];
	usernameText = "";
	loginButton = Button[
				"Login",
				(
					If[ StringLength[ usernameText ] == 0, 
					(
						MessageDialog[ "Il campo login non pu\[OGrave] essere vuoto, inserire un nome e riprovare"];
					),
					(
						usernameText = ToLowerCase[usernameText];
						userListData = AddUser[ usernameText ];
						ClearUserSession[];
						StartUserSession[ usernameText ];
						DisplayUserProgress[ userListData ];
					)
					
					];  
				)
			];
					
	userLoginGrid = Grid[{
		{Row[{
			InputField[ Dynamic[usernameText], String ],
			loginButton
		}]} 
	}, Frame->Transparent];
	
	Print[userLoginGrid];
];

(* La presente funzione riceve in input i progressi utente e costruisce, mediante l'utilizzo di un oggetto Grid, 
la relativa tabella riassuntiva. *)
DisplayUserProgress[ userData_ ]:=Module[{},
	
	mainDirectory = NotebookDirectory[] <> "Images/";
	
	(* Inzializzazione esercizi *)
	euclideEx1 = FileNameJoin[{ mainDirectory,"error.png"}];
	euclideEx2 = FileNameJoin[{ mainDirectory,"error.png"}];
	pitagoraEx1 = FileNameJoin[{ mainDirectory,"error.png"}];
	pitagoraEx2 = FileNameJoin[{ mainDirectory,"error.png"}];
	pitagoraEx3 = FileNameJoin[{ mainDirectory,"error.png"}];
	pitagoraEx4 = FileNameJoin[{ mainDirectory,"error.png"}];
		
	progressCounter = 0;
	
	(* Verifica esercizi svolti con successo *)
	If[ GetEuclideExercise1[userData] == 1, (euclideEx1 = FileNameJoin[{ mainDirectory,"checked.png"}]; progressCounter = progressCounter +1; )];
	If[ GetEuclideExercise2[userData] == 1, (euclideEx2 = FileNameJoin[{ mainDirectory,"checked.png"}]; progressCounter = progressCounter +1; ) ];
	If[ GetPitagoraExercise1[userData] == 1, (pitagoraEx1 = FileNameJoin[{ mainDirectory,"checked.png"}]; progressCounter = progressCounter +1; ) ];
	If[ GetPitagoraExercise2[userData] == 1, (pitagoraEx2 = FileNameJoin[{ mainDirectory,"checked.png"}]; progressCounter = progressCounter +1; ) ];
	If[ GetPitagoraExercise3[userData] == 1, (pitagoraEx3 = FileNameJoin[{ mainDirectory,"checked.png"}]; progressCounter = progressCounter +1; ) ];
	If[ GetPitagoraExercise4[userData] == 1, (pitagoraEx4 = FileNameJoin[{ mainDirectory,"checked.png"}]; progressCounter = progressCounter +1; ) ];	
	
	dialogHeaderGrid = Grid[{
	{Style["Benvenuto/a " <> ToString[userData[[1]]] <> " ecco i tuoi progressi", "Subtitle"] }
		
	 }, Frame->None, Alignment->Center, BaselinePosition->Center, ItemSize->Full ];
	
	userProgressgrid = Grid[{
	{"Eculide Es.1", "Euclide es.2", "Pitagora es.1", "Pitagora es.2", "Pitagora es.3", "Pitagora es.4"},
	{Image[ Import[euclideEx1], ImageSize->Tiny],
	 Image[ Import[euclideEx2], ImageSize->Tiny],
	 Image[ Import[pitagoraEx1], ImageSize->Tiny],
	 Image[ Import[pitagoraEx2], ImageSize->Tiny],
	 Image[ Import[pitagoraEx3], ImageSize->Tiny],
	 Image[ Import[pitagoraEx4], ImageSize->Tiny]}
		 
	 }, Frame->None, Alignment->Center, BaselinePosition->Center, ItemSize->Full ];

	MessageDialog[
		Import[ FileNameJoin[{ mainDirectory,"cartello.png"}], ImageSize->Medium ];
		dialogHeaderGrid 
		userProgressgrid
		Style[Row[{ProgressIndicator[ ( progressCounter * 1 )/6, ImageSize->Large ], " Esercizi completati " <> ToString[ progressCounter],  " di 6"}], "Text"],
		WindowSize->Automatic
	];
	
];









