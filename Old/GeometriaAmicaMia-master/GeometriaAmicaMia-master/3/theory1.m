(* ::Package:: *)

(*  Questo testo e' generato in mathematica  (anziche' essere importato da un file txt) 
per inserire dei tooltip in mezzo al testo *)

Print[TextCell[
Row[{
"Si dice   ",
Tooltip[Style[" triangolo ", "Text", Brown, Bold],
"Un triangolo \[EGrave] un poligono di tre lati", 
TooltipStyle -> {Background -> RGBColor[1, 1, 0.85], 
CellFrameColor -> Red, CellFrame -> 2, CellFrameMargins -> 20, 
TextAlignment -> Center}
],
" rettangolo, un triangolo che ha un angolo retto.",

"In un triangolo rettangolo i  ",
Tooltip[Style[" lati adiacenti all'angolo ", "Text", Brown, Bold],
"Un lato di un triangolo si dice adiacente all\[CloseCurlyQuote]angolo il cui vertice appartiene al lato", 
TooltipStyle -> {Background -> RGBColor[1, 1, 0.85], 
CellFrameColor -> Red, CellFrame -> 2, CellFrameMargins -> 20, 
TextAlignment -> Center}
],
" retto si chiamano cateti, il  ",
Tooltip[Style[" lato opposto all'angolo ", "Text", Brown, Bold],
"Un lato di un triangolo si dice opposto all\[CloseCurlyQuote]angolo il cui vertice non appartiene al lato", 
TooltipStyle -> {Background -> RGBColor[1, 1, 0.85], 
CellFrameColor -> Red, CellFrame -> 2, CellFrameMargins -> 20, 
TextAlignment -> Center}
],
" retto si chiama ipotenusa.",
"\n",
"Inoltre in un triangolo rettangolo un cateto \[EGrave] l\[CloseCurlyQuote] " ,
Tooltip[Style[" altezza ", "Text", Brown, Bold],
"Si chiama altezza relativa ad un lato il segmento che, partendo dal vertice opposto a quel lato, incontra il lato stesso o il suo prolungamento formando due angoli retti", 
TooltipStyle -> {Background -> RGBColor[1, 1, 0.85], 
CellFrameColor -> Red, CellFrame -> 2, CellFrameMargins -> 20, 
TextAlignment -> Center}
],
"relativa all\[CloseCurlyQuote]altro cateto."
}]
,"Text", TextJustification -> 1]];


(* Questo modulo stampa un triangolo rettangolo con la descrizione dei lati *)
Module[{
	
	TriangleRectangleGraphic,
	SideA,
	SideB,
	SideC,
	RandomPythagoreanTriple
},
RandomPythagoreanTriple = ModulePythagoreanTriple[];
	(* Scelgo la lunghezza dei lati a partire da delle triple pitagoriche cos\[IGrave] evitiamo dei lati con dimensioni differenti da numeri interi *)
	
	SideA=RandomPythagoreanTriple[[2]];
	SideB=RandomPythagoreanTriple[[1]];
	SideC=RandomPythagoreanTriple[[3]];

	TriangleRectangleGraphic=Graphics[
		{
			
			LightBlue,
			Polygon[{{0,0},{SideA,0},{SideA,SideB}}],
			Gray,
			Thickness[0.01],
			Line[{{0,0},{SideA,SideB}}],
		
			Line[{{0,0},{SideA,0}}],
		
			Line[{{SideA,0},{SideA,SideB}}],
			Black,
			Text[Style["Cateto",Bold, FontSize->14],{SideA/2,-1},{2,2}],
			Text[Style["Cateto",Bold, FontSize->14],{SideA+1,SideB/2},{-2,1}],
			Text[Style["Ipotenusa",Bold, FontSize->14],{SideA/2-2,SideB/2+1},{2,1}]
		},
		ImageSize->{600,400},
		Axes->False
	];
	
	Print[TriangleRectangleGraphic];
	Print[Style["Soltanto ai triangoli rettangoli \[EGrave] possibile applicare il teorema di Pitagora","Text",Bold]];
		
];


