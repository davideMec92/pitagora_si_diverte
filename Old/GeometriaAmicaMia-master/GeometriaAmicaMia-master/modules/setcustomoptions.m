(* ::Package:: *)

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