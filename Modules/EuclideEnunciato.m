(* ::Package:: *)

ModuleEuclideEnunciato[]:=EuclideEnunciato[{},
(*Qui viene presentato l'enunciato del teorema di euclide*)


(*Testi*)

Print[Style[ "Teorema di Euclide","Subsubtitle", Bold]];

(* Sezione per riproduzione audio testo *)
PlayButton = Button[
	Image[ Import[ NotebookDirectory[] <> "Images/speaker.png" ], ImageSize->{35,35} ],
	Speak["In un triangolo rettangolo il quadrato costruito su un cateto \[EGrave] equivalente al rettangolo che ha i lati congruenti all'ipotenusa e alla proiezione dello stesso cateto su di essa."],
	FrameMargins->None,
	Background->None,
	Appearance->"Frameless"
];

EnunciatoGrid = Grid[{
{ Style[ "In un triangolo rettangolo il quadrato costruito su un cateto \[EGrave] equivalente al rettangolo che ha i lati congruenti all'ipotenusa e alla proiezione dello stesso cateto su di essa.", "Text"], PlayButton }
}];

Print[ EnunciatoGrid ];

(*Immagine di euclide che parla*)
imgDirectory = NotebookDirectory[] <> "Images/";
	
QR = FileNameJoin[{ imgDirectory,"QR.png"}];	


EuQ=Image[ Import[QR], ImageSize->{330,330}];


(*Una griglia, a sinistra il trianfgolo a destra limmagine di sopra*)
Print[Grid[{
		{Graphics[{

	
	(*In ordine: R, Triangolo, Q, Angolo retto, Linea tratteggiata per la proiezione del cateto*)
	{EdgeForm[{Gray}],LightPurple,Rectangle[{5,0},{6,-5}]},
	{EdgeForm[{Gray}],LightGray,Triangle[{{5,0},{6,2},{10,0}}]},

	{EdgeForm[{Gray}],LightPurple, Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
	
	{EdgeForm[{Blue}],LightGray, Polygon[{{6,2},{6.2,1.9},{6.1,1.7},{5.9,1.8}}]},  (*Rett-angolo*)
	{EdgeForm[{Dashed}],Dashed, Opacity[0.7],Line[{{6,2},{6,0}}]},
	
	
		(*Lettere*)
			Black,
			Text[Style[ Q ,"Subtitle",Bold],{4.5,1.5}],
			Text[Style[ R ,"Subtitle",Bold],{5.5,-2.7}],
			
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "C" ,"Text",Bold],{5.97,2.25}],
			Text[Style[ "B" ,"Text",Bold],{10.2,-0.2}],
			
			Text[Style[ "H" ,"Text",Bold],{6.2,-0.2}],
			Text[Style[ "F" ,"Text",Bold],{4.8,-5.2}],
			Text[Style[ "G" ,"Text",Bold],{6.2,-5.2}],
			
			Text[Style[ "D" ,"Text",Bold],{4,3.2}],
			Text[Style[ "E" ,"Text",Bold],{2.8,1}]

	},ImageSize->{600,500},
Axes->False], 
		EuQ}
	},Frame->Transparent, Alignment->Bottom, ItemSize -> {{Scaled[.3],Scaled[.3]}}, 
 Frame -> All]
];


(*Bottoni Avanti-Indietro*)
Print["\n\n"];
Print[Grid[
				{{"","","",Button["Prossima Slide",NotebookLocate["_EuclideDimostrazione"],Background -> RGBColor[29,131,118],FrameMargins->Medium]}},
		 		ItemSize -> {{Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber]}}, Frame -> Transparent
		 	]];


];
