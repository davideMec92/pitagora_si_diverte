(* ::Package:: *)

ModulePitagoraEnunciato[]:=PitagoraEnunciato[{},
(*Commento*)

Print[Style[ "Teorema di Pitagora","Subsubtitle", Bold]];
Print[Style[ "In un triangolo rettangolo il quadrato costruito sull'ipotenusa \[EGrave] equivalente alla somma dei quadrati costruiti sui cateti.","Text"]];

Print[Style[Row[{"AB"^2, "+", "BC"^2, "=", "AC"^2}],"Subsubtitle"]];

imgDirectory = NotebookDirectory[] <> "Images/";
	
CCI = FileNameJoin[{ imgDirectory,"CCI.png"}];	


PiQ=Image[ Import[CCI], ImageSize->{380,380}];

Print[Grid[{
	{Graphics[{

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
Axes->False], PiQ}
	},Frame->Transparent, Alignment->Bottom, ItemSize -> {{Scaled[.3],Scaled[.3]}}, 
 Frame -> All]
];

Print["\n\n"];

TernePitagoriche[];

];

TernePitagoriche[]:=Module[{},


Print[Style[ "Terne Pitagoriche","Subsubtitle", Bold]];
Print[Style[ "Una terna pitagorica \[EGrave] una terna di numeri interi a, b, c tali che soddisfino la condizione: ","Text"]];

Print[Style[Row[{"a"^2, " + ", "b"^2, "= ", "c"^2}],"Text", Bold] ];

Print[Style[ "Ad esempio (3, 4, 5) \[EGrave] una terna pitagorica, mentre (1, 1, \!\(\*SqrtBox[\(2\)]\)) non \[EGrave] una terna pitagorica in quanto l'ultimo numero (c) non \[EGrave] intero","Text"]];

framesAnimazioneTerne = Import[ imgDirectory <> "Pythagorean_triads.gif" ];
animazioneTerne = ListAnimate[framesAnimazioneTerne, AnimationRate->1, Alignment->Center, ImageSize->Medium];

animazioneGrid = Grid[{
			{Row[{
				animazioneTerne, 
				Style["   Nell'animazione \[EGrave] possibile dimostrare graficamente che:  ", "Text"],
				Style[Row[{"3"^2, " + ", "4"^2, "= ", "5"^2}],"Text", Bold]
			}]} 
		}, Frame->Transparent];
		
Print[animazioneGrid];

Print[Style[ "Terne Pitagoriche Primitive e Derivate","Subsubtitle", Bold]];

coprimiButton = Button[
					"coprimi",
					(
						MessageDialog[ "In matematica, gli interi a e b si dicono coprimi se e solo se essi non hanno nessun divisore comune eccetto 1 e -1 o, in modo equivalente, se il loro massimo comune divisore \[EGrave] 1."];
					)
				];
				
Print[Style[Row[{"Una terna come (3, 4, 5) \[EGrave] detta primitiva mentre una terna come (6, 8, 10) \[EGrave] detta derivata. Ne consegue che una terna pitagorica si definisce
'primitiva' quando i termini a e b sono ", coprimiButton}],"Text"] ];

Print[Style[Row[{"Data la terna pitagorica primitiva (a, b, c) si definisce una terna pitagorica derivata la terna:"}],"Text"] ];
Print[Style[Row[{"(ka,", " kb,", " kc)", " con k numero intero positivo"}],"Text", Bold] ];

];
