(* ::Package:: *)

ModuleIsometryQuiz[directoryNumber_,exerciseNumber_]:=DynamicModule[{
	TipoTrasformazione,
	ChoosenIsometry,
	IsometryGraphic,
	IQTryAgain,
	IQMessageAndTryAgain
},

(* Creo il quiz sulle isometrie partendo dall'oggetto Graphsics creato con il modulo ModuleIsometryGraphic *)
TipoTrasformazione = ModuleGetCasualIsometry[];
IsometryGraphic = ModuleIsometryGraphic[TipoTrasformazione,False];

(* IQTryAgain e' l'azione del pulsante che permette di ripetere l'esercizio *)
IQTryAgain := {"Prova ancora":> {
		TipoTrasformazione = ModuleGetCasualIsometry[];
		IsometryGraphic = ModuleIsometryGraphic[TipoTrasformazione,False];
	}};

(* IQMessageAndTryAgain e' la finestrella che da un feedback all'utente  *)
IQMessageAndTryAgain := If[
		ChoosenIsometry==TipoTrasformazione,
		MessageDialog[StringJoin["Esatto!\nE' proprio una ",TipoTrasformazione,"!"],IQTryAgain];
		ModuleQuizAnswer[directoryNumber,exerciseNumber,1],
		MessageDialog[StringJoin["Sbagliato.\nQuesta \[EGrave] una ",TipoTrasformazione,"."],IQTryAgain];
		ModuleQuizAnswer[directoryNumber,exerciseNumber,0]
	];


Print[Dynamic[IsometryGraphic]];
Print[
	Grid[{{
			Button["Riflessione",
				ChoosenIsometry="Riflessione";
				(*MessageDialog["Ok"<>ChoosenIsometry<>"="<>Dynamic[TipoTrasformazione],{"Prova ancora":>Null}];*)
				IQMessageAndTryAgain,
				Background -> LightGray,
				FrameMargins ->  Large],
			Button["Translazione",
				ChoosenIsometry="Translazione";
				IQMessageAndTryAgain,
				Background -> LightGray,
				FrameMargins ->  Large],
			Button["Rotazione",
				ChoosenIsometry="Rotazione";
				IQMessageAndTryAgain,
				Background -> LightGray,
				FrameMargins ->  Large]
		}},
		Frame->Transparent
	]
];
Print["\n\n"];

];



ModuleGetCasualIsometry[]:=Module[{},
Return[RandomChoice[{"Riflessione","Translazione","Rotazione"}]];
];
