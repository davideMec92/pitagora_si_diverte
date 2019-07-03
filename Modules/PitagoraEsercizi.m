(* ::Package:: *)

xFirstPoint = null;
yFirstPoint = null;
xSecondPoint = null;
ySecondPoint = null;

ModulePitagoraEsercizi[] := Module[{},
	PitagoraEsercizio1[];
	PitagoraEsercizio2[];
	PitagoraEsercizio3[];
	PitagoraEsercizio4[];
];

PitagoraEsercizio1[] := Module[{},
	
	pitagorasTriads = List[{3,4,5},{5,12,13},{7,24,25}];
	n = RandomInteger[{1, 3}];
	
	Print[ "Triad: " <> ToString[ pitagorasTriads[[n,1]] ] ];
	
	Print[Style[ "Data la triade pitagorica a,b,c determinare b sapendo che a = " <> ToString[pitagorasTriads[[n,1]]] <> " e c = " <> ToString[pitagorasTriads[[n,3]]], "Text"]];
	
	resultEx1 = N[pitagorasTriads[[n,2]], 2];
	
	userValue1 = null;
	Echo["Result: " <> ToString[resultEx1]];	
	verifyButton1 = Button[
				"Verifica",
				(	
					If [ EqualTo[ ToExpression[ userValue1 ] ][ ToExpression[ resultEx1 ] ], (											
						Print[Style[ "Risposta esatta", "Text"]];						
						Print[ Image[ Import[FileNameJoin[{ mainDirectory,"checked.png"}]], ImageSize->Tiny] ];
						userSessionName = GetUserSession[];
						
						If[ userSessionName != "", (						
							userData = AddUser[ userSessionName ];
							userData[[GetIndexEx1Pitagora[]]] = 1;
							SaveUserData[ userData];				
						) ];
						
					), (
					
						Print["Risposta errata"];
						Print[ Image[ Import[FileNameJoin[{ mainDirectory,"error.png"}]], ImageSize->Tiny] ];
					)
					
					];						  
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

PitagoraEsercizio2[] := Module[{},
	
	m = RandomInteger[{5, 10}];
	n = RandomInteger[{1, 10}];
	
	While[ n >= m, n = RandomInteger[{1, 10}]; ];
	
	a = ( m^2 - n^2 );
	b = (2 * m * n);
	c = (m^2 + n^2);
	
	Print[Style[ "Data la triade pitagorica a,b,c determinare b sapendo che a = " <> ToString[a] <> " e c = " <> ToString[c], "Text"]];
	
	resultEx2 = N[b, 2];
	
	userValue2 = null;
	Echo["Result: " <> ToString[resultEx2]];	
	verifyButton2 = Button[
				"Verifica",
				(	
					If [ EqualTo[ ToExpression[ userValue2 ] ][ ToExpression[ resultEx2 ] ], (											
						Print[Style[ "Risposta esatta", "Text"]];						
						Print[ Image[ Import[FileNameJoin[{ mainDirectory,"checked.png"}]], ImageSize->Tiny] ];
						userSessionName = GetUserSession[];
						
						If[ userSessionName != "", (						
							userData = AddUser[ userSessionName ];
							userData[[GetIndexEx2Pitagora[]]] = 1;
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
			InputField[ Dynamic[userValue2], String ],
			verifyButton2
		}]} 
	}, Frame->Transparent];
	
	Print[userExercise2Verify];
	

];


PitagoraEsercizio3[] := Module[{},
	
	exerciseImage = Graphics[{
	{EdgeForm[{Gray}],LightBlue,Polygon[{{6,2},{10,0},{12,4},{8,6}}]},
	{EdgeForm[{Gray}],LightPurple,Rectangle[{5,0},{10,-5}]},
	{EdgeForm[{Gray}],LightGray,Triangle[{{5,0},{6,2},{10,0}}]},
	{EdgeForm[{Blue}],LightGray, Polygon[{{6,2},{6.2,1.9},{6.1,1.7},{5.9,1.8}}]},  (*Rett-angolo*)

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
	Echo["Result: " <> ToString[resultEx3]];	
	userValue3 = null;
		
	verifyButton3 = Button[
				"Verifica",
				(	
					If [ EqualTo[ ToExpression[ userValue3 ] ][ ToExpression[ resultEx3 ] ], (											
						Print[Style[ "Risposta esatta", "Text"]];						
						Print[ Image[ Import[FileNameJoin[{ mainDirectory,"checked.png"}]], ImageSize->Tiny] ];
						userSessionName = GetUserSession[];
						
						If[ userSessionName != "", (						
							userData = AddUser[ userSessionName ];
							userData[[GetIndexEx3Pitagora[]]] = 1;
							SaveUserData[ userData];				
						) ];
						
					), (
					
						Print["Risposta errata"];
						Print[ Image[ Import[FileNameJoin[{ mainDirectory,"error.png"}]], ImageSize->Tiny] ];
					)
					
					];						  
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

PitagoraEsercizio4[] := Module[{},
	
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
		
	userValue4 = null;
		
	verifyButton = Button[
				"Verifica",
				(
					Echo[ "distance: " <> ToString[ N[distanceResult, 2] ] ];
					
					If [ EqualTo[ ToExpression[ userValue4 ] ][ ToExpression[ distanceResult ] ], (											
						Print[Style[ "Risposta esatta", "Text"]];						
						Print[ Image[ Import[FileNameJoin[{ mainDirectory,"checked.png"}]], ImageSize->Tiny] ];
						userSessionName = GetUserSession[];
						
						If[ userSessionName != "", (						
							userData = AddUser[ userSessionName ];
							userData[[GetIndexEx4Pitagora[]]] = 1;
							SaveUserData[ userData];						
						) ];
						
					), (
					
						Print["Risposta errata"];
						Print[ Image[ Import[FileNameJoin[{ mainDirectory,"error.png"}]], ImageSize->Tiny] ];
					)
					
					];						  
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

GetIndexEx1Pitagora[]:=Module[{index},
   index = 2;
   Return[index];
];

GetIndexEx2Pitagora[]:=Module[{index},
   index = 3;
   Return[index];
];

GetIndexEx3Pitagora[]:=Module[{index},
   index = 4;
   Return[index];
];

GetIndexEx4Pitagora[]:=Module[{index},
   index = 5;
   Return[index];
];
