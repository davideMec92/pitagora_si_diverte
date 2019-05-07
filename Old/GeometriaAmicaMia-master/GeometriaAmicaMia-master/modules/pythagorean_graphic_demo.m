(* ::Package:: *)

ModulePythagoreanGraphicDemo[]:=Module[{
	
},
 (* Dimostrazione grafica del teorema di Pitagora
 Viene creata con dei poligoni colorati che subiscono delle rotazioni/translazioni
 in relazione al valore importato dallo slider che e' nominato DimostrazioneGrafica *)
Print[Manipulate[Graphics[{
Line[{{5,0},{8,6}}],

{EdgeForm[{Thick,Blue}],FaceForm[],Polygon[{{6,2},{10,0},{12,4},{8,6}}]},


{EdgeForm[{Thick,Blue}],FaceForm[],Polygon[{{5,0},{6,2},{4,3},{3,1}}]},

{Opacity[0.5],LightGray,Rectangle[{5,0},{10,5}]},
{EdgeForm[{Thick,Red}],Opacity[0.5],Gray,Triangle[{{5,0},{6,2},{10,0}}]},

GeometricTransformation[
	GeometricTransformation[
	{Opacity[0.5],Yellow,Triangle[{{5,0},{5,2.5},{6,2}}]},
RotationTransform[3/2Pi*DimostrazioneGrafica,{6,2}]
],
TranslationTransform[{1*DimostrazioneGrafica,2*DimostrazioneGrafica}]
],

GeometricTransformation[
	GeometricTransformation[
	{Opacity[0.5],Purple,Triangle[{{7.5,5},{10,5},{8,6}}]},
	RotationTransform[3/2Pi*DimostrazioneGrafica,{7.5,5}]
	],
TranslationTransform[{-2.5*DimostrazioneGrafica,-2.5*DimostrazioneGrafica}]
],
	
GeometricTransformation[
		{Opacity[0.5],Green,Triangle[{{10,5},{12,4},{10,0}}]},
		RotationTransform[Pi/2*DimostrazioneGrafica,{10,0}]
	],


	GeometricTransformation[
{Opacity[0.5], Blue, Polygon[{{5,2.5},{5,0},{3,1},{4,3}}]},
	RotationTransform[2/2Pi*DimostrazioneGrafica,{5,2.5}]
	]
},ImageSize->{600,500},
		Axes->False],
{DimostrazioneGrafica,0,1}]];
	Print["\n\n"];
	
];
