(* ::Package:: *)

(* Questi moduli strutturano le slide contenenti gli esempi, 
aggregando i file testuali dei titoli e delle descrizioni e i file .m che importano i moduli *)
ModuleDirectoryExamples[directoryNumber_]:=Module[{},
	directoryFilename=directoryNumber;
	If[
		FileExistsQ[directoryFilename ],
		For[
			counterExampleNumber = 1,
			counterExampleNumber < 10,
			counterExampleNumber++, 
			exampleTitleFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["example",ToString[counterExampleNumber],"_title.txt"]}];
			If[FileExistsQ[exampleTitleFilename ],ModuleExample[directoryNumber,counterExampleNumber]]
		];
	];
];


ModuleExample[directoryNumber_,exampleNumber_]:=Module[{},

exampleTitleFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["example",ToString[exampleNumber],"_title.txt"]}];

If[
FileExistsQ[exampleTitleFilename ],
Print[Style[Import[exampleTitleFilename],"Subchapter"]],
Print[Style[StringJoin["Esempio ",ToString[exampleNumber]],"Subchapter"]]
];

exampleDescriptionFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["example",ToString[exampleNumber],"_description.txt"]}];

If[
FileExistsQ[exampleDescriptionFilename ],
Print[TextCell[Import[exampleDescriptionFilename],"Text", TextJustification -> 1]]
];

exampleFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["example",ToString[exampleNumber],".m"]}];

If[
FileExistsQ[exampleFilename ],
Import[exampleFilename]
];

];
