(* ::Package:: *)

(* Questi moduli strutturano le slide contenenti gli esercizi, 
aggregando i file testuali dei titoli e delle descrizioni e i file .m che importano i moduli *)

ModuleDirectoryExercises[directoryNumber_]:=Module[{},
	directoryFilename=directoryNumber;
	If[
		FileExistsQ[directoryFilename ],
		For[
			counterExerciseNumber = 1,
			counterExerciseNumber < 10,
			counterExerciseNumber++, 
			exerciseTitleFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["exercise",ToString[counterExerciseNumber],"_title.txt"]}];
			If[FileExistsQ[exerciseTitleFilename ],ModuleExercise[directoryNumber,counterExerciseNumber]]
		];
	];
];


ModuleExercise[directoryNumber_,exerciseNumber_]:=Module[{},

exerciseTitleFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["exercise",ToString[exerciseNumber],"_title.txt"]}];

If[
FileExistsQ[exerciseTitleFilename ],
Print[Style[Import[exerciseTitleFilename],"Subchapter"]],
Print[Style[StringJoin["Esempio ",exerciseNumber],"Subchapter"]]
];

exerciseDescriptionFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["exercise",ToString[exerciseNumber],"_description.txt"]}];

If[
FileExistsQ[exerciseDescriptionFilename ],
Print[TextCell[Import[exerciseDescriptionFilename],"Text", TextJustification -> 1]]
];

exerciseFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["exercise",ToString[exerciseNumber],".m"]}];

If[
FileExistsQ[exerciseFilename ],
Import[exerciseFilename]
];

exerciseQuizFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["exercise",ToString[exerciseNumber],"_quiz.csv"]}];

If[
FileExistsQ[exerciseQuizFilename ],
ModuleQuiz[directoryNumber,exerciseNumber];
];

];
