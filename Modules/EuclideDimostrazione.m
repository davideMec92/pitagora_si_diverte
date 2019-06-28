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

Testo0= "Disegnamo il quadrato ACDE ed il rettangolo AFGH in modo che HG\[TildeFullEqual]HB";				
Testo1= "Prolunghiamo il lato ED";
Testo2= "Prolunghiamo FA e GH fino ad incontrare il prolungamento di ED nei punti M ed N";
Testo3= "Chiamo \[Alpha] l'angolo CAB e \[Alpha]' l'angolo EAM e \[Beta] l'angolo MAC";
Testo4= "Prendo in considerazione i triangoli ABC ed AEM, essi hanno:";
Testo5= "Angolo \[Alpha] \[TildeFullEqual] \[Alpha]', in quanto complementari dello stesso angolo \[Beta] (si noti che gli angoli MAB e EAC sono entrambi retti)";
Testo6= "AC \[TildeFullEqual] AE, essendo un quadrato per costruzione";
Testo7= "Angoli C \[TildeFullEqual] E, retti per costruzione";
Testo8= "I Triangoli ABC e AEM sono congruenti per il secondo criterio";
Testo9= "In Particolare AB\[TildeFullEqual]AM";



Todo= Manipulate[Grid[{
	{Graphics[{

		
		{EdgeForm[{Gray}],White,Rectangle[{5,0},{6,-5}]},
		{EdgeForm[{Gray}],White,Triangle[{{5,0},{6,2},{10,0}}]},
		{EdgeForm[{Gray}],White, Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
		{EdgeForm[{Dashed}],Dashed, Opacity[0.7],Line[{{6,2},{6,0}}]},
		
		
		Black,
			If[a == 0,{Text[Style[ Q ,"Subtitle",Bold],{4.5,1.5}]},,],
			If[a == 0,{Text[Style[ R ,"Subtitle",Bold],{5.5,-2.7}]},,],
			
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "C" ,"Text",Bold],{5.97,2.25}],
			Text[Style[ "B" ,"Text",Bold],{10.2,-0.2}],
			
			Text[Style[ "H" ,"Text",Bold],{6.2,-0.2}],
			Text[Style[ "F" ,"Text",Bold],{4.8,-5.2}],
			Text[Style[ "G" ,"Text",Bold],{6.2,-5.2}],
			
			Text[Style[ "D" ,"Text",Bold],{4,3.2}],
			Text[Style[ "E" ,"Text",Bold],{2.8,1}],
			
			If[a == 0,{Text[Style[ "X" ,"Text",Blue],{8,0}]},,],
			If[a == 0,{Text[Style[ "X" ,"Text", Blue],{6,-2.7}]},,],
			
			(*1*)
			If[a == 1,{EdgeForm[{Dashed}],Dashed,Line[{{3,1},{6.2,7.4}}]},,],
		
			(*2*)
			If[b == 1,{EdgeForm[{Dashed}],Dashed,Line[{{5,0},{5,6}}]},,],
			If[b == 1,{EdgeForm[{Dashed}],Dashed,Line[{{6,0},{6,7.2}}]},,],
			If[b == 1,{Text[Style[ "M" ,"Text",Bold],{4.85,5.1}]},,],
			If[b == 1,{Text[Style[ "N" ,"Text",Bold],{5.85,7}]},,],
			If[b == 1,{Point[{5, 5}]},,],
			If[b == 1,{Point[{6, 7}]},,],
			
			(*3*)
			Red,
			If[c == 1 && i==0,{Circle[{5, 0}, 0.3, {0,  1.1}]},,],
			If[c == 1 && i==0,{Circle[{5, 0}, 0.3, {Pi/2,  2.7}]},,],
			If[c == 1 && i==0,{Text[Style[ "\[Alpha]'" ,"Text"],{4.85,0.4}]},,],
			If[c == 1 && i==0,{Text[Style[ "\[Alpha]" ,"Text"],{5.40,0.3}]},,],			
			Purple,
			If[c == 1 && i==0,{Circle[{5, 0}, 0.3, {Pi/3, Pi/2}]},,],
			If[c == 1 && i==0,{Text[Style[ "\[Beta]" ,"Text"],{5.12,0.5}]},,],
			Black,
			
			(*4*)
			{FaceForm[{Purple}], Yellow,Opacity[(d(1-i))/2],Polygon[{{5,0},{3,1},{5,5}}]},
			{FaceForm[{Purple}], Yellow,Opacity[(d(1-i))/2],Polygon[{{5,0},{6,2},{10,0}}]},
			
			(*5*)
			Red,
			{EdgeForm[{Transparent}],Orange,Opacity[(e(1-i))/1.5],Disk[{5, 0}, 0.3, {0,  1.1}]},
			{EdgeForm[{Transparent}],Orange,Opacity[(e(1-i))/1.5],Disk[{5, 0}, 0.3, {Pi/2,  2.7}]},
			Black,
			
			(*Angoli retti complementari, necessario evidenziare?*)
			
			If[e == 1 && f == 0,{EdgeForm[{Blue,Dashed}],Opacity[0], Polygon[{{5,0},{5.3,0},{5.3,0.3},{5,0.3}}]},,],
			If[e == 1 && f == 0,{EdgeForm[{Blue,Dashed}],Opacity[0], Polygon[{{5,0},{4.7,0.15},{4.85,0.46},{5.162,0.3}}]},,],
			
			(*6*)
			If[f == 1 && i==0,{Text[Style[ "X" ,"Text", Bold, Orange],{5.52,1}]},,],
			If[f == 1 && i==0,{Text[Style[ "X" ,"Text", Bold, Orange],{4,0.5}]},,],
			
			(*7*)
			If[g == 1 && i==0, {EdgeForm[{Orange}],Orange, Opacity[0.7], Polygon[{{6,2},{6.2,1.9},{6.1,1.7},{5.9,1.8}}]},,],
			If[g == 1 && i==0,{EdgeForm[{Orange}],Orange, Opacity[0.7], Polygon[{{3,1},{3.2,0.9},{3.32,1.11},{3.1,1.22}}]},,],
			
			(*8*)
			
			(*9*)
			Orange,
			If[i == 1,{Line[{{5,0},{5,5}}]},,],
			If[i == 1,{Line[{{5,0},{10,0}}]},,],
			Black,
		
(*Pitagoras						
		If[a == 1,{EdgeForm[{Dashed}],Dashed,Line[{{6,0},{6,-5}}]},,],
		{FaceForm[{Purple}], Purple,Opacity[b/2],Polygon[{{6,2},{10,0},{12,4},{8,6}}]},
		{FaceForm[{Purple}], Purple,Opacity[b/2],Polygon[{{6,0}, {10,0},{10,-5},{6,-5}}]},
		{FaceForm[{Yellow}], Yellow,Opacity[c/2],Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
		{FaceForm[{Yellow}], Yellow,Opacity[c/2],Polygon[{{5,0}, {6,0},{6,-5},{5,-5}}]},
	
			Black,
			Text[Style[ Subscript[Q,c1] ,"Text",Bold],{4.5,1.5}],
			Text[Style[ Subscript[Q,c2] ,"Text",Bold],{9,3}],
			If[a == 0,Text[Style[ Subscript[Q,"i"] ,"Text",Bold],{7,-2.5}],,],
			If[a == 1,Text[Style[ Subscript[Q,"i"] ,"Text",Bold],{4.8,-2.5}],,],
			If[a == 1,Text[Style[ Subscript[R,"1"] ,"Text",Bold],{5.55,-2.5}],,],
			If[a == 1,Text[Style[ Subscript[R,"2"] ,"Text",Bold],{7.8,-2.5}],,],
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "B" ,"Text",Bold],{5.97,2.25}],
			Text[Style[ "C" ,"Text",Bold],{10.2,-0.2}],
			If[a == 1,Text[Style[ "H" ,"Text",Bold],{6.2,0.2}],,],
			
*)			
	 },ImageSize->{Scaled[0.29],Scaled[0.5]}], 
	 Grid[{
			{Text[Style[Testo0, TextAlignment->Left, LineIndent -> 0]]},
			{""},
			{""},
			{If[a==1,Text[Style[Testo1, TextAlignment->Left, LineIndent -> 0]],,]},
			{""},
			{""},
			{If[b==1,Text[Style[Testo2, TextAlignment->Left, LineIndent -> 0]],,]}, 
			{""},
			{""},
			{If[c==1,Text[Style[Testo3, TextAlignment->Left, LineIndent -> 0]],,]}, 
			{""},
			{""},
			{If[d==1,Text[Style[Testo4, TextAlignment->Left, LineIndent -> 0]],,]}, 
			{""},
			{""},
			{If[e==1,Text[Style[Testo5, TextAlignment->Left, LineIndent -> 0]] ,,]}, 
			{""},
			{""},
			{If[f==1,Text[Style[Testo6, TextAlignment->Left, LineIndent -> 0]],,]},  
			{""},
			{""},
			{If[g==1,Text[Style[Testo7, TextAlignment->Left, LineIndent -> 0]],,]},  
			{""},
			{""},
			{If[h==1,Text[Style[Testo8, TextAlignment->Left, LineIndent -> 0]],,]},  
			{""},
			{""},
			{If[i==1,Text[Style[Testo9, TextAlignment->Left, LineIndent -> 0]],,]},  
			{""},
			{""},
			{If[j==1,Text[Style[Testo10, TextAlignment->Left, LineIndent -> 0]],,]}, 
			{""},
			{""},
			{If[k==1,Text[Style[Testo11, TextAlignment->Left, LineIndent -> 0]],,]} 
     },ItemSize->Scaled[0.5], Alignment -> {Left}],}
 }],      
Row [{Control[{{a, 0, "Passaggio 1"}, {0, 1}}],
 Text["   "],
 Control[{{b, 0, "Passaggio 2"}, {0, 1}}],
 Text["   "],
 Control[{{c, 0, "Passaggio 3"}, {0, 1}}], 
 Text["   "],
 Control[{{d, 0, "Passaggio 4"}, {0, 1}}], 
 Text["   "],
 Control[{{e, 0, "Passaggio 5"}, {0, 1}}], 
 Text["   "],
 Control[{{f, 0, "Passaggio 6"}, {0, 1}}], 
 Text["   "],
 Control[{{g, 0, "Passaggio 7"}, {0, 1}}], 
 Text["   "],
 Control[{{h, 0, "Passaggio 8"}, {0, 1}}], 
 Text["   "],
 Control[{{i, 0, "Passaggio 9"}, {0, 1}}], 
 Text["   "],
 Control[{{j, 0, "Passaggio 10"}, {0, 1}}], 
 Text["   "],
 Control[{{k, 0, "Passaggio 11"}, {0, 1}}]},
 Alignment -> Left],
 ControlPlacement -> Top, 
 FrameMargins -> 0, ContentSize -> Scaled[1]]
;


Print[Todo];



	
Print["\n\n"];


];
