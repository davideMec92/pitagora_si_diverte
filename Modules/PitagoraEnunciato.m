(* ::Package:: *)

ModulePitagoraEnunciato[]:=PitagoraEnunciato[{},
(*Qui viene presentato l'enunciato del teorema di pitagora*)


(*Testi*)
Print[Style[ "Teorema di Pitagora","Subsubtitle", Bold]];

(* Sezione riproduzione audio teorema *)
PlayButton = Button[
	Image[ Import[ NotebookDirectory[] <> "Images/speaker.png" ], ImageSize->{35,35} ],
	Speak["In un triangolo rettangolo il quadrato costruito sull'ipotenusa \[EGrave] equivalente alla somma dei quadrati costruiti sui cateti"],
	FrameMargins->None,
	Background->None,
	Appearance->"Frameless"
];

EnunciatoGrid = Grid[{
{ Style[ "In un triangolo rettangolo il quadrato costruito sull'ipotenusa \[EGrave] equivalente alla somma dei quadrati costruiti sui cateti.","Text"], PlayButton }
}];

Print[ EnunciatoGrid ];

Print[Style[Row[{"AB"^2, "+", "BC"^2, "=", "AC"^2}],"Subsubtitle"]];

(*Immagine di pitagora che parla*)
imgDirectory = NotebookDirectory[] <> "Images/";
	
CCI = FileNameJoin[{ imgDirectory,"CCI.png"}];	


PiQ=Image[ Import[CCI], ImageSize->{380,380}];


(*Una griglia, a sinistra il trianfgolo a destra limmagine di sopra*)
Print[Grid[{
	{Graphics[{
	(*In ordine: Qc2, Qi, Triangolo, Angolo retto, Qc1*)
	{EdgeForm[{Gray}],LightBlue,Polygon[{{6,2},{10,0},{12,4},{8,6}}]},
	{EdgeForm[{Gray}],LightPurple,Rectangle[{5,0},{10,-5}]},
	{EdgeForm[{Gray}],LightGray,Triangle[{{5,0},{6,2},{10,0}}]},
	{EdgeForm[{Blue}],LightGray, Polygon[{{6,2},{6.2,1.9},{6.1,1.7},{5.9,1.8}}]},  (*Rett-angolo*)
	{EdgeForm[{Gray}],LightRed,Polygon[{{6,2},{5,0},{3,1},{4,3}}]},
			Black, 
			(*Lettere*)
			Text[Style[ Subscript[Q,c1] ,"Subtitle",Bold],{4.5,1.5}],
			Text[Style[ Subscript[Q,c2] ,"Subtitle",Bold],{9,3}],
			Text[Style[ Subscript[Q,"i"] ,"Subtitle",Bold],{7.5,-2.5}],
			Text[Style[ "A" ,"Text",Bold],{4.8,-0.2}],
			Text[Style[ "B" ,"Text",Bold],{5.97,2.25}],
			Text[Style[ "C" ,"Text",Bold],{10.2,-0.2}],
			
			

	},ImageSize->{600,500},
Axes->False], PiQ}
	},Frame->Transparent, Alignment->Bottom, ItemSize -> {{Scaled[.3],Scaled[.3]}}, 
 Frame -> All]
];

Print["\n\n"];

(*Bottoni Avanti-Indietro*)
Print[Grid[
				{{"","","",Button["Prossima Slide",NotebookLocate["_PitagoraDimostrazione"],Background -> RGBColor[29,131,118],FrameMargins->Medium]}},
		 		ItemSize -> {{Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber], Scaled[1.0 / buttonsNumber]}}, Frame -> Transparent
		 	]];

];


