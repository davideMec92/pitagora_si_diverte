(* ::Package:: *)

(* Package ProgettoGeometria.m dei moduli del progetto "Geometria Nella Storia" *)

(* Progetto di Matematica Computazionale  &  Calcolo Numerico e Software Didattico 2017/2018 (Unibo) *)
(* Luca Angelucci (819862), Filippo Bottonelli (854875), Davide Cristiani (847086), Sara Simoncelli (852141) *)
(* Progetto sviluppato in WOLFRAM MATHEMATICA 11.2.0.0 *)

(* E' permesso il riutilizzo e la redistribuzione di questo codice sorgente previa approvazione degli autori *)

(* I moduli principali sono dichiarati in ordine alfabetico *)


ModuleBibliography[]:=Module[{},
(* Questo modulo crea la pagina bibilografia *) 
(* E' stato utilizzato un modulo e non un file txt, per gestire le differenze stilistiche del testo: liste, intestazioni *)
Print[Style[ "Bibliografia","Subsubtitle"]];	

CellPrint[{TextCell[Row[{"Nuovi lineamenti di Matematica - Libro 1 (Ghisetti e Corvi Editori; N. Dodero, P. Baroncini, R. Manfredi)"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Nuovi lineamenti di Matematica - Libro 2 (Ghisetti e Corvi Editori; N. Dodero, P. Baroncini, R. Manfredi)"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Manuale di Geometria - 2\[Degree] edizione (Zanichelli; M. Bergamini, A. Trifone)"}], {"Item"}]}];

CellPrint[{TextCell[Row[{"Enciclopedia Treccani on-line"}], {"Item"}]}];

];


ModuleCover[]:=Module[{},

	(* Pagina di copertina del progetto, con il logo, la foto degli autori *)
	
	Print[Import[FileNameJoin[{"files","logo_large.png"}]]];
	Print[Style[ "Progetto di Matematica Computazionale  &  Calcolo Numerico e Software Didattico 2017/2018 (Unibo)\nLuca Angelucci (819862), Filippo Bottonelli (854875), Davide Cristiani (847086), Sara Simoncelli (852141)","Text"]];
	
	Print[TextCell["\"La storia ci delinea percorsi didattici per costruire oggetti matematici, ci intrattiene con aneddoti, ci suggerisce problemi, la storia ci dice perche, fa retrocedere dalla teoria finita alle idee grezze che ne sono alla base\" (Furinghetti, 2007)",FontSize->14,Italic]];
	
	(* Alcuni pulsanti navigazionali *)
	Print[
	Grid[{{
		Button[
			"Menu di Navigazione",
			NotebookLocate["menu"],
			Background->LightYellow,
			FrameMargins->Large
		],
		Button[
			"Pannello utente",
			NotebookLocate["user"],
			Background->LightYellow,
			FrameMargins->Large
		],
		Button[
			"Bibliografia",
			NotebookLocate["bibliography"],
			Background->LightYellow,
			FrameMargins->Large
		],
		Button[
			"Note Didattiche",
			NotebookLocate["notes"],
			Background->LightYellow,
			FrameMargins->Large
		],
		Button[
			"Note Informatiche",
			NotebookLocate["notes_programming"],
			Background->LightYellow,
			FrameMargins->Large
		]
		}},Frame->Transparent]
	];
	
	Print[Import[FileNameJoin[{"files","group.png"}]]];

];


(* Questi moduli strutturano le slide contenenti gli esempi, 
aggregando i file testuali dei titoli e delle descrizioni e i file .m che importano i moduli *)

(* Il ciclo seguente controlla se esistono i file exampleN_title.txt da 1 a 10, 
e se esistono richiama il modulo ModuleExample che stampa l'esempio corrispondente *)
ModuleDirectoryExamples[directoryNumber_]:=Module[{
	directoryFilename,
	counterExampleNumber,
	exampleTitleFilename
	},
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


ModuleExample[directoryNumber_,exampleNumber_]:=Module[{
	exampleTitleFilename,
	exampleDescriptionFilename,
	exampleFilename
	},
(* Questo modulo crea le pagine esempio ed \[EGrave] comune per tutte le pagine esempio del progetto *)

(* Vengono importati i file exampleN_title.txt exampleN_description.txt, exampleN.m
controllando che esistano per evitare di stampare un errore *)

(* Viene stampato il titolo *)
exampleTitleFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["example",ToString[exampleNumber],"_title.txt"]}];

If[
FileExistsQ[exampleTitleFilename ],
Print[Style[Import[exampleTitleFilename],"Subchapter"]],
Print[Style[StringJoin["Esempio ",ToString[exampleNumber]],"Subchapter"]]
];

(* Viene stampata la descrizione *)
exampleDescriptionFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["example",ToString[exampleNumber],"_description.txt"]}];

If[
FileExistsQ[exampleDescriptionFilename ],
Print[TextCell[Import[exampleDescriptionFilename],"Text", TextJustification -> 1]]
];

(* Viene stampato il testo dell'esempio*)
exampleFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["example",ToString[exampleNumber],".m"]}];

If[
FileExistsQ[exampleFilename ],
Import[exampleFilename]
];

];


(* Questi moduli strutturano le slide contenenti gli esercizi, 
aggregando i file testuali dei titoli e delle descrizioni e i file .m che importano i moduli *)

(* La struttura di questo modulo \[EGrave] speculare a  ModuleDirectoryExamples *)
ModuleDirectoryExercises[directoryNumber_]:=Module[{
	directoryFilename,
	counterExerciseNumber,
	exerciseTitleFilename
},
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


ModuleExercise[directoryNumber_,exerciseNumber_]:=Module[{
	exerciseTitleFilename,
	exerciseDescriptionFilename,
	exerciseFilename,
	exerciseQuizFilename
},
(* La struttura di questo modulo \[EGrave] speculare a  ModuleExample *)

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


(* Questi moduli strutturano le slide di introduzione alle materie trattate utilizzando
i file testuali e le immagini contenuti nelle directory relative *)

ModuleDirectoryIntro[directoryNumber_]:=Module[{
	directoryFilename,
	videoFilename,
	ButtonVideo,
	printLineAndSpeakIt
	},
	directoryFilename=directoryNumber;
	
	(* Questo ciclo crea un bottone che apre una video-lezione. Purtroppo nella consegna finale
	non abbiamo prodotto nessuna videolezione, ma questa possibilit\[AGrave] rimane per eventuali estensioni del progetto
	sarebbe sufficiente inserire un file video.mp4 e un file video_preview.png dentro la directory dell'argomento *)
	videoFilename=FileNameJoin[{NotebookDirectory[],directoryNumber,"video.mp4"}];
	ButtonVideo := If[
		FileExistsQ[videoFilename ],
			Button[
				Grid[{{
					Style[ "Videolezione","Subsubsection"]
				},{
					Import[FileNameJoin[{directoryNumber,"video_preview.png"}]]
				}}],
				SystemOpen[  FileNameJoin[{NotebookDirectory[],directoryNumber,"video.mp4"}]],
				ImageSize -> { 250, 250 }],
			""
		];
	
	(* Questa funzione \[EGrave] mappata sulle righe dell'introduzione per aggiungere il pulsante per l'accessibilita audio *)
	printLineAndSpeakIt[line_] := TextCell[Row[{Button[Import[FileNameJoin[{"files","audio.png"}]],Speak[line]],"\n",line,".\n"}],"Text", TextJustification -> 1];
	
	If[
		FileExistsQ[directoryFilename ],
			Print[
				Grid[{{ 
					
						Import[FileNameJoin[{directoryNumber,"image.png"}]],
						
					
					Column[Map[printLineAndSpeakIt,StringSplit[Import[FileNameJoin[{directoryNumber,"intro.txt"}]], ".\n"]]]
					
					
					,
					ButtonVideo
					}},
					Alignment->{{Left,Left,Left},{Top,Top,Top}},Frame->None
				] (* Costruisco la descrizione *)
			];
		];
	];



ModuleDirectoryMenu[directoryNumber_, slideType_] := Module[{
	directoryFilename,
	buttonsNumber
	},

	directoryFilename = directoryNumber;
	
	(* I pulsanti navigazionali di ogni argomento *)
	(* Questo modulo \[EGrave] comune a ogni slide del progetto e stampa il menu *)
	buttonsNumber = 4;
	If[
		FileExistsQ[directoryFilename],
		
		Print[
			Grid[
				{{
		   			Button["Introduzione", NotebookLocate[StringJoin[directoryNumber,"_intro"]], If[slideType=="intro", Background -> Orange,Background -> LightYellow], FrameMargins ->  Large],
					
		   			Button["Esempi", NotebookLocate[StringJoin[directoryNumber,"_examples"]], If[slideType=="examples", Background -> Orange,Background -> LightYellow], FrameMargins ->  Large],
					
		   			Button["Esercizi", NotebookLocate[StringJoin[directoryNumber,"_exercises"]], If[slideType=="exercises",Background -> Orange,Background -> LightYellow], FrameMargins ->  Large],
					
		   			Button["Teoria", NotebookLocate[StringJoin[directoryNumber,"_theory"]], If[slideType=="theory", Background -> Orange,Background -> LightYellow], FrameMargins ->  Large]
					
		   		}},
		 		ItemSize -> {{Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber]}}, Frame -> Transparent
		 	]
		]
	];

];






(* Questi moduli strutturano le slide contenenti la teoria, 
aggregando i file testuali dei titoli e delle descrizioni e i file .m *)

ModuleDirectoryTheory[directoryNumber_]:=Module[{
	theoryFilenameMainText,
	theoryFilenameMain,
	directoryFilename,
	counterTheoryNumber,
	theoryTitleFilename
	},

(* Questo modulo \[EGrave] simile a ModuleDirectoryExamples e ModuleDirectoryExercises
con l'unica differenza che vengono valutati dei file theory.txt e theory.m che dovrebbero
essere una cappello iniziale di teoria che precede i vari paragrafi
*)
	
	theoryFilenameMainText=FileNameJoin[{directoryNumber,"theory.txt"}];
	If[
		FileExistsQ[theoryFilenameMainText ],
		Print[TextCell[Import[theoryFilenameMainText],"Text", TextJustification -> 1]]
	];


	theoryFilenameMain=FileNameJoin[{directoryNumber,"theory.m"}];
	If[
		FileExistsQ[theoryFilenameMain ],
		Import[theoryFilenameMain]
	];
	
	directoryFilename=directoryNumber;
	If[
		FileExistsQ[directoryFilename],
		For[
			counterTheoryNumber = 1,
			counterTheoryNumber < 10,
			counterTheoryNumber++, 
			theoryTitleFilename = FileNameJoin[{ToString[directoryNumber],StringJoin["theory",ToString[counterTheoryNumber],"_title.txt"]}];
			If[FileExistsQ[theoryTitleFilename ],ModuleTheory[directoryNumber,counterTheoryNumber]]
		];
	];
];


ModuleTheory[directoryNumber_,theoryNumber_]:=Module[{
	theoryTitleFilename,
	theoryDescriptionFilename,
	theoryFilename,
	theoryQuizFilename
	},
(* Questo modulo e' speculare a ModuleExample e ModuleExercise *)
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


ModuleDirectoryTitle[directoryNumber_]:=Module[{
	directoryFilename,
	yearFilename,
	titleFilename
	},

(* Questo modulo stampa l'anno e il titolo di ogni argomento importandoli dai file year.txt e title.txt *)

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



ModuleEnd[]:=Module[{},
	
	Print["Grazie dell'attenzione..."];

];


ModuleIsometryGraphic[tipoTrasformazione_,manipulate_]:=DynamicModule[{
	MaxNumber=1000,
	RandomPoligon,
	RandomRotationPoint,
	RandomVector1,
	RandomVector2,
	RandomAngleDegree,
	PointP
},
	
	(* Genera l'oggetto Graphics che rappresenta l'isometria *)
	
	(* Il poligono generato \[EGrave] creato a partire da 3 o 4 o 5 punti scelti casualmente*)
	PointP = RandomPoint[Rectangle[{0,0},{MaxNumber,MaxNumber}]];
	
		RandomPoligon = Polygon[Append[RandomPoint[Rectangle[{0,0},{MaxNumber,MaxNumber}],RandomInteger[{2,3}]],PointP]];

	RandomRotationPoint = {
		RandomInteger[{0,MaxNumber}],
		RandomInteger[{0,MaxNumber}]
	};
	
	RandomVector1 = RandomInteger[{0,MaxNumber}];
	RandomVector2 = RandomInteger[{0,MaxNumber}];
	
	RandomAngleDegree = RandomReal[]*2Pi;
	
	(* A seconda che il valore manipulate sia presente o meno, restituisce un oggetto manipulate*)
	If[
		manipulate,
		Manipulate[
			ModuleIsometryGraphicWithMagnitudo[
				RandomPoligon,
				PointP,
				RandomRotationPoint,
				RandomVector1,
				RandomVector2,
				RandomAngleDegree,
				tipoTrasformazione,
				manipulatemagnitudo
			],
			{manipulatemagnitudo,0.1,1}
		],
		ModuleIsometryGraphicWithMagnitudo[
			RandomPoligon,
			PointP,
			RandomRotationPoint,
			RandomVector1,
			RandomVector2,
			RandomAngleDegree,
			tipoTrasformazione,
			1
		]
	]
	
];


ModuleIsometryGraphicWithMagnitudo[
	RandomPoligon_,
	PointP_,
	RandomRotationPoint_,
	RandomVector1_,
	RandomVector2_,
	RandomAngleDegree_,
	tipoTrasformazione_,
	magnitudo_
]:=DynamicModule[{
	PolygonOriginal,
	PolygonToRotate,
	PolygonToTranslate,
	PolygonToReflect,
	PointGraphic,
	PointLabelGraphic,
	PolygonOriginalGraphic,
	PolygonRotatedGraphic,
	PolygonTranslatedGraphic,
	PolygonReflectedGraphic,
	RiflectionLineGraphic,
	PointPGraphic,
	PointPLabelGraphic,
	PointPReflectedGraphic,
	PointPReflectedLabelGraphic,
	RiflectionPerpendicularLineGraphic,
	PointPLabelTranslatedGraphic,
	PointPTranslatedGraphic,
	PointPRotatedGraphic,
	PointPLabelRotatedGraphic
},

(* Viene creato un poligono su cui effettuare le trasformazioni
in azzurro per omogeneita grafica con i poligoni del programma *)
PolygonOriginal = {EdgeForm[{Gray}],LightBlue,RandomPoligon};
PolygonToRotate = {Opacity[0.5],Red,RandomPoligon};
PolygonToTranslate = {Opacity[0.5],Red,RandomPoligon};
PolygonToReflect= {Opacity[0.5],Red,RandomPoligon};

PolygonOriginalGraphic=Graphics[
	PolygonOriginal
];
PointPGraphic = Graphics[{GrayLevel[0.35],Point[PointP]}];	
PointPLabelGraphic = Graphics[{GrayLevel[0.35],Text["P",PointP,{-1,-1}]}];	
(* Genero la rotazione *)

(* Imposto le grafiche degli oggetti precedentemente creati, con etichette testuali*)
PointGraphic = Graphics[{GrayLevel[0.35],Point[RandomRotationPoint]}];
PointLabelGraphic = Graphics[{GrayLevel[0.35],Text["O",RandomRotationPoint,{-1,-1}]}];

PolygonRotatedGraphic = Graphics[
	GeometricTransformation[
		PolygonToRotate,
		RotationTransform[RandomAngleDegree*magnitudo,RandomRotationPoint]
	]
];

PointPRotatedGraphic = Graphics[
	GeometricTransformation[
		Point[PointP],
		RotationTransform[RandomAngleDegree*magnitudo,RandomRotationPoint]
	]
];

PointPLabelRotatedGraphic = Graphics[
	GeometricTransformation[
		{GrayLevel[0.35],Text["P'",PointP,{-1,-1}]},
		RotationTransform[RandomAngleDegree*magnitudo,RandomRotationPoint]
	]
];

(* Genero la translazione*)

PolygonTranslatedGraphic = Graphics[
	GeometricTransformation[
		PolygonToTranslate,
		TranslationTransform[{
			RandomVector1*magnitudo,
			RandomVector2*magnitudo
		}]
	]
];

PointPTranslatedGraphic = Graphics[
	GeometricTransformation[
		Point[PointP],
		TranslationTransform[{
			RandomVector1*magnitudo,
			RandomVector2*magnitudo
		}]
	]
];

PointPLabelTranslatedGraphic = Graphics[
	GeometricTransformation[
		{GrayLevel[0.35],Text["P'",PointP,{-1,-1}]},
		TranslationTransform[{
			RandomVector1*magnitudo,
			RandomVector2*magnitudo
		}]
	]
];

(* Genero la riflessione *)

PolygonReflectedGraphic = Graphics[
	GeometricTransformation[
		PolygonToReflect,
		ReflectionTransform[
			{
			RandomVector1,
			RandomVector2*magnitudo
		},
		RandomRotationPoint
		]
	]
];


PointPReflectedGraphic = Graphics[GeometricTransformation[
		Point[PointP],
		ReflectionTransform[
			{
			RandomVector1,
			RandomVector2*magnitudo
		},
		RandomRotationPoint
		]
	]
];


PointPReflectedLabelGraphic = Graphics[

	GeometricTransformation[
		{GrayLevel[0.35],Text["P'",PointP,{-1,-1}]},
		ReflectionTransform[
			{
			RandomVector1,
			RandomVector2*magnitudo
		},
		RandomRotationPoint
		]
	
]];


RiflectionLineGraphic = Graphics[{
	GrayLevel[0.85],
	InfiniteLine[
		RandomRotationPoint,
		{1/RandomVector1*magnitudo,-1/RandomVector2}
	]
}];

RiflectionPerpendicularLineGraphic = Graphics[Rotate[{
	GrayLevel[0.45],
	DotDashed,
	InfiniteLine[
		PointP,
		{1/RandomVector1*magnitudo,-1/RandomVector2}
	]
},Pi/2,PointP]];


	Switch[
		tipoTrasformazione,
		"Riflessione",
		 Show[PolygonOriginalGraphic,PointPGraphic,PointPLabelGraphic,PolygonReflectedGraphic,PointPReflectedGraphic,PointPReflectedLabelGraphic,RiflectionPerpendicularLineGraphic,RiflectionLineGraphic,ImageSize->{600,400},GridLines->Automatic,Frame->True,GridLinesStyle -> Directive[LightGray, Dashed]], 
		
		"Translazione",
		Show[PolygonOriginalGraphic,PointPGraphic,PointPLabelGraphic,PolygonTranslatedGraphic,PointPTranslatedGraphic,PointPLabelTranslatedGraphic,ImageSize->{600,400},GridLines->Automatic,Frame->True,GridLinesStyle -> Directive[LightGray, Dashed]],
		"Rotazione",
		Show[PolygonOriginalGraphic,PointPGraphic,PointPLabelGraphic,PolygonRotatedGraphic,PointGraphic,PointLabelGraphic,PointPRotatedGraphic,PointPLabelRotatedGraphic,ImageSize->{600,400},GridLines->Automatic,Frame->True,GridLinesStyle -> Directive[LightGray, Dashed]]
	]

];


(* Stampo il modulo che genera l'isometria in versione manipulate *)
ModuleIsometryManipulate[tipoTrasformazione_]:=Module[{},
	Print[ModuleIsometryGraphic[tipoTrasformazione,True]];
];



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

(* IQTryAgain \[EGrave] l'azione del pulsante che permette di ripetere l'esercizio *)
IQTryAgain := {"Prova ancora":> {
		TipoTrasformazione = ModuleGetCasualIsometry[];
		IsometryGraphic = ModuleIsometryGraphic[TipoTrasformazione,False];
	}};

(* IQMessageAndTryAgain \[EGrave] la finestrella che da un feedback all'utente  *)
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


ModuleMenu[]:=Module[{
	TimeLineToPlotWithImages,
	counterDirectoryNumber
	},

(* Questo modulo crea l'elemento navigazionale a timeline della pagina menu *)
TimeLineToPlotWithImages = <|  |>;

For[
	counterDirectoryNumber = 1,
	counterDirectoryNumber <= 6,
	counterDirectoryNumber++, 
	If[
	FileExistsQ[FileNameJoin[{NotebookDirectory[],ToString[counterDirectoryNumber]}]] ,
	TimeLineToPlotWithImages=Append[
		TimeLineToPlotWithImages,
		Hyperlink[
			Grid[{{

				Import[FileNameJoin[{NotebookDirectory[],ToString[counterDirectoryNumber],"image.png"}]],
				Style[Import[FileNameJoin[{NotebookDirectory[],ToString[counterDirectoryNumber],"title.txt"}]],FontSize->12]				
				
			}}],
			{"ProgettoGeometria.nb", StringJoin[ToString[counterDirectoryNumber],"_intro"]}
			]->{ToExpression[Import[FileNameJoin[{
				NotebookDirectory[],
				ToString[counterDirectoryNumber],
				"year.txt"}
			]]],1,1}
		]
	]
];

Print[Grid[
{{
	TimelinePlot[
		TimeLineToPlotWithImages,
		PlotLayout->"Stacked",
			AxesOrigin->Center
	],
		TextCell[
		Import[FileNameJoin[{"files","intro.txt"}]],
		"Text",
		TextJustification -> 1
	]

}},
Alignment->{{Left,Left},{Top,Top}},
ItemSize -> {{Scaled[.7], Scaled[.3]}},
Frame -> None
]];

];


ModuleNotes[]:=Module[{},
	
	(* Note finali di progetto *)
	Print[Style[ "Note Didattiche","Subtitle"]];
	
	Print[
	TextCell[
		Import[FileNameJoin[{"files","notes_content.txt"}]],
		"Text",
		TextJustification -> 1
	]
	];


];



ModuleNotesProgramming[]:=Module[{},
	
	(* Note finali sulla parte informatica di progetto *)
	Print[Style[ "Note Informatiche","Subtitle"]];
	
	Print[
	TextCell[
		Import[FileNameJoin[{"files","notes_programming.txt"}]],
		"Text",
		TextJustification -> 1
	]
	];


];


ModulePythagoreanGraphicDemo[]:=Module[{
	
},
 (* Dimostrazione grafica del teorema di Pitagora
 Viene creata con dei poligoni colorati che subiscono delle rotazioni/translazioni
 in relazione al valore importato dallo slider che \[EGrave] nominato DimostrazioneGrafica *)
Print[Manipulate[Graphics[{
Line[{{5,0},{8,6}}],

{EdgeForm[{Thick,Blue}],FaceForm[],Polygon[{{6,2},{10,0},{12,4},{8,6}}]},


{EdgeForm[{Thick,Blue}],FaceForm[],Polygon[{{5,0},{6,2},{4,3},{3,1}}]},

{Opacity[0.5],LightGray,Rectangle[{5,0},{10,5}]},
{EdgeForm[{Thick,Red}],Opacity[0.5],Gray,Triangle[{{5,0},{6,2},{10,0}}]},

GeometricTransformation[
	GeometricTransformation[
	{Opacity[0.5],Yellow,Triangle[{{5,0},{5,2.5},{6,2}}]},
RotationTransform[3/2Pi*DimostrazioneGrafica,{6,2}]
],
TranslationTransform[{1*DimostrazioneGrafica,2*DimostrazioneGrafica}]
],

GeometricTransformation[
	GeometricTransformation[
	{Opacity[0.5],Purple,Triangle[{{7.5,5},{10,5},{8,6}}]},
	RotationTransform[3/2Pi*DimostrazioneGrafica,{7.5,5}]
	],
TranslationTransform[{-2.5*DimostrazioneGrafica,-2.5*DimostrazioneGrafica}]
],
	
GeometricTransformation[
		{Opacity[0.5],Green,Triangle[{{10,5},{12,4},{10,0}}]},
		RotationTransform[Pi/2*DimostrazioneGrafica,{10,0}]
	],


	GeometricTransformation[
{Opacity[0.5], Blue, Polygon[{{5,2.5},{5,0},{3,1},{4,3}}]},
	RotationTransform[2/2Pi*DimostrazioneGrafica,{5,2.5}]
	]
},ImageSize->{600,500},
		Axes->False],
{DimostrazioneGrafica,0,1}]];
	Print["\n\n"];
	
];


ModulePythagoreanGraphicFormula[]:=Module[{
	
},

Print[Graphics[{

	{EdgeForm[{Gray}],LightGreen,Polygon[{{6,2},{10,0},{12,4},{8,6}}]},
	{EdgeForm[{Gray}],LightRed,Rectangle[{5,0},{10,-5}]},
	{EdgeForm[{Gray}],LightBlue,Triangle[{{5,0},{6,2},{10,0}}]},

	{EdgeForm[{Gray}],LightGreen,Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
			Black,
			Text[Style["A"^2,"Subtitle",Bold],{4.5,1.5}],
			Text[Style["B"^2,"Subtitle",Bold],{9,3}],
			Text[Style["C"^2,"Subtitle",Bold],{7.5,-2.5}]

	},ImageSize->{600,500},
Axes->False]];
	
];


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
	
	(* TryAgain \[EGrave] l'azione del pulsante che permette di ripetere l'esercizio *)
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
	
	(* TryAgain \[EGrave] l'azione del pulsante che permette di ripetere l'esercizio *)
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


ModulePythagoreanRope[]:=Module[{},

(* Modulo che genera l'oggetto graphics necessario all'esempio della corda *)
Print[Manipulate[
	Graphics[
		{
		Inset[Import[FileNameJoin[{ "files", "obelisk.png" }]], {-1, -2}, {0, 0},{20,13}],
			GeometricTransformation[
				{
					Yellow,
					Thickness[0.01],
					Line[{{0,0},{5,0}}],
					PointSize[0.03],
					Point[{0,0}],
					Point[{1,0}],
					Point[{2,0}],
					Point[{3,0}],
					Point[{4,0}]
				},
				RotationTransform[4/5*(-Pi)*InclinazioneIpotenusa,{5,0}]
			],
			GeometricTransformation[
				{
					Yellow,
					Thickness[0.01],
					Line[{{9,0},{12,0}}],
					PointSize[0.03],
					Point[{10,0}],
					Point[{11,0}],
					Point[{12,0}]
				},
				RotationTransform[1/2*Pi*InclinazioneCateto,{9,0}]
			],
			Yellow,
			Thickness[0.01],
			Line[{{5,0},{9,0}}],
			PointSize[0.03],
			Point[{6,0}],
			Point[{7,0}],
			Point[{8,0}],
			Point[{9,0}],
			Point[{5,0}]	
		},
		PlotRange->{{-1,15},{-1,11}},
		ImageSize->{600,400}
		
	],
	{InclinazioneIpotenusa,0,1},
	{InclinazioneCateto,0,1}
]];
	
];


ModulePythagoreanTriangleRectangleGraphic[SideA_,SideB_,SideC_,SideToGuess_]:=Module[{
	SideToGuessPlaceholder,
	TriangleRectangleGraphic
},

(* Modulo che genera la grafica del triangolo rettangolo 
in azzurro per omogeneita grafica con gli altri esercizi *)
	SideToGuessPlaceholder = Style["???",Bold];
	TriangleRectangleGraphic=Graphics[
		{
			Thickness[0.003],
			LightBlue,
			Polygon[{{0,0},{SideA,0},{SideA,SideB}}],
			Gray,
			Line[{{0,0},{SideA,SideB}}],
			Line[{{0,0},{SideA,0}}],
			Line[{{SideA,0},{SideA,SideB}}],
			Black,
			Text[Style[Row[{"a"," = ",If[SideToGuess=="a",SideToGuessPlaceholder,SideA]}],15],{SideA/2,-1},{2,2}],
			Text[Style[Row[{"b"," = ",If[SideToGuess=="b",SideToGuessPlaceholder,SideB]}],15],{SideA+1,SideB/2},{-2,1}],
			Text[Style[Row[{"c"," = ",If[SideToGuess=="c",SideToGuessPlaceholder,SideC]}],15],{SideA/2-2,SideB/2+1},{2,1}]
		},
		ImageSize->{300,200},
		Axes->False
	];
	
	Return[TriangleRectangleGraphic];
		
];


ModulePythagoreanTriple[]:=Module[{
	PythagoreanTriples,
	RandomPythagoreanTriple
},
(* Estrazione di una terna pitagorica dall'insieme delle terne pitagoriche costituite da interi minori di 100 *)
	PythagoreanTriples =Cases[Append[#, Norm@#] & /@ Subsets[Range[100], {2}], {_, _, _Integer}];
	RandomPythagoreanTriple = RandomChoice[PythagoreanTriples];
	Return[RandomPythagoreanTriple];
	
];


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


ModuleQuiz[directoryNumber_,exerciseNumber_,data_]:=DynamicModule[{
	exerciseQuizFilename,
	ImportedData,
	CheckboxData,
	ChosenAnswer,
	Correction,
	createCheckboxData
},
	
	(* Questo modulo per i quiz \[EGrave] discontinuato, ma viene mantenuto qui in caso di futuro utilizzo *)
	
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


ModuleSetCustomOptions[]:=Module[{
	counterDirectoryNumber
},

(* Vengono settate le opzioni iniziali del programma *)
	SetDirectory[NotebookDirectory[]];
    
	SetOptions[$FrontEnd,ShowCellLabel->False];

	SetOptions[EvaluationNotebook[],DockedCells->Cell[BoxData[ToBoxes[Grid[
		{{
			Import[FileNameJoin[{"files","logo_small.png"}]],
			ActionMenu[
				"              Scegli un argomento             ",
				Table[
					ModuleMenuElement[counterDirectoryNumber],
					{counterDirectoryNumber, 6}
				],
				FieldSize->30
			],
			Button["Menu",NotebookLocate["menu"],Background->White,FrameMargins->Medium],
			Button["Utente",NotebookLocate["user"],Background->White,FrameMargins->Medium],
			Button["Home",NotebookLocate["home"],Background->White,FrameMargins->Medium]
		}},
		ItemSize->{{
			Scaled[0.3],
			Scaled[0.4],
			Scaled[0.1],
			Scaled[0.1],
			Scaled[0.1]
		}},
		Frame-> Transparent
	]]], Background-> RGBColor["#b51d09"]]];

];

ModuleMenuElement[counterDirectoryNumber_]:=Module[{},
	
	Return[Import[FileNameJoin[{
			NotebookDirectory[],
			ToString[counterDirectoryNumber],
			"title.txt"
		}]]:>NotebookLocate[StringJoin[
			ToString[counterDirectoryNumber],
			"_intro"
		]]];
		
	];


ModuleTopMenu[directoryNumber_]:=Module[{},
	(* We decided that we don't like/need a top menu *)
	None
];


ModuleUser[]:=Module[{},
Print[Style[ "Pannello utente","Subsubtitle"]];
ModuleUserLogin[];
ModuleUserQuizReport[];


	
]


ModuleUserLogin[]:=DynamicModule[{Welcome,UserName},


	usernameFilename = FileNameJoin[{"data","username.txt"}];
	userquizFilename = FileNameJoin[{"data","quiz.csv"}];
	
	deleteUsernameFilename := If[
		FileExistsQ[usernameFilename],
		DeleteFile[usernameFilename],
		Null
	];
	
	deleteUserquizFilename := If[
		FileExistsQ[userquizFilename],
		DeleteFile[userquizFilename],
		Null
	];
		
	ResetUserData := Button[
		StringJoin["Non sei ",UserName,"? Clicca qui per resettare i dati relativi all'utente"],
		Welcome = WelcomeYouHaveToSubcribe;
		deleteUsernameFilename;
		deleteUserquizFilename;
		UserName = Null,
		Background->LightGray,
		FrameMargins->Small
	];
		
	WelcomeBack := Grid[{
		{Style[StringJoin[ "Bentornato ", UserName,"!"],"Chapter"]},
		{ResetUserData}
	},Frame->Transparent];
			
	WelcomeForTheFirstTime := Grid[{
		{Style[StringJoin[ "Benvenuto ", UserName,"!"],"Chapter"]},
		{Style["Siamo sicuri che sei impaziente di conoscere la Storia della Geometria.","Text"]},
		{ResetUserData}
	},Frame->Transparent];
			
	WelcomeYouHaveToSubcribe := Grid[{
		{Style[ "Conosciamoci meglio: come ti chiami?","Text"]},
		{Row[{
			InputField[Dynamic[UserName], String,FrameMargins->Medium],
			Button[
				"Salva il tuo nome",
				Welcome = WelcomeForTheFirstTime;
				Export[FileNameJoin[{"data/","username.txt"}], UserName],
				Background->LightGray,
				FrameMargins->Medium
			]
		}]}
	},Frame->Transparent];
	
	If[
		FileExistsQ[usernameFilename],
		UserName=Import[usernameFilename];
		Welcome = WelcomeBack,
		Welcome= WelcomeYouHaveToSubcribe;
	];
	

	
	Print[Style[Dynamic[Welcome]]];




];


ModuleUserQuizReport[]:=DynamicModule[{},
	(* Questo modulo crea la "pagella" del pannello utente *)
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
