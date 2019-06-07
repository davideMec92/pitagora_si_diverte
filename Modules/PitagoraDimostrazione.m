(* ::Package:: *)

ModulePitagoraDimostrazione[]:=PitagoraDimostrazione[{},
(*Commento*)

Print[Style[ "Dimostrazione del teorema di Pitagora","Subsubtitle", Bold]];


Dimostrazione= Graphics[{

	{EdgeForm[{Gray}],White,Polygon[{{6,2},{10,0},{12,4},{8,6}}]},
	{EdgeForm[{Gray}],White,Rectangle[{5,0},{10,-5}]},
	{EdgeForm[{Black}],White,Triangle[{{5,0},{6,2},{10,0}}]},

	{EdgeForm[{Dashed}],Dashed,Line[{{6,2},{6,0}}]},
	{EdgeForm[{Dashed}],Line[{{6,0},{6,-5}}]},
	{EdgeForm[{Gray}],White,Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
	
	{FaceForm[{Purple}], Purple,Opacity[0.5],Polygon[{{6,2},{10,0},{12,4},{8,6}}]},
	{FaceForm[{Purple}], Purple,Opacity[0.5],Polygon[{{6,0}, {10,0},{10,-5},{6,-5}}]},
	{FaceForm[{Yellow}], Yellow,Opacity[0.5],Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
	{FaceForm[{Yellow}], Yellow,Opacity[0.5],Polygon[{{5,0}, {6,0},{6,-5},{5,-5}}]},
	
			Black,
			Text[Style[ Subscript[Q,c1] ,"Subtitle",Bold],{4.5,1.5}],
			Text[Style[ Subscript[Q,c2] ,"Subtitle",Bold],{9,3}],
			Text[Style[ Subscript[Q,"i"] ,"Subtitle",Bold],{4.8,-2.5}],
			Text[Style[ Subscript[R,"1"] ,"Subtitle",Bold],{5.55,-2.5}],
			Text[Style[ Subscript[R,"2"] ,"Subtitle",Bold],{7.8,-2.5}],
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "B" ,"Text",Bold],{5.97,2.25}],
			Text[Style[ "C" ,"Text",Bold],{10.2,-0.2}],
			Text[Style[ "H" ,"Text",Bold],{6.2,0.2}],
			
			
			

	},ImageSize->{600,500},Axes->False];
	
(*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*)	
	
Qi= ToString[Subscript["Q","i"], FormatType -> StandardForm];
Qc1= ToString[Subscript["Q","c1"], FormatType -> StandardForm];
Qc2= ToString[Subscript["Q","c2"], FormatType -> StandardForm];
R1= ToString[Subscript["R","1"], FormatType -> StandardForm];
R2= ToString[Subscript["R","2"], FormatType -> StandardForm];	

Bottoni= Checkbox[{{a, 1, "f(x)"}, {1, 0}}];
		
Testo=If[0 == 1, "f(x)", "Tracciamo BH, altezza relativa all'ipotenusa, e la prolunghiamo in modo da dividere "<> Qi <>" nei due rettangoli "<> R1 <>" ed "<> R2 <>""];


Griglia= Grid[{
			{"Passaggi"},
			{Bottoni},
			{""},
			{""},
			{Testo},
			{""},
			{""},
			{"Dal primo teorema di Euclide abbiamo capito che "<> Qc1 <>" \[EGrave] equivalente a  "<> R1 <>""}, 
			{""},
			{""},
			{"Sempre da Euclide abbiamo che "<> Qc2 <>" \[EGrave] equivalente a "<> R2 <>""}, 
			{""},
			{""},
			{"Sapendo che "<> Qi <>" = "<> R1 <>" + "<> R2 <>" e dato che "<> R1 <>" = "<> Qc1 <>" e "<> R2 <>" = "<> Qc2 <>", otteniamo che "<> Qi <>" = "<> Qc1 <>" + "<> Qc1 <>""} 
       }];
       
       (*EdgeForm[{Gray, If[a == 1, Opacity[1], Opacity[0]]}],White,Polygon[{{6,2},{10,0},{12,4},{8,6}}]}*)
       
       
TodX= Grid[{{Dimostrazione,Griglia}}];

Todo= Manipulate[Graphics[{

	{EdgeForm[{Gray}],White,Polygon[{{6,2},{10,0},{12,4},{8,6}}]},
	{EdgeForm[{Gray}],White,Rectangle[{5,0},{10,-5}]},
	{EdgeForm[{Black}],White,Triangle[{{5,0},{6,2},{10,0}}]},

	If[a == 1,{EdgeForm[{Dashed}],Dashed,Line[{{6,2},{6,0}}]},,],
	If[a == 1,{EdgeForm[{Dashed}],Dashed,Line[{{6,0},{6,-5}}]},,],
	{EdgeForm[{Gray}],White,Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
	
	{FaceForm[{Purple}], Purple,Opacity[b],Polygon[{{6,2},{10,0},{12,4},{8,6}}]},
	{FaceForm[{Purple}], Purple,Opacity[b],Polygon[{{6,0}, {10,0},{10,-5},{6,-5}}]},
	{FaceForm[{Yellow}], Yellow,Opacity[c],Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
	{FaceForm[{Yellow}], Yellow,Opacity[c],Polygon[{{5,0}, {6,0},{6,-5},{5,-5}}]},
	
			Black,
			Text[Style[ Subscript[Q,c1] ,"Subtitle",Bold],{4.5,1.5}],
			Text[Style[ Subscript[Q,c2] ,"Subtitle",Bold],{9,3}],
			If[a == 0,Text[Style[ Subscript[Q,"i"] ,"Subtitle",Bold],{7,-2.5}],,],
			If[a == 1,Text[Style[ Subscript[Q,"i"] ,"Subtitle",Bold],{4.8,-2.5}],,],
			If[a == 1,Text[Style[ Subscript[R,"1"] ,"Subtitle",Bold],{5.55,-2.5}],,],
			If[a == 1,Text[Style[ Subscript[R,"2"] ,"Subtitle",Bold],{7.8,-2.5}],,],
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "B" ,"Text",Bold],{5.97,2.25}],
			Text[Style[ "C" ,"Text",Bold],{10.2,-0.2}],
			If[a == 1,Text[Style[ "H" ,"Text",Bold],{6.2,0.2}],,],
	},ImageSize->{600,500}],
 {{a, 0, "Passo 1"}, {0, 1}},
 {{b, 0, "Passo 2"}, {0, 1}},
 {{c, 0, "Passo 3"}, {0, 1}}, 
 FrameMargins -> 0]
;
Print[Todo];



(*Print[Manipulate[
 Plot[{0.5 x + 1, x, 2 x - 2}, {x, -1, 5}, 
      PlotRange -> {-1, 5}, AspectRatio -> 1, 
      PlotStyle -> {Opacity[a], Opacity[b], Opacity[c]},
  Epilog -> {
    Text[If[a == 1, "f(x)", ""], {4.5, 2.7}],
    Text[If[b == 1, "y=x", ""], {4.5, 4}],
    Text[If[c == 1, "g(x)", ""], {3, 4.5}]
    }],
 {{a, 1, "f(x)"}, {1, 0}},
 {{b, 1, "y=x"}, {1, 0}},
 {{c, 1, "g(x)"}, {1, 0}}, ControlPlacement -> Left, 
 FrameMargins -> 0]];*)
	
Print["\n\n"];


];
