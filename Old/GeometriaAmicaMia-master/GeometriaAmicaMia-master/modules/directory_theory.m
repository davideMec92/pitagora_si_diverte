(* ::Package:: *)

(* Questi moduli strutturano le slide contenenti la teoria, 
aggregando i file testuali dei titoli e delle descrizioni e i file .m *)

ModuleDirectoryTheory[directoryNumber_]:=Module[{},


	
	theoryFilename=FileNameJoin[{directoryNumber,"theory.txt"}];
	If[
		FileExistsQ[theoryFilename ],
		Print[TextCell[Import[theoryFilename],"Text", TextJustification -> 1]]
	];


	theoryFilename=FileNameJoin[{directoryNumber,"theory.m"}];
	If[
		FileExistsQ[theoryFilename ],
		Print[Import[theoryFilename]]
	];
	
	directoryFilename=directoryNumber;
	If[
		FileExistsQ[directoryFilename ],
		For[
			counterTheoryNumber = 1,
			counterTheoryNumber < 10,
			counterTheoryNumber++, 
			theoryTitleFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["theory",ToString[counterTheoryNumber],"_title.txt"]}];
			If[FileExistsQ[theoryTitleFilename ],ModuleTheory[directoryNumber,counterTheoryNumber]]
		];
	];
];


ModuleTheory[directoryNumber_,theoryNumber_]:=Module[{},

theoryTitleFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["theory",ToString[theoryNumber],"_title.txt"]}];

If[
FileExistsQ[theoryTitleFilename ],
Print[Style[Import[theoryTitleFilename],"Subchapter"]],
Print[Style[StringJoin["Esempio ",theoryNumber],"Subchapter"]]
];

theoryDescriptionFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["theory",ToString[theoryNumber],"_description.txt"]}];

If[
FileExistsQ[theoryDescriptionFilename ],
Print[TextCell[Import[theoryDescriptionFilename],"Text", TextJustification -> 1]]
];

theoryFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["theory",ToString[theoryNumber],".m"]}];

If[
FileExistsQ[theoryFilename ],
Import[theoryFilename]
];

theoryQuizFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["theory",ToString[theoryNumber],"_quiz.csv"]}];

If[
FileExistsQ[theoryQuizFilename ],
ModuleQuiz[directoryNumber,theoryNumber];
];

];
