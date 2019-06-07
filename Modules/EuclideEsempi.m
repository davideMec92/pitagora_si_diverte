(* ::Package:: *)

ModuleEuclideEsempi[]:=EuclideEsempi[{},
(*Commento*)

Print[Style["Dimostrazione Grafica:","Text",Bold]];

(* Dimostrazione grafica del teorema di Euclide, sul cateto maggiore
 Viene creata con dei poligoni colorati che subiscono delle rotazioni/translazioni
 in relazione al valore importato dallo slider che e' nominato DimostrazioneGrafica *)
 
 
Print[Manipulate[Graphics[{
{EdgeForm[{Dashed}],Dashed,Line[{{6,2},{6,0}}]},

{EdgeForm[{Black}],Line[{{6,-5},{6,0}}]},

{EdgeForm[{Thick,Black}],FaceForm[],Polygon[{{6,2},{10,0},{12,4},{8,6}}]},

{EdgeForm[{Thick,Black}],FaceForm[],Rectangle[{6,0},{10,-5}]},

{EdgeForm[{Thick,Blue}],Opacity[0.5],Gray,Triangle[{{5,0},{6,2},{10,0}}]},

GeometricTransformation[
	GeometricTransformation[
	{Opacity[0.5],Blue,Polygon[{{10,5},{11,4.5},{11,4},{10,4}}]},
RotationTransform[Pi*DimostrazioneGrafica,{10,5}]
],
TranslationTransform[{-3*DimostrazioneGrafica,-6*DimostrazioneGrafica}]
],

GeometricTransformation[
	GeometricTransformation[
	{Opacity[0.5],Orange,Triangle[{{7.5,5},{10,5},{8,6}}]},
	RotationTransform[3/2Pi*DimostrazioneGrafica,{7.5,5}]
	],
TranslationTransform[{-1.5*DimostrazioneGrafica,-5.5*DimostrazioneGrafica}]
],
	
GeometricTransformation[
		GeometricTransformation[
		{Opacity[0.5],Yellow,Triangle[{{11,4.5},{11,4},{12,4}}]},
		RotationTransform[3/2Pi*DimostrazioneGrafica,{11,4}]
],
TranslationTransform[{-4*DimostrazioneGrafica,-4*DimostrazioneGrafica}]
],

GeometricTransformation[
		GeometricTransformation[
		{Opacity[0.5],Purple,Triangle[{{10,4},{12,4},{10,0}}]},
		RotationTransform[Pi/2*DimostrazioneGrafica,{10,0}]
	],
	TranslationTransform[{0*DimostrazioneGrafica,-5*DimostrazioneGrafica}]
],

GeometricTransformation[
		GeometricTransformation[
		{Opacity[0.5],Black,Polygon[{{10,5},{7.5,5},{6,2},{10,0}}]},
		RotationTransform[0*DimostrazioneGrafica,{10,0}]
	],
	TranslationTransform[{0*DimostrazioneGrafica,-5*DimostrazioneGrafica}]
],


},ImageSize->{600,500},
		Axes->False],
{DimostrazioneGrafica,0,1}]];
	Print["\n\n"];

Print["\n"];


];
