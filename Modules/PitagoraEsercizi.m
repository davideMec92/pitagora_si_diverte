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
	
	cartesianPlot = ListPlot[ {{ xFirstPoint, yFirstPoint}, {xSecondPoint, ySecondPoint} }->{"A","B"}, LabelingFunction->Above, ImageSize->Large, PlotStyle->{ Dashed, PointSize[Large] }, PlotRange-> {{2.5,2.5}, {2.5,2.5}}, GridLines-> Automatic];
   
    Print[cartesianPlot];
    
    distanceResult = N[Sqrt[ (xFirstPoint - xSecondPoint )^2 + ( yFirstPoint - ySecondPoint )^2 ], 2];
        
	Print[Style[ "Calcola la distanza tra i due punti A e B sul piano cartesiano", "Text"]];
	Print[Style[ "Nel caso di risultato con cifre decimali, arrotondare alla prima cifra", "Text"]];
		
	userValue = null;
		
	verifyButton = Button[
				"Verifica",
				(
					Echo[ "distance: " <> ToString[ N[distanceResult, 2] ] ];
					
					If [ EqualTo[ ToExpression[ userValue] ][ ToExpression[ distanceResult ] ], (											
						Print[Style[ "Risposta esatta", "Text"]];						
						Print[ Image[ Import[FileNameJoin[{ mainDirectory,"checked.png"}]], ImageSize->Tiny] ];
						userSessionName = GetUserSession[];
						
						If[ userSessionName != "", (						
							userData = AddUser[ userSessionName ];
							userData[[2]] = 1;
							SaveUserData[ userData];						
						) ];
						
					), (
					
						Print["Risposta errata"];
						Print[ Image[ Import[FileNameJoin[{ mainDirectory,"error.png"}]], ImageSize->Tiny] ];
					)
					
					];						  
				)
			];
					
	userExercise2Verify = Grid[{
		{Row[{
			InputField[ Dynamic[userValue], String ],
			verifyButton
		}]} 
	}, Frame->Transparent];
	
	Print[userExercise2Verify];
	
];

GenerateRandomInt[] := Module[{ randomInt },

	randomInt = RandomInteger[{1, 4}];

	Return[ randomInt ];
	
];
