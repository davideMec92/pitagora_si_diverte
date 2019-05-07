(* ::Package:: *)

ModuleNotes[]:=Module[{},
	
	(* Note finali di progetto *)
	Print[Style[ "Note","Subsubtitle"]];
	
	Print[
	TextCell[
		Import[FileNameJoin[{"files","notes.txt"}]],
		"Text",
		TextJustification -> 1
	]
	];


];
