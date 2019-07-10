(* ::Package:: *)

ModuleDirectoryMenu[slideType_] := Module[{},
	
	(* I pulsanti navigazionali di ogni argomento *)
	(* Questo modulo \[EGrave] comune a ogni slide del progetto e stampa il menu *)
		buttonsNumber = 4;
		
		If[ slideType == null, slideType = "" ];
								
		Print[
			Grid[
				{{
		   			Button["Homepage", NotebookLocate["_intro"], If[slideType=="_intro", Background -> Darker[RGBColor[0,153,153]], Background -> White], FrameMargins ->  Large],
					
		   			Button["Menu Utente", NotebookLocate["_user"], If[slideType=="_user", Background -> Darker[RGBColor[0,153,153]], Background -> RGBColor[29,131,118]], FrameMargins ->  Large],
					
		   			Button["Bibliografia", NotebookLocate["_bibliografia"], If[slideType=="_bibliografia",Background -> Darker[RGBColor[0,153,153]], Background -> RGBColor[29,131,118]], FrameMargins ->  Large],
					
		   			Button["Chi siamo?", NotebookLocate["_about"], If[slideType=="_about", Background -> Darker[RGBColor[0,153,153]], Background -> RGBColor[29,131,118]], FrameMargins ->  Large]
					
		   		}},
		 		ItemSize -> {{Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber]}}, Frame -> Transparent
		 	]
		];

];
