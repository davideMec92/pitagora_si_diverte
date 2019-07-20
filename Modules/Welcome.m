(* ::Package:: *)

ModuleWelcome[]:=Module[{},
(*Questa \[EGrave] la Home*)

(*Mi servir\[AGrave] avere i dati utenti e di sessione*)
Import["Modules/File_manager.m"];

(*Immagini*)
imgDirectory = NotebookDirectory[] <> "Images/";
	
Logh = FileNameJoin[{ imgDirectory,"logo.png"}];	
	
Eu = FileNameJoin[{ imgDirectory,"1.png"}];
Pit = FileNameJoin[{ imgDirectory,"2.png"}];

Logo = Image[Import[Logh], ImageSize->Large];

Pitagora=Image[ Import[Pit], ImageSize->Medium];
Euclide= Image[ Import[Eu], ImageSize->Medium];


(*Logo*)
Print[Grid[{
			{"",
			Logo}
	},Frame->Transparent, Alignment->Center, ItemSize -> {{Scaled[.28],Scaled[.3]}}, 
 Frame -> All]
];



(*Pitagora ed Euclide*)
Print[Grid[{
		{"", 
		Button[Euclide, NotebookLocate["_EuclideEnunciato"],ContentPadding -> False, FrameMargins->None, Background->White, Appearance->"Frameless"], 
		Button[
					Pitagora,
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
									NotebookLocate["_PitagoraEnunciato"];
								)];
							
							) ];
						)];
					)
				,ContentPadding -> False, FrameMargins->None, Background->White, Appearance->"Frameless"]}
	},Frame->Transparent, Alignment->Center, ItemSize -> {{Scaled[.15],Scaled[.3], Scaled[.3]}}, 
 Frame -> All]
];

];
