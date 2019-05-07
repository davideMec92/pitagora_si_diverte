(* ::Package:: *)

ModulePythagoreanGuessSideQuiz[directoryNumber_,exerciseNumber_]:=DynamicModule[{
	RandomPythagoreanTriple,
	GuessedSide,
	SideToGuess,
	SideA,
	SideB,
	SideC,
	TriangleRectangleGraphic,
	StringOk,
	StringKo,
	MessageAndTryAgain,
	TryAgain
},
(* Modulo per l'esercizio di calcolo di un lato del triangolo rettangolo *)
	RandomPythagoreanTriple = ModulePythagoreanTriple[];
	(* Scelgo la lunghezza dei lati a partire da delle triple pitagoriche cos\[IGrave] evitiamo dei lati con dimensioni differenti da numeri interi *)
	
	SideA=RandomPythagoreanTriple[[2]];
	SideB=RandomPythagoreanTriple[[1]];
	SideC=RandomPythagoreanTriple[[3]];
	SideToGuess = RandomChoice[{"a","b","c"}];
	
	TriangleRectangleGraphic = ModulePythagoreanTriangleRectangleGraphic[SideA,SideB,SideC,SideToGuess];
	
	StringOk:="Esatto!\nLa lunghezza del lato \[EGrave] proprio ";
	StringKo:="Sbagliato.\nLa lunghezza del lato \[EGrave] ";
	
	(* TryAgain e' l'azione del pulsante che permette di ripetere l'esercizio *)
	TryAgain:={
		GuessedSide=Null;
		RandomPythagoreanTriple = ModulePythagoreanTriple[];
		SideA=RandomPythagoreanTriple[[2]];
		SideB=RandomPythagoreanTriple[[1]];
		SideC=RandomPythagoreanTriple[[3]];
		SideToGuess = RandomChoice[{"a","b","c"}];
		TriangleRectangleGraphic = ModulePythagoreanTriangleRectangleGraphic[SideA,SideB,SideC,SideToGuess]
	};
	
(* MessageAndTryAgain sono le azioni relative alla finestra 
	che informa l'utente dell'esito dell'esercizio *)
	MessageAndTryAgain := Switch[
				SideToGuess,
				"a",If[
					GuessedSide==SideA,
					ModuleQuizAnswer[directoryNumber,exerciseNumber,1];
					MessageDialog[StringJoin[StringOk,ToString[SideA]],{"Prova ancora":>TryAgain}],
					ModuleQuizAnswer[directoryNumber,exerciseNumber,0];
					MessageDialog[StringJoin[StringKo,ToString[SideA]],{"Prova ancora":>TryAgain}]
				],
				"b",If[
					GuessedSide==SideB,
					ModuleQuizAnswer[directoryNumber,exerciseNumber,1];
					MessageDialog[StringJoin[StringOk,ToString[SideB]],{"Prova ancora":>TryAgain}],
					ModuleQuizAnswer[directoryNumber,exerciseNumber,0];
					MessageDialog[StringJoin[StringKo,ToString[SideB]],{"Prova ancora":>TryAgain}]
				],
				"c",If[
					GuessedSide==SideC,
					ModuleQuizAnswer[directoryNumber,exerciseNumber,1];MessageDialog[StringJoin[StringOk,ToString[SideC]],{"Prova ancora":>TryAgain}],
					ModuleQuizAnswer[directoryNumber,exerciseNumber,0];MessageDialog[StringJoin[StringKo,ToString[SideC]],{"Prova ancora":>TryAgain}]
				]
			];
			
			
	Print[Dynamic[TriangleRectangleGraphic]];
	Print[Style[Row[{"Calcola la lunghezza del lato ",Style[Dynamic[SideToGuess],Bold]}],"Text"]];
	Print[Row[{
		InputField[Dynamic[GuessedSide], Number,FrameMargins->Large],
		Button[
			"Invia",
			MessageAndTryAgain,
			Background->LightGray,
			FrameMargins->Large
		]
	}]];
	Print["\n\n"];
	
];
