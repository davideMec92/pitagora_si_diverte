(* ::Package:: *)

ModulePitagoraEsempi[]:=PitagoraEsempi[{},
(*Commento*)

Print[Style["Dimostrazione Grafica:","Subtitle",Bold]];

(* Dimostrazione grafica del teorema di Pitagora
 Viene creata con dei poligoni colorati che subiscono delle rotazioni/translazioni
 in relazione al valore importato dallo slider che e' nominato DimostrazioneGrafica *)
 
 
Print[Manipulate[Graphics[{
Line[{{5,0},{8,6}}],

{EdgeForm[{Thick,Black}],FaceForm[],Polygon[{{6,2},{10,0},{12,4},{8,6}}]},


{EdgeForm[{Thick,Black}],FaceForm[],Polygon[{{5,0},{6,2},{4,3},{3,1}}]},

{EdgeForm[{Thick,Black}],FaceForm[],Rectangle[{5,0},{10,-5}]},

{EdgeForm[{Thick,Blue}],Opacity[0.5],Gray,Triangle[{{5,0},{6,2},{10,0}}]},

GeometricTransformation[
	GeometricTransformation[
	{Opacity[0.5],Blue,Triangle[{{5,0},{5,2.5},{6,2}}]},
RotationTransform[3/2Pi*DimostrazioneGrafica,{6,2}]
],
TranslationTransform[{1*DimostrazioneGrafica,-3*DimostrazioneGrafica}]
],

GeometricTransformation[
	GeometricTransformation[
	{Opacity[0.5],Orange,Triangle[{{7.5,5},{10,5},{8,6}}]},
	RotationTransform[3/2Pi*DimostrazioneGrafica,{7.5,5}]
	],
TranslationTransform[{-2.5*DimostrazioneGrafica,-7.5*DimostrazioneGrafica}]
],
	
GeometricTransformation[
		GeometricTransformation[
		{Opacity[0.5],Purple,Triangle[{{10,5},{12,4},{10,0}}]},
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

GeometricTransformation[
	GeometricTransformation[
	{Opacity[0.5], Yellow, Polygon[{{5,2.5},{5,0},{3,1},{4,3}}]},
	RotationTransform[2/2Pi*DimostrazioneGrafica,{5,2.5}]
	],
	TranslationTransform[{0*DimostrazioneGrafica,-5*DimostrazioneGrafica}]
]
},ImageSize->{600,500},
		Axes->False],
{DimostrazioneGrafica,0,1}]];
	Print["\n\n"];




EsempioGraficoPit= Graphics[{

	{EdgeForm[{Gray}],LightBlue,Polygon[{{6,2},{10,0},{12,4},{8,6}}]},
	{EdgeForm[{Gray}],LightPurple,Rectangle[{5,0},{10,-5}]},
	{EdgeForm[{Gray}],LightGray,Triangle[{{5,0},{6,2},{10,0}}]},
	{EdgeForm[{Blue}],LightGray, Polygon[{{6,2},{6.2,1.9},{6.1,1.7},{5.9,1.8}}]},  (*Rett-angolo*)

	{EdgeForm[{Gray}],LightRed,Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
			Black,
			Text[Style[ Subscript["c","1"]^2 ,"Subtitle",Bold],{4.5,1.5}],
			Text[Style[ Subscript["c","2"]^2 ,"Subtitle",Bold],{9,3}],
			Text[Style[ "i"^2 ,"Subtitle",Bold],{7.5,-2.5}],
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "B" ,"Text",Bold],{5.97,2.25}],
			Text[Style[ "C" ,"Text",Bold],{10.2,-0.2}],
			
			

	},ImageSize->{600,500},
Axes->False];

Print[Style["Formule del teorema di Pitagora:","Subtitle",Bold]];

Print[EsempioGraficoPit];

Print[Style[ Row[{"Seguendo l'enunciato del teorena di pitagora (indicando con '", Subscript["c","1"], "' e '", Subscript["c","2"], "' i cateti e con 'i' l'ipotenusa)" }],"Text" ]];

Print[Style[Row[{ "i"^2 , " = ", Subscript["c","1"]^2, "+",  Subscript["c","2"]^2 }],"Subsubtitle"]];

Print[Style[ "possiamo ricavare le seguenti uguaglianze","Text"]];

Print[Style[Row[{ Subscript["c","1"]^2 , " = ", "i"^2, "-",  Subscript["c","2"]^2   }],"Subsubtitle"]];
Print[Style[Row[{ Subscript["c","2"]^2 , " = ", "i"^2, "-",  Subscript["c","1"]^2   }],"Subsubtitle"]];


Print[Style[ "E da questi, a loro volta possiamo ricavare le seguenti formule per il calcolo delle misure dei lati, applicando la radice quadrata","Text"]];

Primo= ToString[Subscript["c","1"]^2, FormatType -> StandardForm];	
Secondo= ToString[ Subscript["c","2"]^2,  FormatType -> StandardForm];	
Terzo= ToString[ Subscript["i",""]^2,  FormatType -> StandardForm];
Radish1= Primo <> "+" <> Secondo;
Radish2= Terzo <> "-" <> Secondo;
Radish3= Terzo <> "-" <> Primo;



Print[Style[Row[{ "i" , " = ", Sqrt[Radish1]  }],"Subsubtitle"]];
Print[Style[Row[{ Subscript["c","1"] , " = ", Sqrt[Radish2]   }],"Subsubtitle"]];
Print[Style[Row[{ Subscript["c","2"] , " = ", Sqrt[Radish3]  }],"Subsubtitle"]];

Print["\n"];

Print[Style["Esercizio svolto:","Subtitle",Bold]];

EsempioGraficoPit2= Graphics[{


	{EdgeForm[{Gray}],White,Triangle[{{5,0},{6,2},{10,0}}]},
	{EdgeForm[{Blue}],White, Polygon[{{6,2},{6.2,1.9},{6.1,1.7},{5.9,1.8}}]},  (*Rett-angolo*)

			Black,
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "B" ,"Text",Bold],{5.97,2.25}],
			Text[Style[ "C" ,"Text",Bold],{10.2,-0.2}],
			Text[Style[ "AC=5" ,"Text"],{7,-0.3}],
			Text[Style[ "AB=3" ,"Text"],{5.4,1.5}],
			Text[Style[ "BC=?" ,"Text"],{7.5,1.5}],
			

	},ImageSize->{600,500},
Axes->False];
Print[Style[ Row[{"Di un Rettangolo ABC retto in B, conosciamo la lunghezza dell'ipotenusa AC e del cateto BC rispettivamente AC=5 cm e AB=3 cm." }],"Text" ]];
Print[Style[ Row[{"Vogliamo trovare la lunghezza del cateto CB" }],"Text" ]];
Print[EsempioGraficoPit2];

Print[Style[ Row[{"Svolgimento:" }],"Text", Bold ]];

Print[Style[ Row[{"Dalle formule relative al teorema di Pitagora sappiamo che, data la lunghezza di un cateto e quella dell'ipotenusa \[EGrave] possibile ricavare la lunghezza del cateto rimasto:" }],"Text" ]];

AltroCateto= ToString[ Subscript["Altro Cateto",""]^2,  FormatType -> StandardForm];
Ipotenusa= ToString[ Subscript["Ipotenusa",""]^2,  FormatType -> StandardForm];
Radish4= Ipotenusa <> " - " <> AltroCateto;
Print[Style[Row[{ "Cateto" , " = ", Sqrt[Radish4]  }],"Text"]];

Print[Style[ Row[{"Ottenuamo cos\[IGrave]" }],"Text" ]];

AC= ToString[ Subscript["AC",""]^2,  FormatType -> StandardForm];
BC= ToString[ Subscript["BC",""]^2,  FormatType -> StandardForm];
Radish5= AC <> " - " <> BC;

V5= ToString[ Subscript["5",""]^2,  FormatType -> StandardForm];
N9= ToString[ Subscript["3",""]^2,  FormatType -> StandardForm];
Radish6= V5 <> " - " <> N9;



Print[Style[Row[{ "CB" , " = ", Sqrt[Radish5], " = ", Sqrt[Radish6], " = ", Sqrt["25 - 9"], " = ", Sqrt["16"], " = ", "4"   }],"Text"]];


Print["\n\n"];

Print[Style["Applicazione pratica delle formule del teorema: Distanza tra punti in un piano","Subtitle",Bold]];

Print[Style[ Row[{" Con distanza tra due punti nel piano cartesiano (o distanza euclidea) ci si riferisce alla formula che permette di calcolare la distanza tra due punti a partire dalle coordinate cartesiane." }],"Text" ]];
Print[Style[ Row[{" tale distanza \[EGrave] per definizione non negativa, dunque \[EGrave] positiva oppure \[EGrave] nulla nel caso in cui i due punti coincidano." }],"Text" ]];

	cartesianPlot1 = ListPlot[ {{ 1, 1}, {4, 4} }->{Subscript["P","1"],Subscript["P","2"]}, LabelingFunction->Above, ImageSize->Large, PlotStyle->{ Dashed, PointSize[Large] }, PlotRange-> {{2.5,2.5}, {2.5,2.5}}, GridLines-> Automatic];
   
    Print[cartesianPlot1];

Print[Style[ Row[{" Dati due punti nel piano cartesiano caratterizzati ciscuno da una coppia di coordinate cartesiane (ascissa,ordinata)" }],"Text" ]];
Print[Style[ Row[{" Per calcolare la distanza euclidea tra due punti", Subscript["P","1"], " ", Subscript["P","2"], " indicandola con d(", Subscript["P","1"], " ", Subscript["P","2"], ")"}],"Text" ]];
Print[Style[ Row[{" Possiamo costruire un triangolo rettangolo in cui il segmento cercato ", Subscript["P","1"], Subscript["P","2"], " \[EGrave] l'ipotenusa, ed utilizzare quindi il teorema di Pitagora. " }],"Text" ]];
Print[Style[ Row[{" Essendo i due cateti paralleli agli assi, sappiamo calcolarne facilmente la lunghezza." }],"Text" ]];

	cartesianPlot2 = ListPlot[ {{ 1, 1}, {4, 4}, {4,1}, {1,1} }->{Subscript["P","1"],Subscript["P","2"], "", ""}, LabelingFunction->Above, ImageSize->Large, PlotStyle->{ Dashed, PointSize[Large] }, Joined->True, PlotRange-> {{2.5,2.5}, {2.5,2.5}}, GridLines-> Automatic];
   
    Print[cartesianPlot2];


Print["\n\n"];

Print[Style[ Row[{" La formula finale \[EGrave] piuttosto semplice: si applica il teorema di Pitagora, dove un cateto si ottiene come differenza delle ascisse dei due punti e l'altro sottraendo le loro ordinate." }],"Text" ]];

Xp1= ToString[ Subscript["(X",Subscript["P","1"]],  FormatType -> StandardForm];
Xp2= ToString[ Subscript["X",Subscript["P","2"]],  FormatType -> StandardForm];
Yp2= ToString[ Subscript["Y",Subscript["P","2"]],  FormatType -> StandardForm];
Yp1= ToString[ Subscript["(Y",Subscript["P","1"]],  FormatType -> StandardForm];
X= Xp1 <> "-" <> Xp2 <> ")";
Y= Yp1 <> "-" <> Yp2 <> ")";
QX=ToString[ X ^2,  FormatType -> StandardForm];
QY=ToString[ Y ^2,  FormatType -> StandardForm];
Radish7= QX <> " + " <> QY;


Print[Style[Row[{ "d(", Subscript["P","1"], " ", Subscript["P","2"], ")" , " = ", Sqrt[Radish7]}],"Subtitle" ]];





];
