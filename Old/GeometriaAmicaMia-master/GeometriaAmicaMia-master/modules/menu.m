(* ::Package:: *)

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
