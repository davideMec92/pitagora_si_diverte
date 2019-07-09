(* ::Package:: *)

ModuleWelcome[]:=Module[{},
(*Commento*)


imgDirectory = NotebookDirectory[] <> "Images/";
	
Logh = FileNameJoin[{ imgDirectory,"logo.png"}];	
	
Eu = FileNameJoin[{ imgDirectory,"1.png"}];
Pit = FileNameJoin[{ imgDirectory,"2.png"}];

Logo = Image[Import[Logh], ImageSize->Medium];

Pitagora=Image[ Import[Pit], ImageSize->{470,470}];
Euclide= Image[ Import[Eu], ImageSize->{495,495}];

X=0;

Print[Grid[{
			{"",
			Logo}
	},Frame->Transparent, Alignment->Center, ItemSize -> {{Scaled[.28],Scaled[.3]}}, 
 Frame -> All]
];

Print[Grid[{
		{"", 
		Button[Euclide, If[x>0, x--],ContentPadding -> False, FrameMargins->None, Background->White, Appearance->"Frameless"], 
		Button[Pitagora, If[x>0, x++], ContentPadding -> False, FrameMargins->None, Background->White, Appearance->"Frameless"]}
	},Frame->Transparent, Alignment->Center, ItemSize -> {{Scaled[.15],Scaled[.3], Scaled[.3]}}, 
 Frame -> All]
];

];
