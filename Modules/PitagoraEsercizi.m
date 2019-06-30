(* ::Package:: *)

xFirstPoint = null;
yFirstPoint = null;
xSecondPoint = null;
ySecondPoint = null;

ModulePitagoraEsercizi[] := Module[{},

	mainDirectory = NotebookDirectory[] <> "Images/";
	
	Print[Style[ "Esercizi","Subsubtitle"]];
	
	ex1Image = Import[ FileNameJoin[{ mainDirectory,"diagonal_distance_square.png"}] ];
	
	Print[Image[ ex1Image, ImageSize->Tiny ]];
	
	xFirstPoint = GenerateRandomInt[];
	yFirstPoint = GenerateRandomInt[];
	
	xSecondPoint = GenerateRandomInt[];
	
	While[ xSecondPoint == xFirstPoint, xSecondPoint = GenerateRandomInt[]; ];
	
	ySecondPoint = GenerateRandomInt[];
	
	While[ ySecondPoint == yFirstPoint, ySecondPoint = GenerateRandomInt[]; ];
	
	cartesianPlot = ListPlot[ {{ xFirstPoint, yFirstPoint}, {xSecondPoint, ySecondPoint} }, ImageSize->Large, PlotStyle->{ Dashed, PointSize[Large] }, PlotRange-> {{2.5,2.5}, {2.5,2.5}}, GridLines-> Automatic];
   
    Print[cartesianPlot];
    
	Print[Style[ "Calcola la distanza tra i due punti sul piano cartesiano", "Text"]];
	(*usernameText = Null;
	verifyButton = Button[
				"Verifica",
				(
					If [ LoginDone == False, (
						usernameText = ToLowerCase[usernameText];
						userListData = AddUser[ usernameText ];						
						Print[Style[ "Benvenuto/a " <> usernameText, "Text"]];
						VerifyExe[ userListData, loginButton ];
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
	
	Print[userLoginGrid];*)
	
];

GenerateRandomInt[] := Module[{ randomInt },

	randomInt = RandomInteger[{1, 4}];

	Return[ randomInt ];
	
];
