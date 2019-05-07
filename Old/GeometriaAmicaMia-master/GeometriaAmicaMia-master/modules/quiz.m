(* ::Package:: *)

ModuleQuiz[directoryNumber_,exerciseNumber_,data_]:=DynamicModule[{
	exerciseQuizFilename,
	ImportedData,
	CheckboxData,
	ChosenAnswer,
	Correction,
	createCheckboxData
},
	
	(* Questo modulo per i quiz e' discontinuato, ma viene mantenuto qui in caso di futuro utilizzo *)
	
	Correction:=" ";
  	(* 
  	WHEN ChosenAnswer IS NULLED, THERE NO DEFAULT ANSWER BUT THE BUTTON DOES NOT COMPUTATE WELL HIS VALUE
  	ChosenAnswer:=null;  
  	ChosenAnswer:={"value"->0,"correction"->0,"text"->""};  
  	*)
  	
	createCheckboxData[quizReplyLine_] := {
		"text" -> quizReplyLine[[2]],
		"correction" -> quizReplyLine[[3]],
		"value" -> quizReplyLine[[1]]
	} -> quizReplyLine[[2]];
	
	exerciseQuizFilename=FileNameJoin[{
		NotebookDirectory[],
		ToString[directoryNumber],
		StringJoin["exercise",ToString[exerciseNumber],"_quiz.csv"]
	}];
	
	ImportedData = Import[exerciseQuizFilename];

	CheckboxData = Map[createCheckboxData, ImportedData];
	
	Print[
		Column[{"Scegli la risposta corretta:",
		RadioButtonBar[
			Dynamic[ChosenAnswer],
			CheckboxData,
			Appearance -> "Vertical"
		]}]];
  	
  	
	Print[Button[
		"Invia la tua risposta",
		Correction=If[
   			Lookup[ChosenAnswer, "value"]>0,
   			"Risposta Corretta",
   			StringJoin["Risposta Errata. ",Lookup[ChosenAnswer, "correction"]]
   		];
		ModuleQuizAnswer[directoryNumber,exerciseNumber,Lookup[ChosenAnswer, "value"]];
	]];
	
	

  Print[Style[Dynamic[Correction],"Subsubsection"]]


];
