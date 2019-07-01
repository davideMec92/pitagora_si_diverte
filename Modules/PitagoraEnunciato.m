(* ::Package:: *)

ModulePitagoraEnunciato[]:=PitagoraEnunciato[{},
(*Commento*)

Print[Style[ "Teorema di Pitagora","Subsubtitle", Bold]];
Print[Style[ "In un triangolo rettangolo il quadrato costruito sull'ipotenusa \[EGrave] equivalente alla somma dei quadrati costruiti sui cateti.","Text"]];

Print[Style[Row[{"AB"^2, "+", "BC"^2, "=", "AC"^2}],"Subsubtitle"]];
Print[Style[ "Oppure","Text"]];
Print[Style[Row[{ Subscript[Q,c1], "+",  Subscript[Q,c2] , "=",  Subscript[Q,"i"] }],"Subsubtitle"]];


Print[Graphics[{

	{EdgeForm[{Gray}],LightBlue,Polygon[{{6,2},{10,0},{12,4},{8,6}}]},
	{EdgeForm[{Gray}],LightPurple,Rectangle[{5,0},{10,-5}]},
	{EdgeForm[{Gray}],LightGray,Triangle[{{5,0},{6,2},{10,0}}]},
	{EdgeForm[{Blue}],LightGray, Polygon[{{6,2},{6.2,1.9},{6.1,1.7},{5.9,1.8}}]},  (*Rett-angolo*)

	{EdgeForm[{Gray}],LightRed,Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
			Black,
			Text[Style[ Subscript[Q,c1] ,"Subtitle",Bold],{4.5,1.5}],
			Text[Style[ Subscript[Q,c2] ,"Subtitle",Bold],{9,3}],
			Text[Style[ Subscript[Q,"i"] ,"Subtitle",Bold],{7.5,-2.5}],
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "B" ,"Text",Bold],{5.97,2.25}],
			Text[Style[ "C" ,"Text",Bold],{10.2,-0.2}],
			
			

	},ImageSize->{600,500},
Axes->False]];
	
Print["\n\n"];


];
