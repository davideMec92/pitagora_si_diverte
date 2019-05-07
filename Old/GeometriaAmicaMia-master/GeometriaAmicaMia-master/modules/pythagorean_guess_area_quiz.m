(* ::Package:: *)

ModulePythagoreanGuessAreaQuiz[directoryNumber_,exerciseNumber_]:=DynamicModule[{
	RandomPythagoreanTriple,
	MessageAndTryAgain,
	GuessedArea,
	MissingSide,
	SideA,
	SideB,
	SideC,
	TriangleRectangleGraphic,
	Area,
	TryAgain
},
(* Modulo per l'esercizio di calcolo dell'area di un triangolo rettangolo *)
	RandomPythagoreanTriple = ModulePythagoreanTriple[];
	(* Scelgo la lunghezza dei lati a partire da delle triple pitagoriche cos\[IGrave] evitiamo dei lati con dimensioni differenti da numeri interi *)
	
	SideA=RandomPythagoreanTriple[[2]];
	SideB=RandomPythagoreanTriple[[1]];
	SideC=RandomPythagoreanTriple[[3]];
	MissingSide = RandomChoice[{"a","b","c"}];
	
	(* Viene richiamato il modulo per la creazione di un triangolo rettangolo *)
	TriangleRectangleGraphic = ModulePythagoreanTriangleRectangleGraphic[SideA,SideB,SideC,MissingSide];
	
	(* TryAgain e' l'azione del pulsante che permette di ripetere l'esercizio *)
	TryAgain:={
		GuessedArea=Null;
		RandomPythagoreanTriple = ModulePythagoreanTriple[];
		SideA = RandomPythagoreanTriple[[2]];
		SideB = RandomPythagoreanTriple[[1]];
		SideC = RandomPythagoreanTriple[[3]];
		MissingSide = RandomChoice[{"a","b","c"}];
		TriangleRectangleGraphic = ModulePythagoreanTriangleRectangleGraphic[SideA,SideB,SideC,MissingSide]
	};

	
	Area := SideA*SideB/2;
	
	(* MessageAndTryAgain sono le azioni relative alla finestra 
	che informa l'utente dell'esito dell'esercizio *)
	
	MessageAndTryAgain := If[
					GuessedArea==Area,
					ModuleQuizAnswer[directoryNumber,exerciseNumber,1];
					MessageDialog[
						StringJoin["Esatto!\nL'area \[EGrave] proprio ",ToString[Area]],
						{"Prova ancora":>TryAgain}
					],
					ModuleQuizAnswer[directoryNumber,exerciseNumber,0];
					MessageDialog[
						StringJoin["Sbagliato.\nL'area \[EGrave] ",ToString[Area]],
						{"Prova ancora":>TryAgain}
					]
				];
			
			
	Print[Dynamic[TriangleRectangleGraphic]];
	Print[Style["Calcola l'area del triangolo","Text"]];
	Print[Row[{
		InputField[Dynamic[GuessedArea], Number,FrameMargins->Large],
		Button[
			"Invia",
			MessageAndTryAgain,
			Background->LightGray,
			FrameMargins->Large
		]
	}]];
	Print["\n\n"];
	
];
