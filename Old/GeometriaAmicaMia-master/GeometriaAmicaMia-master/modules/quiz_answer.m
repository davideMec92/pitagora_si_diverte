(* ::Package:: *)


ModuleQuizAnswer[directoryNumber_,exerciseNumber_,vote_]:=Module[{},
	
	(* Questo modulo inserisce in un file csv l'esito vero/falso dell'esercizio dell'utente *)
	dataQuizFilename=FileNameJoin[{"data","quiz.csv"}];
	
	If[
	FileExistsQ[dataQuizFilename],
	data = Import[dataQuizFilename];
	data = Append[data,{directoryNumber,exerciseNumber,vote,1,DateList[]}];
	Export[dataQuizFilename,data],
	Export[dataQuizFilename,{{directoryNumber,exerciseNumber,vote,1,DateList[]}}]
	];
	

];


ModuleQuizAnswer[directoryNumber_,exerciseNumber_,vote_, max_]:=Module[{},
	
	(* Questo modulo inserisce in un file csv l'esito (voto) dell'esercizio dell'utente *)
	
	dataQuizFilename=FileNameJoin[{"data","quiz.csv"}];
	
	If[
	FileExistsQ[dataQuizFilename],
	data = Import[dataQuizFilename];
	data = Append[data,{directoryNumber,exerciseNumber,vote,max,DateList[]}];
	Export[dataQuizFilename,data],
	Export[dataQuizFilename,{{directoryNumber,exerciseNumber,vote,max,DateList[]}}]
	];
	

];