(* ::Package:: *)

ModuleEuclideEnunciato[]:=EuclideEnunciato[{},
(*Commento*)

Print[Style[ "Teorema di Euclide","Subsubtitle", Bold]];
Print[Style[ "In un triangolo rettangolo il quadrato costruito un cateto \[EGrave] equivalente al rettangolo che ha i lati congruenti all'ipotenusa e alla proiezione dello stesso cateto su di essa.","Text"]];




Print[Graphics[{

	

	{EdgeForm[{Gray}],LightPurple,Rectangle[{5,0},{6,-5}]},
	{EdgeForm[{Gray}],LightGray,Triangle[{{5,0},{6,2},{10,0}}]},

	{EdgeForm[{Gray}],LightPurple, Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
	
	{EdgeForm[{Blue}],LightGray, Polygon[{{6,2},{6.2,1.9},{6.1,1.7},{5.9,1.8}}]},  (*Rett-angolo*)
	{EdgeForm[{Dashed}],Dashed, Opacity[0.7],Line[{{6,2},{6,0}}]},
	
	
	
			Black,
			Text[Style[ Q ,"Subtitle",Bold],{4.5,1.5}],
			Text[Style[ R ,"Subtitle",Bold],{5.5,-2.7}],
			
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "B" ,"Text",Bold],{5.97,2.25}],
			Text[Style[ "C" ,"Text",Bold],{10.2,-0.2}],
			
			Text[Style[ "H" ,"Text",Bold],{6.2,-0.2}],
			Text[Style[ "F" ,"Text",Bold],{4.8,-5.2}],
			Text[Style[ "G" ,"Text",Bold],{6.2,-5.2}],
			
			Text[Style[ "D" ,"Text",Bold],{4,3.2}],
			Text[Style[ "E" ,"Text",Bold],{2.8,1}],
			
			Text[Style[ Q\[DotEqual]R ,"Subtitle",Bold],{9,3}],
			
			

	},ImageSize->{600,500},
Axes->False]];
	
Print["\n\n"];


];
