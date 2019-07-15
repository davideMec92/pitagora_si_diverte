(* ::Package:: *)

ModuleEuclideDimostrazione[]:=EuclideDimostrazione[{},
(*Commento*)

Print[Style[ "Dimostrazione del teorema di Euclide","Subsubtitle", Bold]];

(*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*)	
	
Qi= ToString[Subscript["Q","i"], FormatType -> StandardForm];
Qc1= ToString[Subscript["Q","c1"], FormatType -> StandardForm];
Qc2= ToString[Subscript["Q","c2"], FormatType -> StandardForm];
R1= ToString[Subscript["R","1"], FormatType -> StandardForm];
R2= ToString[Subscript["R","2"], FormatType -> StandardForm];	

Testo0= "Disegnamo il quadrato ACDE ed il rettangolo AFGH in modo che AF\[TildeFullEqual]AB";				
Testo1= "Prolunghiamo il lato ED";
Testo2= "Prolunghiamo FA e GH fino ad incontrare il prolungamento di ED nei punti M ed N";
Testo3= "Chiamo \[Alpha] l'angolo CAB e \[Alpha]' l'angolo EAM e \[Beta] l'angolo MAC";
Testo4= "Prendo in considerazione i triangoli ABC ed AEM, essi hanno:";
Testo5= "Angolo \[Alpha] \[TildeFullEqual] \[Alpha]', in quanto complementari dello stesso angolo \[Beta] (si noti che gli angoli MAB e EAC sono entrambi retti)";
Testo6= "AC \[TildeFullEqual] AE, essendo un quadrato per costruzione";
Testo7= "Angoli C \[TildeFullEqual] E, retti per costruzione";
Testo8= "I Triangoli ABC e AEM sono congruenti per il secondo criterio";
Testo9= "In Particolare AB\[TildeFullEqual]AM";
Testo10= "Prendo in considerazione il quadrilatero ACNM, che \[EGrave] un parallelogramma per costruzione, e il quadrato ACDE, Essi hanno";
Testo11= "La base AC in comune e l'altezza EA in comune";
Testo12= "Pertanto ACNM \[EGrave] equivalente ad ACDE";
Testo13= "Prendo in considerazione il parallelogramma ACNM e il rettangolo AFGH, essi hanno";
Testo14= "Basi AM ed AF congruenti (entrambe congruenti ad AB, per quanto dimostrato al punto 9: AF\[TildeFullEqual]AB\[TildeFullEqual]AM)";
Testo15= "Stessa altezza AH";
Testo16= "Pertanto ACNM \[EGrave] equivalente ad AHFG";
Testo17= "Applicando la propriet\[AGrave] transitiva, poiche ACNM\[DotEqual]ACDE e AFGH\[DotEqual]ACNM, otteniamo che ACDE\[DotEqual]AFGH ovvero Q\[DotEqual]R";

passaggiList = {abstract=0,bolero=0,canada=0,detoide=0,exercise=0,faggot=0,grinch=0,h=0,igloo=0,jackdaniels=0,kilo=0,lime=0,mikewasosky=0,november=0,\[NTilde]andu=0,omega=0,papa=0};
x=0;



Todo= Manipulate[Grid[{
	{Graphics[{

		
		{EdgeForm[{Gray}],White,Rectangle[{5,0},{6,-5}]},
		{EdgeForm[{Gray}],White,Triangle[{{5,0},{6,2},{10,0}}]},
		{EdgeForm[{Gray}],White, Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
		{EdgeForm[{Dashed}],Dashed, Opacity[0.7],Line[{{6,2},{6,0}}]},
		
		White,Point[{6.2,7.4}],
		Black,
			If[passaggiList[[1]]==0,{Text[Style[ Q ,"Subtitle",Bold],{4.5,1.5}]},,],
			If[passaggiList[[1]]==0,{Text[Style[ R ,"Subtitle",Bold],{5.5,-2.7}]},,],
			
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "C" ,"Text",Bold],{6.2,2.2}],
			Text[Style[ "B" ,"Text",Bold],{10.2,-0.2}],
			
			Text[Style[ "H" ,"Text",Bold],{6.2,-0.2}],
			Text[Style[ "F" ,"Text",Bold],{4.8,-5.2}],
			Text[Style[ "G" ,"Text",Bold],{6.2,-5.2}],
			
			Text[Style[ "D" ,"Text",Bold],{4,3.2}],
			Text[Style[ "E" ,"Text",Bold],{2.8,1}],
			
			If[passaggiList[[9]]==0,{Text[Style[ AF\[TildeFullEqual]AB ,"Text",Bold],{9,4}]},,],
			
			
			If[passaggiList[[9]]==0,{Text[Style[ "X" ,"Text",Blue],{8,0}]},,],
			If[passaggiList[[9]]==0,{Text[Style[ "X" ,"Text", Blue],{5,-2.7}]},,],
			
			(*1*)
			If[passaggiList[[1]]==1,{EdgeForm[{Dashed}],Dashed,Line[{{3,1},{6.2,7.4}}]},,],
		
			(*2*)
			If[passaggiList[[2]]==1,{EdgeForm[{Dashed}],Dashed,Line[{{5,0},{5,6}}]},,],
			If[passaggiList[[2]]==1,{EdgeForm[{Dashed}],Dashed,Line[{{6,0},{6,7.2}}]},,],
			If[passaggiList[[2]]==1,{Text[Style[ "M" ,"Text",Bold],{4.85,5.1}]},,],
			If[passaggiList[[2]]==1,{Text[Style[ "N" ,"Text",Bold],{5.85,7}]},,],
			If[passaggiList[[2]]==1,{Point[{5, 5}]},,],
			If[passaggiList[[2]]==1,{Point[{6, 7}]},,],
			
			(*3*)
			Red,
			If[passaggiList[[3]]==1 && passaggiList[[9]]==0,{Circle[{5, 0}, 0.3, {0,  1.1}]},,],
			If[passaggiList[[3]]==1 && passaggiList[[9]]==0,{Circle[{5, 0}, 0.3, {Pi/2,  2.7}]},,],
			If[passaggiList[[3]]==1 && passaggiList[[9]]==0,{Text[Style[ "\[Alpha]'" ,"Text"],{4.85,0.4}]},,],
			If[passaggiList[[3]]==1 && passaggiList[[9]]==0,{Text[Style[ "\[Alpha]" ,"Text"],{5.40,0.3}]},,],			
			Purple,
			If[passaggiList[[3]]==1 && passaggiList[[9]]==0,{Circle[{5, 0}, 0.3, {Pi/3, Pi/2}]},,],
			If[passaggiList[[3]]==1 && passaggiList[[9]]==0,{Text[Style[ "\[Beta]" ,"Text"],{5.12,0.5}]},,],
			Black,
			
			(*4*)
			{FaceForm[{Purple}], Yellow,Opacity[(passaggiList[[4]](1-passaggiList[[9]]))/2],Polygon[{{5,0},{3,1},{5,5}}]},
			{FaceForm[{Purple}], Yellow,Opacity[(passaggiList[[4]](1-passaggiList[[9]]))/2],Polygon[{{5,0},{6,2},{10,0}}]},
			
			(*5*)
			Red,
			{EdgeForm[{Transparent}],Orange,Opacity[(passaggiList[[5]](1-passaggiList[[9]]))/1.5],Disk[{5, 0}, 0.3, {0,  1.1}]},
			{EdgeForm[{Transparent}],Orange,Opacity[(passaggiList[[5]](1-passaggiList[[9]]))/1.5],Disk[{5, 0}, 0.3, {Pi/2,  2.7}]},
			Black,
			
			(*Angoli retti complementari, necessario evidenziare?*)
			
			If[passaggiList[[5]]==1 && passaggiList[[6]]==0,{EdgeForm[{Blue,Dashed}],Opacity[0], Polygon[{{5,0},{5.3,0},{5.3,0.3},{5,0.3}}]},,],
			If[passaggiList[[5]]==1 && passaggiList[[6]]==0,{EdgeForm[{Blue,Dashed}],Opacity[0], Polygon[{{5,0},{4.7,0.15},{4.85,0.46},{5.162,0.3}}]},,],
			
			(*6*)
			If[passaggiList[[6]] == 1 && passaggiList[[9]]==0,{Text[Style[ "X" ,"Text", Bold, Orange],{5.52,1}]},,],
			If[passaggiList[[6]] == 1 && passaggiList[[9]]==0,{Text[Style[ "X" ,"Text", Bold, Orange],{4,0.5}]},,],
			
			(*7*)
			If[passaggiList[[7]] == 1 && passaggiList[[9]]==0, {EdgeForm[{Orange}],Orange, Opacity[0.7], Polygon[{{6,2},{6.2,1.9},{6.1,1.7},{5.9,1.8}}]},,],
			If[passaggiList[[7]] == 1 && passaggiList[[9]]==0,{EdgeForm[{Orange}],Orange, Opacity[0.7], Polygon[{{3,1},{3.2,0.9},{3.32,1.11},{3.1,1.22}}]},,],
			
			(*8*)
			
			(*9*)
			Orange,
			If[passaggiList[[9]] == 1 && passaggiList[[10]]==0,{Line[{{5,0},{5,5}}]},,],
			If[passaggiList[[9]] == 1 && passaggiList[[10]]==0,{Line[{{5,0},{10,0}}]},,],
			If[passaggiList[[9]] == 1,{Text[Style[ "X" ,"Text", Bold, Orange],{5.02,2.7}]},,],
			If[passaggiList[[9]] == 1,{Text[Style[ "X" ,"Text", Bold, Orange],{8,0}]},,],
			If[passaggiList[[9]] == 1,{Text[Style[ "X" ,"Text", Bold, Orange],{5,-2.7}]},,],
			Black,
			If[passaggiList[[9]] == 1,{Text[Style[ AF\[TildeFullEqual]AB\[TildeFullEqual]AM ,"Text",Bold],{8.7,4}]},,],
			
			(*10*)
			{FaceForm[{Purple}], Orange,Opacity[(passaggiList[[10]](1-passaggiList[[12]]))/3],Polygon[{{5,0},{6,2},{6,7},{5,5}}]},
			{FaceForm[{Purple}], Orange,Opacity[(passaggiList[[10]](1-passaggiList[[12]]))/3],Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
			
			(*11*)
			
			If[passaggiList[[11]] == 1 && passaggiList[[13]]==0,{Text[Style[ "X" ,"Subtitle", Bold, Red],{5.52,1}]},,],

			If[passaggiList[[11]] == 1 && passaggiList[[13]]==0,{Text[Style[ "/" ,"Subtitle", Bold, Red],{4,0.5}]},,],
			
			(*12*)
			{FaceForm[{Purple}], LightOrange,Opacity[(passaggiList[[12]])/4],Polygon[{{5,0},{6,2},{6,7},{5,5}}]},
			{FaceForm[{Purple}], LightOrange,Opacity[(passaggiList[[12]])/4],Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
			
			If[passaggiList[[12]] == 1 && passaggiList[[16]]==0,{Text[Style[ ACDE\[DotEqual]ACMN ,"Text",Bold],{8.7,3}]},,],
		
			
			(*13*)
			{FaceForm[{Purple}], LightBlue,Opacity[(passaggiList[[13]](1-passaggiList[[17]]))/1.5],Polygon[{{5,0},{6,2},{6,7},{5,5}}]},			
			{FaceForm[{Purple}], LightBlue,Opacity[(passaggiList[[13]](1-passaggiList[[17]]))/1.5],Polygon[{{5,0},{6,0},{6,-5},{5,-5}}]},
			
			(*14*)
			
			If[passaggiList[[14]] == 1 && passaggiList[[17]]==0,{Text[Style[ "X" ,"Subtitle", Bold, Orange],{5.02,2.7}]},,],
			If[passaggiList[[14]] == 1 && passaggiList[[17]]==0,{Text[Style[ "X" ,"Subtitle", Bold, Orange],{8,0}]},,],
			If[passaggiList[[14]] == 1 && passaggiList[[17]]==0,{Text[Style[ "X" ,"Subtitle", Bold, Orange],{5,-2.7}]},,],
			
			(*15*)
			If[passaggiList[[15]] == 1 && passaggiList[[17]]==0,{Text[Style[ "h" ,"Subtitle", Bold, Orange],{5.5,0}]},,],
			
			(*16*)
			{FaceForm[{Purple}], LightOrange,Opacity[(passaggiList[[16]])/4],Polygon[{{5,0},{6,2},{6,7},{5,5}}]},
			{FaceForm[{Purple}], LightOrange,Opacity[(passaggiList[[16]])/4],Polygon[{{5,0},{6,0},{6,-5},{5,-5}}]},
			If[passaggiList[[16]] == 1 ,{Text[Style[ ACDE\[DotEqual]ACMN\[DotEqual]AHFG ,"Text",Bold],{8.3,3}]},,],
			
			(*17*)
			
			If[passaggiList[[17]] == 1,{Text[Style[ Q ,"Text",Bold],{4.5,1.5}]},,],
			If[passaggiList[[17]] == 1,{Text[Style[ R ,"Text",Bold],{5.5,-2.7}]},,],
			If[passaggiList[[17]] == 1 ,{Text[Style[ Q\[DotEqual]R ,"Text",Bold],{9,-3}]},,],
			
(*FINE*)			
	 },ImageSize->{Scaled[0.29],Scaled[1]}], 
	 
	 Grid[{ {""},
			{If[passaggiList[[4]]==0, Text[Style[Testo0, TextAlignment->Left, LineIndent -> 0]], If[passaggiList[[4]]==1 && passaggiList[[10]]==0,Text[Style[Testo4, TextAlignment->Left, LineIndent -> 0]],If[passaggiList[[10]]==1 && passaggiList[[13]]==0,Text[Style[Testo10, TextAlignment->Left, LineIndent -> 0]],If[passaggiList[[13]]==1 && passaggiList[[17]]==0,Text[Style[Testo13, TextAlignment->Left, LineIndent -> 0]],If[passaggiList[[17]]==1,Text[Style[Testo17, TextAlignment->Left, LineIndent -> 0]],,],],],] ,]},
			{""},
			{""},
			{If[passaggiList[[1]]==1 && passaggiList[[4]]==0, Text[Style[Testo1, TextAlignment->Left, LineIndent -> 0]], If[passaggiList[[5]]==1 && passaggiList[[10]]==0,Text[Style[Testo5, TextAlignment->Left, LineIndent -> 0]] ,If[passaggiList[[11]]==1 && passaggiList[[13]]==0,Text[Style[Testo11, TextAlignment->Left, LineIndent -> 0]],If[passaggiList[[14]]==1 && passaggiList[[17]]==0,Text[Style[Testo14, TextAlignment->Left, LineIndent -> 0]],,],],],]},
			{""},
			{""},
			{If[passaggiList[[2]]==1 && passaggiList[[4]]==0,Text[Style[Testo2, TextAlignment->Left, LineIndent -> 0]], If[passaggiList[[6]]==1 && passaggiList[[10]]==0,Text[Style[Testo6, TextAlignment->Left, LineIndent -> 0]],If[passaggiList[[12]]==1 && passaggiList[[13]]==0,Text[Style[Testo12, TextAlignment->Left, LineIndent -> 0]],If[passaggiList[[15]]==1 && passaggiList[[17]]==0,Text[Style[Testo15, TextAlignment->Left, LineIndent -> 0]],,],],],]}, 
			{""},
			{""},
			{If[passaggiList[[3]]==1 && passaggiList[[4]]==0,Text[Style[Testo3, TextAlignment->Left, LineIndent -> 0]], If[passaggiList[[7]]==1 && passaggiList[[10]]==0,Text[Style[Testo7, TextAlignment->Left, LineIndent -> 0]],If[passaggiList[[16]]==1 && passaggiList[[17]]==0,Text[Style[Testo16, TextAlignment->Left, LineIndent -> 0]],,],],]}, 
			{""},
			{""},
			{If[passaggiList[[8]]==1 && passaggiList[[10]]==0,Text[Style[Testo8, TextAlignment->Left, LineIndent -> 0]],,]}, 
			{""},
			{""},
			{If[passaggiList[[9]]==1 && passaggiList[[10]]==0,Text[Style[Testo9, TextAlignment->Left, LineIndent -> 0]],,]}, 
			{""},  
			{""}},ItemSize->Scaled[1], Alignment -> {Left}]
	 
	
 }}],      
Row [
{Button["Precedente", If[x>0,(passaggiList[[x]]=0; x--;)], ImageSize -> 200],
Button["Prossimo", If[x<17,(x++; passaggiList[[x]]=1;)], ImageSize -> 200]},
 Alignment -> Center],
 ControlPlacement -> Top, 
 FrameMargins -> 0, ContentSize -> Scaled[1]]
;


Print[Todo];



	
Print["\n\n"];


];
