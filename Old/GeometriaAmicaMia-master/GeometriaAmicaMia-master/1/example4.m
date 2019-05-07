(* ::Package:: *)

Module[{},

(* Importazione dell'immagine del reperto egizio ed evidenziazione in rosso delle due translazioni *)

SchiaviImage = Import[FileNameJoin[{ NotebookDirectory[], directoryNumber, "example4.png" }]];
SchiavoRosso1Image = Import[FileNameJoin[{ directoryNumber, "example4_shape1.png" }]];
SchiavoRosso2Image = Import[FileNameJoin[{ directoryNumber, "example4_shape2.png" }]];
 
Print[Manipulate[
	Graphics[
		{
			Inset[SchiaviImage, {0, 0}, {0, 0},{60,35}],
			GeometricTransformation[
				Inset[SchiavoRosso1Image,  {0, 0}, {0, 0},{60,35}],
				TranslationTransform[{TranslazioneFiguraSuperiore,0}]
			],
			GeometricTransformation[
				Inset[SchiavoRosso2Image,  {0, 0}, {0, 0},{60,35}],
				TranslationTransform[{TranslazioneFiguraInferiore,0}]
			]
		},
		PlotRange -> {{0, 60}, {0, 35}},
		ImageSize -> {600,350}
	],
	{TranslazioneFiguraSuperiore,0,12} ,  {TranslazioneFiguraInferiore,0,20} 
]];

];
