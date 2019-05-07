(* ::Package:: *)

ModulePythagoreanTriangleRectangleGraphic[SideA_,SideB_,SideC_,SideToGuess_]:=Module[{
	SideToGuessPlaceholder,
	TriangleRectangleGraphic
},

(* Modulo che genera la grafica del triangolo rettangolo 
in azzurro per omogeneita grafica con gli altri esercizi *)
	SideToGuessPlaceholder = Style["???",Bold];
	TriangleRectangleGraphic=Graphics[
		{
			Thickness[0.003],
			LightBlue,
			Polygon[{{0,0},{SideA,0},{SideA,SideB}}],
			Gray,
			Line[{{0,0},{SideA,SideB}}],
			Line[{{0,0},{SideA,0}}],
			Line[{{SideA,0},{SideA,SideB}}],
			Black,
			Text[Style[Row[{"a"," = ",If[SideToGuess=="a",SideToGuessPlaceholder,SideA]}],15],{SideA/2,-1},{2,2}],
			Text[Style[Row[{"b"," = ",If[SideToGuess=="b",SideToGuessPlaceholder,SideB]}],15],{SideA+1,SideB/2},{-2,1}],
			Text[Style[Row[{"c"," = ",If[SideToGuess=="c",SideToGuessPlaceholder,SideC]}],15],{SideA/2-2,SideB/2+1},{2,1}]
		},
		ImageSize->{300,200},
		Axes->False
	];
	
	Return[TriangleRectangleGraphic];
		
];
