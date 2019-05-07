(* ::Package:: *)

ModuleIsometryGraphic[tipoTrasformazione_,manipulate_]:=DynamicModule[{
	MaxNumber=1000,
	RandomPoligon,
	RandomRotationPoint,
	RandomVector1,
	RandomVector2,
	RandomAngleDegree
},
	
	(* Genera l'oggetto Graphics che rappresenta l'isometria *)
	
	(* Il poligono generato e' creato a partire da 3 o 4 o 5 punti scelti casualmente*)
	RandomPoligon = Polygon[RandomPoint[Rectangle[{0,0},{MaxNumber,MaxNumber}],RandomInteger[{3,5}]]];

	RandomRotationPoint = {
		RandomInteger[{0,MaxNumber}],
		RandomInteger[{0,MaxNumber}]
	};
	
	RandomVector1 = RandomInteger[{0,MaxNumber}];
	RandomVector2 = RandomInteger[{0,MaxNumber}];
	
	RandomAngleDegree = RandomReal[]*2Pi;
	
	(* A seconda che il valore manipulate sia presente o meno, restituisce un oggetto manipulate*)
	If[
		manipulate,
		Manipulate[
			ModuleIsometryGraphicWithMagnitudo[
				RandomPoligon,
				RandomRotationPoint,
				RandomVector1,
				RandomVector2,
				RandomAngleDegree,
				tipoTrasformazione,
				manipulatemagnitudo
			],
			{manipulatemagnitudo,0.1,1}
		],
		ModuleIsometryGraphicWithMagnitudo[
			RandomPoligon,
			RandomRotationPoint,
			RandomVector1,
			RandomVector2,
			RandomAngleDegree,
			tipoTrasformazione,
			1
		]
	]
	
];


ModuleIsometryGraphicWithMagnitudo[
	RandomPoligon_,
	RandomRotationPoint_,
	RandomVector1_,
	RandomVector2_,
	RandomAngleDegree_,
	tipoTrasformazione_,
	magnitudo_
]:=DynamicModule[{
	PolygonOriginal,
	PolygonToRotate,
	PolygonToTranslate,
	PolygonToReflect,
	PointGraphic,
	PointLabelGraphic,
	PolygonOriginalGraphic,
	PolygonRotatedGraphic,
	PolygonTranslatedGraphic,
	PolygonReflectedGraphic,
	RiflectionLineGraphic
},

(* Viene creato un poligono su cui effettuare le trasformazioni
in azzurro per omogeneita grafica con i poligoni del programma *)
PolygonOriginal = {EdgeForm[{Gray}],LightBlue,RandomPoligon};
PolygonToRotate = {Opacity[0.5],Red,RandomPoligon};
PolygonToTranslate = {Opacity[0.5],Red,RandomPoligon};
PolygonToReflect= {Opacity[0.5],Red,RandomPoligon};

PolygonOriginalGraphic=Graphics[
	PolygonOriginal
];

(* Genero la rotazione *)

(* Imposto le grafiche degli oggetti precedentemente creati, con etichette testuali*)
PointGraphic = Graphics[{GrayLevel[0.35],Point[RandomRotationPoint]}];
PointLabelGraphic = Graphics[{GrayLevel[0.35],Text["P",RandomRotationPoint,{-1,-1}]}];

PolygonRotatedGraphic = Graphics[
	GeometricTransformation[
		PolygonToRotate,
		RotationTransform[RandomAngleDegree*magnitudo,RandomRotationPoint]
	]
];

(* Genero la translazione*)

PolygonTranslatedGraphic = Graphics[
	GeometricTransformation[
		PolygonToTranslate,
		TranslationTransform[{
			RandomVector1*magnitudo,
			RandomVector2*magnitudo
		}]
	]
];

(* Genero la riflessione *)

PolygonReflectedGraphic = Graphics[
	GeometricTransformation[
		PolygonToReflect,
		ReflectionTransform[
			{
			RandomVector1,
			RandomVector2*magnitudo
		},
		RandomRotationPoint
		]
	]
];

RiflectionLineGraphic = Graphics[{
	GrayLevel[0.85],
	InfiniteLine[
		RandomRotationPoint,
		{1/RandomVector1*magnitudo,-1/RandomVector2}
	]
}];


	Switch[
		tipoTrasformazione,
		"Riflessione",
		Show[PolygonOriginalGraphic,PolygonReflectedGraphic,RiflectionLineGraphic,ImageSize->{600,400},GridLines->Automatic,Frame->True,GridLinesStyle -> Directive[LightGray, Dashed]],
		"Translazione",
		Show[PolygonOriginalGraphic,PolygonTranslatedGraphic,ImageSize->{600,400},GridLines->Automatic,Frame->True,GridLinesStyle -> Directive[LightGray, Dashed]],
		"Rotazione",
		Show[PolygonOriginalGraphic,PolygonRotatedGraphic,PointGraphic,PointLabelGraphic,ImageSize->{600,400},GridLines->Automatic,Frame->True,GridLinesStyle -> Directive[LightGray, Dashed]]
	]

];
