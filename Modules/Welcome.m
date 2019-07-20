(* ::Package:: *)

ModuleWelcome[]:=Module[{},
(*Questa \[EGrave] la Home*)

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


X=1;
(*Pitagora ed Euclide*)
Print[Grid[{
		{"", 
		Button[Euclide, NotebookLocate["_EuclideEnunciato"],ContentPadding -> False, FrameMargins->None, Background->White, Appearance->"Frameless"], 
		Button[Pitagora, If[x>0, NotebookLocate["_PitagoraEnunciato"]], ContentPadding -> False, FrameMargins->None, Background->White, Appearance->"Frameless"]}
	},Frame->Transparent, Alignment->Center, ItemSize -> {{Scaled[.15],Scaled[.3], Scaled[.3]}}, 
 Frame -> All]
];

];
