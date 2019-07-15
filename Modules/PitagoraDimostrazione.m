(* ::Package:: *)

ModulePitagoraDimostrazione[]:=PitagoraDimostrazione[{},
(*Commento*)

Print[Style[ "Dimostrazione del teorema di Pitagora","Subsubtitle", Bold]];

(*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*)	
	
Qi= ToString[Subscript["Q","i"], FormatType -> StandardForm];
Qc1= ToString[Subscript["Q","c1"], FormatType -> StandardForm];
Qc2= ToString[Subscript["Q","c2"], FormatType -> StandardForm];
R1= ToString[Subscript["R","1"], FormatType -> StandardForm];
R2= ToString[Subscript["R","2"], FormatType -> StandardForm];	
		
Testo1= "Tracciamo BH, altezza relativa all'ipotenusa, e la prolunghiamo in modo da dividere "<> Qi <>" nei due rettangoli "<> R1 <>" ed "<> R2 <>"";
Testo2= "Dal primo teorema di Euclide abbiamo capito che "<> Qc1 <>" \[EGrave] equivalente a  "<> R1 <>"";
Testo3= "Sempre da Euclide abbiamo che "<> Qc2 <>" \[EGrave] equivalente a "<> R2 <>"";
Testo4= "Sapendo che "<> Qi <>" = "<> R1 <>" + "<> R2 <>" e dato che "<> R1 <>" = "<> Qc1 <>" e "<> R2 <>" = "<> Qc2 <>", otteniamo che "<> Qi <>" = "<> Qc1 <>" + "<> Qc1 <>"";

passaggiListPit = {a=0,b=0,c=0,d=0};
x=0;


Todo= Manipulate[Grid[{
	{Graphics[{
		{EdgeForm[{Gray}],White,Polygon[{{6,2},{10,0},{12,4},{8,6}}]},
		{EdgeForm[{Gray}],White,Rectangle[{5,0},{10,-5}]},
		{EdgeForm[{Black}],White,Triangle[{{5,0},{6,2},{10,0}}]},

		If[passaggiListPit[[1]] == 1,{EdgeForm[{Dashed}],Dashed,Line[{{6,2},{6,0}}]},,],
		If[passaggiListPit[[1]] == 1,{EdgeForm[{Dashed}],Dashed,Line[{{6,0},{6,-5}}]},,],
		{EdgeForm[{Gray}],White,Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
	
		{FaceForm[{Purple}], Purple,Opacity[passaggiListPit[[2]]/2],Polygon[{{6,2},{10,0},{12,4},{8,6}}]},
		{FaceForm[{Purple}], Purple,Opacity[passaggiListPit[[2]]/2],Polygon[{{6,0}, {10,0},{10,-5},{6,-5}}]},
		{FaceForm[{Yellow}], Yellow,Opacity[passaggiListPit[[3]]/2],Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
		{FaceForm[{Yellow}], Yellow,Opacity[passaggiListPit[[3]]/2],Polygon[{{5,0}, {6,0},{6,-5},{5,-5}}]},
	
			Black,
			Text[Style[ Subscript[Q,c1] ,"Text",Bold],{4.5,1.5}],
			Text[Style[ Subscript[Q,c2] ,"Text",Bold],{9,3}],
			If[passaggiListPit[[1]] == 0,Text[Style[ Subscript[Q,"i"] ,"Text",Bold],{7,-2.5}],,],
			If[passaggiListPit[[1]] == 1,Text[Style[ Subscript[Q,"i"] ,"Text",Bold],{4.8,-2.5}],,],
			If[passaggiListPit[[1]] == 1,Text[Style[ Subscript[R,"1"] ,"Text",Bold],{5.55,-2.5}],,],
			If[passaggiListPit[[1]] == 1,Text[Style[ Subscript[R,"2"] ,"Text",Bold],{7.8,-2.5}],,],
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "B" ,"Text",Bold],{5.97,2.25}],
			Text[Style[ "C" ,"Text",Bold],{10.2,-0.2}],
			If[a == 1,Text[Style[ "H" ,"Text",Bold],{6.2,0.2}],,],
	 },ImageSize->{Scaled[0.35],Scaled[0.5]}], 
	 Grid[{
			{If[passaggiListPit[[1]]==1,Text[Style[Testo1, TextAlignment->Left, LineIndent -> 0]],,]},
			{""},
			{""},
			{If[passaggiListPit[[2]]==1,Text[Style[Testo2, TextAlignment->Left, LineIndent -> 0]],,]}, 
			{""},
			{""},
			{If[passaggiListPit[[3]]==1,Text[Style[Testo3, TextAlignment->Left, LineIndent -> 0]],,]}, 
			{""},
			{""},
			{If[passaggiListPit[[4]]==1,Text[Style[Testo4, TextAlignment->Left]],,]} 
     },ItemSize->Scaled[0.5], Alignment -> {Left}],}
 }],     
Row [
{Button["Precedente", If[x>0,(passaggiListPit[[x]]=0; x--;)], ImageSize -> 200],
Button["Prossimo", If[x<4,(x++; passaggiListPit[[x]]=1;)], ImageSize -> 200]},
 Alignment -> Left],
 ControlPlacement -> Top, 
 FrameMargins -> 0, ContentSize -> Scaled[1]]
;


Print[Todo];



	
Print["\n\n"];


];
