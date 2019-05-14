(* ::Package:: *)

ModulePitagoraEnunciato[]:=PitagoraEnunciato[{},
(*Commento*)

Print[Style[ "Teorema di Pitagora","Subsubtitle"]];
Print[Style[ "In un triangolo rettangolo il quadrato costruito sull'ipotenusa \[EGrave] equivalente alla somma dei quadrati costruiti sui cateti.","Text"]];

Print[Style[Row[{"A"^2, "+", "B"^2, "=", "C"^2}],"Subsubtitle"]];

Print[Graphics[{

	{EdgeForm[{Gray}],LightBlue,Polygon[{{6,2},{10,0},{12,4},{8,6}}]},
	{EdgeForm[{Gray}],LightPurple,Rectangle[{5,0},{10,-5}]},
	{EdgeForm[{Gray}],LightGray,Triangle[{{5,0},{6,2},{10,0}}]},

	{EdgeForm[{Gray}],LightRed,Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
			Black,
			Text[Style["A"^2,"Subtitle",Bold],{4.5,1.5}],
			Text[Style["B"^2,"Subtitle",Bold],{9,3}],
			Text[Style["C"^2,"Subtitle",Bold],{7.5,-2.5}]

	},ImageSize->{600,500},
Axes->False]];
	
Print["\n\n"];



];
