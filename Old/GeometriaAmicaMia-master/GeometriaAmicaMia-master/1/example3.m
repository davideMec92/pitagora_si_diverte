(* ::Package:: *)

Module[{},

(* Importazione dell'immagine del reperto egizio ed evidenziazione in rosso della riflessione *)

FaraoniImage = Import[FileNameJoin[{ NotebookDirectory[], directoryNumber, "example3.png" }]];
FaraoneRossoImage = Import[FileNameJoin[{ directoryNumber, "example3_shape.png" }]];

Print[Manipulate[
	Graphics[
		{
			Inset[FaraoniImage, {0, 0}, {20, 20},{50,50}],
			If[
				Riflessione,
				GeometricTransformation[
					Inset[FaraoneRossoImage, {0,0}, {20, 20}, {50, 50}],
					ReflectionTransform[{1,0},{23,28}]
				],
				Inset[FaraoneRossoImage, {0, 0}, {20, 20},{50,50}]
			],
			{Opacity[0.5],Red,InfiniteLine[{23,28},{0,1}]}
		},
		PlotRange -> {{0, 50}, {0, 50}},
	    ImageSize -> 400
	],
    {Riflessione,{False,True}} 
]];

];
