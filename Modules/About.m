(* ::Package:: *)

ModuleAbout[]:=Module[{},



(* Chi siamo? *)
	SetDirectory[NotebookDirectory[]];
    imgDirectory = NotebookDirectory[] <> "Images/";
	
	Noh = FileNameJoin[{"Images","index.jpg"}];	
	Noi = Image[Import[Noh], ImageSize->Large];
	
	Print[Grid[{
			{"",
			Noi}
		},Frame->Transparent, Alignment->Center, ItemSize -> {{Scaled[.28],Scaled[.3]}}, 
     Frame -> All]
	];

];



