(* ::Package:: *)

ModuleCover[]:=Module[{},

	(* Pagina di copertina del progetto, con il logo, la foto degli autori, alcuni pulsanti navigazionali *)
	
	Print[Import[FileNameJoin[{"files","logo_large.png"}]]];
	Print[Style[ "Progetto di Matematica Computazionale  &  Calcolo Numerico e Software Didattico 2017/2018 (Unibo)\nLuca Angelucci (819862), Filippo Bottonelli (854875), Davide Cristiani (847086), Sara Simoncelli (852141)","Text"]];
	
	Print[TextCell["\"La storia ci delinea percorsi didattici per costruire oggetti matematici, ci intrattiene con aneddoti, ci suggerisce problemi, la storia ci dice perche, fa retrocedere dalla teoria finita alle idee grezze che ne sono alla base\" (Furinghetti, 2007)",FontSize->14,Italic]];
	
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
			"Note",
			NotebookLocate["notes"],
			Background->LightYellow,
			FrameMargins->Large
		]
		}},Frame->Transparent]
	];
	
	Print[Import[FileNameJoin[{"files","group.png"}]]];

];
