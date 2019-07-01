(* ::Package:: *)

TestBool = True;

ManagePitagoraSection[]:=Module[{},

	progressCheckButton = Button[
					"Prosegui",
					(
						If [ TestBool == True, (	
								PrintPitagoraEsempi[];		
							)
						];
						  
					)
				];	
				
	progressCheckGrid = Grid[{
			{Row[{
				progressCheckButton
			}]} 
		}, Frame->Transparent];
	
		Print[progressCheckGrid];
		
];

PrintPitagoraEsempi[]:=Module[{},
	pitagoraExamplesGrid = Grid[{
			{Row[{
				ModulePitagoraEsempi[]
			}]} 
		}, Frame->Transparent];
	
		Print[pitagoraExamplesGrid];

];
