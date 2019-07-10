(* ::Package:: *)

ModuleOptions[]:=Module[{},



(* Vengono settate le opzioni iniziali del programma *)
	SetDirectory[NotebookDirectory[]];
    
	SetOptions[$FrontEnd,ShowCellLabel->False];

	SetOptions[EvaluationNotebook[],DockedCells->Cell[BoxData[ToBoxes[Grid[
		{{
			Import[FileNameJoin[{"Images","logo_small.png"}]],
			ActionMenu[
				"              Dove vuoi andare?             ",
				{"Euclide Teorema" :> NotebookLocate["_EuclideEnunciato"],
				 "Euclide Dimostrazione" :> NotebookLocate["_EuclideDimostrazione"],
				 "Euclide Esempi" :> NotebookLocate["_EuclideEsempi"],
				 "Euclide Esercizi" :> NotebookLocate["_EuclideEsercizi"],
				 "Pitagora Teorema" :> NotebookLocate["_PitagoraEnunciato"],
				 "Pitagora Dimostrazione" :> NotebookLocate["_PitagoraDimostrazione"],
				 "Pitagora Esempi" :> NotebookLocate["_PitagoraEsempi"],
				 "Pitagora Esercizi" :> NotebookLocate["_PitagoraEsercizi"]}
			],
			Button["Home",NotebookLocate["_intro"],Background->White,FrameMargins->Medium],
			Button["Utente",NotebookLocate["_user"],Background->White,FrameMargins->Medium],
			Button["Help",NotebookLocate["_help"],Background->White,FrameMargins->Medium]
		}},
		ItemSize->{{
			Scaled[0.3],
			Scaled[0.4],
			Scaled[0.1],
			Scaled[0.1],
			Scaled[0.1]
		}},
		Frame-> Transparent
	]]], Background-> RGBColor["#1d8376"]]];

];



