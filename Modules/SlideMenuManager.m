(* ::Package:: *)

ModuleDirectoryMenu[slideType_] := Module[{},
	
	(* I pulsanti navigazionali di ogni argomento *)
	(* Questo modulo \[EGrave] comune a ogni slide del progetto e stampa il menu *)
		buttonsNumber = 4;
		
		If[ slideType == null, slideType = "" ];
								
		Print[
			Grid[
				{{
		   			Button["Introduzione", NotebookLocate["_intro"], If[slideType=="_intro", Background -> Orange, Background -> LightYellow], FrameMargins ->  Large],
					
		   			Button["Esempi", NotebookLocate["_examples"], If[slideType=="_examples", Background -> Orange, Background -> LightYellow], FrameMargins ->  Large],
					
		   			Button["Esercizi", NotebookLocate["_exercises"], If[slideType=="_exercises",Background -> Orange, Background -> LightYellow], FrameMargins ->  Large],
					
		   			Button["Teoria", NotebookLocate["_theory"], If[slideType=="_theory", Background -> Orange, Background -> LightYellow], FrameMargins ->  Large]
					
		   		}},
		 		ItemSize -> {{Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber]}}, Frame -> Transparent
		 	]
		];

];
