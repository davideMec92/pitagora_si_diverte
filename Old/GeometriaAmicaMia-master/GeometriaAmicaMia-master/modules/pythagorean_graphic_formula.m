(* ::Package:: *)

ModulePythagoreanGraphicFormula[]:=Module[{
	
},

Print[Graphics[{

	{EdgeForm[{Gray}],LightGreen,Polygon[{{6,2},{10,0},{12,4},{8,6}}]},
	{EdgeForm[{Gray}],LightRed,Rectangle[{5,0},{10,-5}]},
	{EdgeForm[{Gray}],LightBlue,Triangle[{{5,0},{6,2},{10,0}}]},

	{EdgeForm[{Gray}],LightGreen,Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
			Black,
			Text[Style["A"^2,"Subtitle",Bold],{4.5,1.5}],
			Text[Style["B"^2,"Subtitle",Bold],{9,3}],
			Text[Style["C"^2,"Subtitle",Bold],{7.5,-2.5}]

	},ImageSize->{600,500},
Axes->False]];
	
];
