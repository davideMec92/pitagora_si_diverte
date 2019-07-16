(* ::Package:: *)

LoginDone = False;

GetUserLoginGraphicInterface[]:=DynamicModule[{},

	If[ LoginDone == False, (
		Print[Style[ "Registrazione", "Title"]];
		Print[Style[ "Inserisci il tuo nome nel campo seguente per salvare i tuoi progressi", "Text"]];
		usernameText = Null;
		loginButton = Button[
					"Login",
					(
						If [ LoginDone == False, (
							usernameText = ToLowerCase[usernameText];
							userListData = AddUser[ usernameText ];
							ClearUserSession[];
							StartUserSession[ usernameText ];
							DisplayUserProgress[ userListData, loginButton ];
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
	)];
];

DisplayUserProgress[ userData_, loginButton_ ]:=Module[{},
	
	mainDirectory = NotebookDirectory[] <> "Images/";
	
	euclideEx1 = FileNameJoin[{ mainDirectory,"error.png"}];
	euclideEx2 = FileNameJoin[{ mainDirectory,"error.png"}];
	pitagoraEx1 = FileNameJoin[{ mainDirectory,"error.png"}];
	pitagoraEx2 = FileNameJoin[{ mainDirectory,"error.png"}];
	pitagoraEx3 = FileNameJoin[{ mainDirectory,"error.png"}];
	pitagoraEx4 = FileNameJoin[{ mainDirectory,"error.png"}];
		
	progressCounter = 0;
	
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









