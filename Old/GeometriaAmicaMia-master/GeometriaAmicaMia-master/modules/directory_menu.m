(* ::Package:: *)

ModuleDirectoryMenu[directoryNumber_, slideType_] := Module[{},

	directoryFilename = directoryNumber;
	
	(* I pulsanti navigazionali di ogni argomento *)
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
(*
Button["Esempi",NotebookLocate[StringJoin[ToString[directoryNumber],"_examples"]]]
HAS BEEN CHANGED TO 
Hyperlink["Esempi", {"ProgettoGeometria.nb", StringJoin[directoryNumber,"_examples"]}]
BECAUSE directoryNumber WAS EVALUATED DINAMICALLY (OUTSIDE OF THE SCOPE)
*)



