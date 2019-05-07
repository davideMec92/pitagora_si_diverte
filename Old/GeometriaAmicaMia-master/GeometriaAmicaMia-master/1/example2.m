(* ::Package:: *)

Module[{},

(* Importazione dell'immagine del reperto egizio ed evidenziazione in rosso della rotazione *)

PesciImage = Import[FileNameJoin[{ NotebookDirectory[], directoryNumber, "example2.png" }]];
PesceRossoImage = Import[FileNameJoin[{ directoryNumber, "example2_shape.png" }]];

Print[Manipulate[
	Graphics[
		{
			Inset[PesciImage, {0, 0}, {20, 20},{50,50}],
			GeometricTransformation[
			Inset[PesceRossoImage, {0,0}, {20, 20}, {50, 50}],
			RotationTransform[AngoloDiRotazione,{24,23}]
			]
		},
		PlotRange -> {{0, 50}, {0, 50}},
		ImageSize -> 400
	],
	{AngoloDiRotazione, 0,2Pi}
]];
   
];
