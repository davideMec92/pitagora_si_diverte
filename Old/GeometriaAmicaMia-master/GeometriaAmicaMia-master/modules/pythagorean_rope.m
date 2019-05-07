(* ::Package:: *)

ModulePythagoreanRope[]:=Module[{},

(* Modulo che genera l'oggetto graphics necessario all'esempio della corda *)
Print[Manipulate[
	Graphics[
		{
		Inset[Import[FileNameJoin[{ "files", "obelisk.png" }]], {-1, -2}, {0, 0},{20,13}],
			GeometricTransformation[
				{
					Yellow,
					Thickness[0.01],
					Line[{{0,0},{5,0}}],
					PointSize[0.03],
					Point[{0,0}],
					Point[{1,0}],
					Point[{2,0}],
					Point[{3,0}],
					Point[{4,0}]
				},
				RotationTransform[4/5*(-Pi)*InclinazioneIpotenusa,{5,0}]
			],
			GeometricTransformation[
				{
					Yellow,
					Thickness[0.01],
					Line[{{9,0},{12,0}}],
					PointSize[0.03],
					Point[{10,0}],
					Point[{11,0}]
				},
				RotationTransform[1/2*Pi*InclinazioneCateto,{9,0}]
			],
			Yellow,
			Thickness[0.01],
			Line[{{5,0},{9,0}}],
			PointSize[0.03],
			Point[{6,0}],
			Point[{7,0}],
			Point[{8,0}],
			Point[{9,0}],
			Point[{5,0}]	
		},
		PlotRange->{{-1,15},{-1,11}},
		ImageSize->{600,400}
		
	],
	{InclinazioneIpotenusa,0,1},
	{InclinazioneCateto,0,1}
]];
	
];
