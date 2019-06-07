(* ::Package:: *)

LoginDone = False;

GetUserLoginGraphicInterface[]:=DynamicModule[{},

	If[ LoginDone == False, (
		Print[Style[ "Registrazione", "Title"]];
		Print[Style[ "Inserisci il tuo nome nel campo seguente per salvare i tuoi progressi", "Text"]];
		usernameText = Null;
		loginButton = Button[
					"Inserisci il tuo nome",
					(
						If [ LoginDone == False, (
							usernameText = ToLowerCase[usernameText];
							userListData = AddUser[ usernameText ];						
							Print[Style[ "Benvenuto/a " <> usernameText, "Text"]];
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

	If[ LoginDone == False, (
		Print[Style[ "Ecco i tuoi progressi", "Text"]];
		mainDirectory = NotebookDirectory[] <> "Images/";
	
		ex1 = FileNameJoin[{ mainDirectory,"error.png"}];
		ex2 = FileNameJoin[{ mainDirectory,"error.png"}];
		ex3 = FileNameJoin[{ mainDirectory,"error.png"}];
	
		If[ GetExercise1[userData] == 1, ex1 = FileNameJoin[{ mainDirectory,"checked.png"}] ];
		If[ GetExercise2[userData] == 1, ex2 = FileNameJoin[{ mainDirectory,"checked.png"}] ];
		If[ GetExercise3[userData] == 1, ex3 = FileNameJoin[{ mainDirectory,"checked.png"}] ];	
	
		userProgressgrid = Grid[{
		{"Esercizio 1","Esercizio 2", "Esercizio 3"},
		{Image[ Import[ex1], ImageSize->Tiny], Image[ Import[ex2], ImageSize->Tiny], Image[ Import[ex3], ImageSize->Tiny] } }, Frame->None ];
	
		Print[userProgressgrid];
		LoginDone = True;		
	) ];
	
];









