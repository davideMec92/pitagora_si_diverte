(* ::Package:: *)

ModuleUserQuizReport[]:=DynamicModule[{},

	(* Clock forces the import of the file every 5 seconds *)
	Print[Style[StringJoin[ "Risultati quiz"],"Subsubtitle"]];
	Print[
		Dynamic[First[{
		If[
			FileExistsQ[FileNameJoin[{"data","quiz.csv"}]],
			ModuleUserQuizReportDataGrid[],
			Style[StringJoin[ "Non ha ancora risposto a nessun quiz"],"Subsubsection"]
		],
		Clock[{1, 5, 5}, 5]
		}]]
	];

];


ModuleUserQuizReportDataGrid[]:=Module[{UserQuizFilename,ExtractQuizResult,QuizReportData,QuizReportDataWithHeader,QuizReportGrid},

UserQuizFilename = FileNameJoin[{"data","quiz.csv"}];
(* Call this function only if this file exist*)
ExtractQuizResult[quizReplyLine_] := {
		Style[
		If[
		FileExistsQ[FileNameJoin[{NotebookDirectory[],ToString[quizReplyLine[[1]]],"title.txt"}]],
		Import[FileNameJoin[{NotebookDirectory[],ToString[quizReplyLine[[1]]],"title.txt"}]],
		"Argomento"]
		,"SmallText",FontColor->Gray],
		Style[
		If[
		FileExistsQ[FileNameJoin[{NotebookDirectory[],ToString[quizReplyLine[[1]]],"exercise"<>ToString[quizReplyLine[[2]]]<>"_title.txt"}]],
		Import[FileNameJoin[{NotebookDirectory[],ToString[quizReplyLine[[1]]],"exercise"<>ToString[quizReplyLine[[2]]]<>"_title.txt"}]],
		"Esercizio "]<>ToString[quizReplyLine[[2]]]
		
		
		,"SmallText"],
		Switch[
			quizReplyLine[[3]], 
			1, 
			Style["Giusto","SmallText",FontColor->Darker[Green]], 
			0, 
			Style["Sbagliato","SmallText",FontColor->Darker[Red]], 
			_,
			Style[StringJoin["Voto: "<>ToString[quizReplyLine[[3]]]<>"/"<>ToString[quizReplyLine[[4]]]],"SmallText",FontColor->Darker[Orange]]
		],
		Style[DateString[
			ToExpression[quizReplyLine[[5]]],{
				"DayShort",
				"/",
				"MonthShort",
				"/", 
				"Year",
				" ",
				"Hour24Short",
				":",
				"Minute"
			}],"SmallText",FontColor->Gray]
		};
	QuizReportData = Map[ExtractQuizResult, Import[UserQuizFilename]];
	QuizReportDataWithHeader = Prepend[QuizReportData,Style[#, {"Text",Bold}] & /@{"Argomento", "Esercizio", "Voto", "Data"}];
	QuizReportGrid := Grid[
		QuizReportDataWithHeader,
		Alignment->{{Left,Left,Left,Left},{Top,Top,Top,Top}},
		Frame -> None
	];
	Return[QuizReportGrid];
];
