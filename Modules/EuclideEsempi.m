(* ::Package:: *)

ModuleEuclideEsempi[]:=EuclideEsempi[{},
(*Commento*)

Print[Style["Dimostrazione Grafica:","Text",Bold]];

(* Dimostrazione grafica del teorema di Euclide, sul cateto maggiore
 Viene creata con dei poligoni colorati che subiscono delle rotazioni/translazioni
 in relazione al valore importato dallo slider che e' nominato DimostrazioneGrafica *)

demonstrationManipulate = Manipulate[Graphics[{
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
{DimostrazioneGrafica,0,1}]; 

Print[ demonstrationManipulate ];

EuclideEsempio2[];

];

EuclideEsempio2[]:=Module[{},

Print[Style[ "Teorema di Euclide - Spiegazione matematica","Subsubtitle", Bold]];

esempio2Grafico = Graphics[{

	{EdgeForm[{Gray}],LightPurple,Rectangle[{5,0},{6,-5}]},
	{EdgeForm[{Gray}],LightGray,Triangle[{{5,0},{6,2},{10,0}}]},

	{EdgeForm[{Gray}],LightPurple, Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
	
	{EdgeForm[{Blue}],LightGray, Polygon[{{6,2},{6.2,1.9},{6.1,1.7},{5.9,1.8}}]},  (*Rett-angolo*)
	{EdgeForm[{Dashed}],Dashed, Opacity[0.7],Line[{{6,2},{6,0}}]},
	
			Black,
			Text[Style[ Q ,"Subtitle",Bold],{4.5,1.5}],
			Text[Style[ R ,"Subtitle",Bold],{5.5,-2.7}],
			
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "C" ,"Text",Bold],{5.97,2.25}],
			Text[Style[ "B" ,"Text",Bold],{10.2,-0.2}],
			
			Text[Style[ "H" ,"Text",Bold],{6.2,-0.2}],
			Text[Style[ "F" ,"Text",Bold],{4.8,-5.2}],
			Text[Style[ "G" ,"Text",Bold],{6.2,-5.2}],
			
			Text[Style[ "D" ,"Text",Bold],{4,3.2}],
			Text[Style[ "E" ,"Text",Bold],{2.8,1}],
			
			Text[Style[ Q\[DotEqual]R ,"Subtitle",Bold],{9,3}],
		
	},ImageSize->{600,500},
Axes->False];
	
Print[esempio2Grafico];

Print[Style[ "Seguendo l'enunciato del primo teorema di Euclide avremo che","Text"]];

Print[Style[Row[{"AC"^2, " = AH x AB"}],"Subsubtitle", Bold] ];

Print[Style[Row[{"AC"^2, " rappresenta l'area del quadrato costruito sul cateto AC, mentre AH x AB \[EGrave] l'area del rettangolo che ha per dimensioni la proiezione
del cateto AC sull'ipotenusa e l'ipotenusa stessa "}],"Text"] ];

loginButton = Button[
					"medio proporzionale",
					(
						MessageDialog[ "Date due grandezze A e B, il medio proporzionale M \[EGrave] dato da: A:M = M: B"];
					)
				];

Print[Style[ Row[{"Alla luce di questo possiamo affermare che: in un triangolo rettangolo, ciascun cateto \[EGrave] il ", loginButton, "tra l'ipotenusa e la proiezione
del cateto sull'ipotenusa" }] ,"Text"]];

Print[Style[ "In formule questo si traduce nelle seguenti proporzioni: ","Text"]];

Print[Style[Row[{"AB : CB = CB : HB"}],"Subsubtitle", Bold] ];
Print[Style[Row[{"AB : AC = AC : AH"}],"Subsubtitle", Bold] ];

Print[Style["Esempio esercizio","Subsubtitle", Bold] ];

Print[Style[ "Calcolare il perimetro di un triangolo rettangolo ","Text"]];

];
