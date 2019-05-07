(* ::Package:: *)


ModuleDirectoryTitle[directoryNumber_]:=Module[{},

(* Questo modulo stampa il titolo di ogni argomento *)

	directoryFilename=directoryNumber;
	yearFilename=FileNameJoin[{directoryNumber,"year.txt"}];
	titleFilename=FileNameJoin[{directoryNumber,"title.txt"}];

	If[
		FileExistsQ[directoryFilename ],
		Print[Grid[{{
			If[
				FileExistsQ[yearFilename ],
				Style[ToExpression[Import[yearFilename]],"Section"]
			],
			If[
				FileExistsQ[titleFilename ],
				Style[ToExpression[Import[titleFilename]],"Chapter"]
			]
		}}]]
	];
	
];

