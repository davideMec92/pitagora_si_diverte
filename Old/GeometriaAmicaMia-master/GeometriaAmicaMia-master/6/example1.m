(* ::Package:: *)

Print[TextCell["La retta e la sua formula nel piano Cartesiano", "Subsection"]];

Print[TextCell["Vediamo come capire l'equazione di una retta dal suo grafico.", "Text", TextJustification -> 1]];
Print[TextCell[Row[{"Dalla teoria abbiamo appreso che l'equazione generica di una retta e' ", Style[" y = m x + q .", Italic,Bold]}], "Text", TextJustification -> 1]];

Print[TextCell["Come casi particolari troviamo:", "Text", 
   TextJustification -> 1]];
CellPrint[{TextCell[
    Row[{Style["y = q:",Bold]," la retta orizzontale interseca l'asse y nel punto Q=(0,q). Ogni volta che abbiamo un grafico come il seguente e' sufficiente guardare l'intersezione con l'asse y e si ricava immediatamente la sua equazione;"}], {"Item"}]}];
(*Manipulate che mostra graficamente la posizione di una retta verticale e ne restituisce la formula*)      
Print[
	DynamicModule[{q},
	Manipulate[	
   Graphics[{{Red, Thick, Line[{{-5, q}, {5, q}}]}, 
     Text[Style[" y = " + q, 12,Red,Bold], {2.5,
       5.5}],Text[Style["Q( 0 , " <>ToString[q]<>" )", 12,Red,Bold], {-1,  q + .2}]}, 
    Axes -> True, ImageSize -> Medium, PlotRange -> {{-5, 5}, {-6.5, 6.5}}, 
    Ticks -> {Range[-5, 5], Range[-5, 5]}, 
    AxesLabel -> {Style["x", Italic], Style["y", Italic]}],
   {q, -5, 5, 0.5}
   ]]
   ];
   
CellPrint[{TextCell[
    Row[{Style["x = k:",Bold]," la retta verticale interseca l'asse x nel punto K=(k,0). Ogni volta che abbiamo un grafico come il seguente e' sufficiente guardare l'intersezione della retta con l'asse x e si ricava immediatamente la sua equazione."}], {"Item"}]}];

(*Manipulate che mostra graficamente la posizione di una retta orizzontale e ne restituisce la formula*)    
Print[
	DynamicModule[{k},
	Manipulate[	
   Graphics[{{Orange, Thick, Line[{{k, -5}, {k, 5}}]}, 
     Text[Style[" x = " + k, 12,Orange,Bold], {2.5,
       5.5}],Text[Style["K( "<>ToString[k]<>" , 0 )", 12,Orange,Bold], {k+1.2,0.3}]}, 
    Axes -> True, ImageSize -> Medium, PlotRange -> {{-6.5, 6.5}, {-5,5}}, 
    Ticks -> {Range[-5, 5], Range[-5, 5]}, 
    AxesLabel -> {Style["x", Italic], Style["y", Italic]}],
   {k, -5, 5, 0.5}
   ]]
   ];
   
Print[TextCell[Row[{"In generale, come visto nella teoria, quando si ha l'equazione ",Style["y= m x + q",Bold]," dobbiamo cercare di capire quale valore attribuire a ",Style["m",Bold]," e quale a ",Style["q",Bold],"."}],"Text",TextJustification -> 1]];

Print[TextCell[Row[{"Il coefficiente angolare ", Style["m",Bold]," della retta passante per due generici punti distinti ","P = (", Subscript["x", "p"], "," Subscript["y", "p"], ")"," e B = (", Subscript["x", "b"], "," Subscript["y", "b"], ")"," e' il rapporto tra la differenza delle ordinate e la differenza delle ascisse dei due punti. Infatti, a patto che P e B non si trovino su una retta verticale (cioe' ",Subscript["x", "p"],"\[NotEqual]"Subscript["x", "b"],"),"," abbiamo che: "}],"Text", TextJustification -> 1]];  
  	 Print[TextCell[
     Row[{Subscript["y", "p"], " = " Subscript["m x", "p"], "+ q ","     e      ",Subscript["y", "b"], " = " Subscript["m x", "b"], "+ q "}],"Text", TextJustification -> 1,TextAlignment->Center]];  
   	 Print[TextCell["con m e q identici in entrambe le equazioni poiche' sono il coefficiente angolare e l'intercetta di una stessa retta.", "Text",TextJustification -> 1]]; 
   	 Print[TextCell["Per ricavare m sottraiamo la prima equazione dalla seconda:", "Text",TextJustification -> 1]];
     Print[TextCell[
     	Row[{HoldForm[Subscript["y", "b"] - Subscript["y", "p"] = Subscript["m x", "b"] + "q" - Subscript["m x", "p"] -"q =>" Subscript["y", "b"] - Subscript["y", "p"] =Subscript["m x", "b"] - Subscript["m x", "p"] "=>" Subscript["y", "b"] - Subscript["y", "p"] = "m" (Subscript["x", "b"] - Subscript["x", "p"])]}],"Text",Italic,Bold,TextJustification->1,TextAlignment->Center]]; 

  
Print[TextCell["Da qui ricaviamo il valore di m: ", "Text",TextJustification -> 1]];
Print[TextCell[Row[{"m = ",(Subscript["y", "b"] - Subscript["y", "p"])/(Subscript["x", "b"] - Subscript["x", "p"]) // HoldForm}],"Text",Italic,Bold,TextJustification->1,TextAlignment->Center]];
Print[TextCell["Per esempio, il coefficiente angolare della retta passante per i punti P=(1,3) e B=(2,5): ", "Text",TextJustification -> 1]];
Print[TextCell[Row[{"m = ",(5 - 3)/(2-1)// HoldForm," = 2" }],"Text",Italic,Bold,TextJustification->1,TextAlignment->Center]];


Print[Module[{y,x},
     Plot[y = 2 * x + 1, {x, -5, 5},     	   
      Epilog -> {
      	Text[Style["y = ",14,Bold,Black],{-2,5}],
      	Text[Style["2 ",14,Bold,Orange],{-1.5,5}],
      	Text[Style["x + q",14,Bold,Black],{-1,5}],
      	Text[Style[" P ", 14, Bold,Red],{1, 3.5}], 
      	Text[Style["( 1 , 3 )", 14, Bold,Red],{2, 3}], Red,PointSize@Large, Point[{1, 3}],
      	Text[Style[" B ", 14, Bold,Red],{2, 5.5}], 
      	Text[Style["( 2 , 5 )", 14, Bold,Red],{3, 5}], Red,PointSize@Large, Point[{2, 5}]},
      PlotStyle -> {{LightOrange, Thickness[0.015]}}, 
      PlotRange -> {{-3, 6.5},{-4,6}}]
]];   
      
Print[TextCell[Row[{"Per quanto riguarda il calcolo di ",Style["q",Bold]," e' possibile procedere in due modi e come esempio prendiamo i punti P=(1,3) e B=(2,5):"}],"Text", TextJustification -> 1]];

Print[TextCell[Row[{Style["1) Graficamente",Bold],": come nel caso delle rette orizzontali q e' dato dall'intersezione della retta con l'asse delle y."}],{"Item"}]];
Print[TextCell["Disegnamo P e B nel piano cartesiano e tracciamo la retta passante per entrambi; l'intersezione tra la retta tracciata e l'asse delle y e' il coefficiente q della retta passante per i due punti.","Text",16,Italic]];  

Print[
	Module[{x,y},
     Plot[y = 2 * x + 1, {x, -5, 5},     	   
      Epilog -> {
      	Text[Style["y = m x +",14,Bold,Black],{-2,5}],
      	Text[Style["1 ",14,Bold,Blue],{-1,5}],
      	Text[Style["( 0 , 1 )", 14, Bold,Blue],{-1, 1}], Blue,PointSize@Large, Point[{0, 1}],
      	Text[Style[" P ", 14, Bold,Red],{1, 3.5}], 
      	Text[Style["( 1 , 3 )", 14, Bold,Red],{2, 3}], Red,PointSize@Large, Point[{1, 3}],
      	Text[Style[" B ", 14, Bold,Red],{2, 5.5}], 
      	Text[Style["( 2 , 5 )", 14, Bold,Red],{3, 5}], Red,PointSize@Large, Point[{2, 5}]},
      PlotStyle -> {{LightOrange, Thickness[0.015]}}, 
      PlotRange -> {{-3, 6.5},{-4,6}}]
      ]
];

Print[TextCell[Row[{Style["2) Imponendo il passaggio per un punto",Bold],": con m noto (che indichiamo con M) e' sufficiente sostituire all'equazione y = M x + q le coordinate di un punto (ad esempio P). Ottengo cosi' l'equazione ", Subscript["y", "p"], " = " Subscript["M x", "p"], "+ q "," da risolvere nell'unica incognita q."}],{"Item"}]];
  Print[TextCell[Row[{"Con coefficiente angolare noto M=2 :      ",Subscript["y", "p"], " = " ,Subscript["M x", "p"], "+ q => 3 = 2 * 1 + q => q = 1 "}],"Text",16,Italic]];

 

      
	Print[];
    Print[TextCell[Row[{"quindi l'equazione della retta passante per P=(1,3) e B=(2,5) sara' ", Style["y= 2x + 1 .",Bold]}], "Text",TextJustification -> 1]];
  
  Print[TextCell["Data quindi una retta in un piano cartesiano per trovare m e q si prendono due punti della retta qualsiasi, possibilmente a valori interi e comodi per i calcoli,e si applicano la formule appena viste:", "Text",TextJustification -> 1]];


(*Manipulate grafica che mostra l'equazione passante per due punti a scelta dell'utente tramite Locator*)
Print[DynamicModule[{p1,p2,lineA,q,m,f},
Manipulate[
   p1 = Round[p1];
   p2 = Round[p2];
   lineA = {Thick, Red, Line[{p1, p2}]}; Off[Infinity::indet];
  (*Viene mostrata la retta passante per i due punti scelti dall'utente tramite Locator*)
   q = If[p1[[1]]!=p2[[1]],(p1[[2]] - ((p2[[2]] - p1[[2]])/(p2[[1]] - p1[[1]]))*p1[[1]]),""]; Off[Power::infy];
   m =((p2[[2]] - p1[[2]])/(p2[[1]] - p1[[1]]));
   f = ToString[N[Round[100*m]/100]]<>" x "<>If[q>0,"+"<>ToString[N[Round[100*q]/100]],ToString[N[Round[100*q]/100]],""];
   (*Viene calcolata la formula della retta passante per i due punti*)
   Column[{Text[
      Which[
      	p1 == p2, 
       Row[{Style[" I due punti non devono essere coincidenti.", 14]}],
       p1[[1]] == p2[[1]], 
         Style[Row[{Style["Retta verticale x = " <> ToString[p1[[1]]], Italic,Bold]}]],         
           p1[[2]] == p2[[2]], 
        Style[Row[{Style["Retta orizzontale y = "<> ToString[p1[[2]]], Italic,Bold]}]],  
           p1 != p2, 
      Style[Row[{Style["La retta passante per i due punti e' y = "<> ToString[f], Italic,Bold]}]]]
       (*Viene mostrata l'etichetta con la formula della retta passante per i due punti ed evidenziati i casi particolari*)
       ], 
     Graphics[{lineA, Text[p1, p1 + 0.5], Text[p2, p2 - 0.5]}, 
      PlotRange -> {{-6, 6}, {-6, 6}}, Axes -> True, 
      AxesOrigin -> {0, 0}, Ticks -> {Range[-5, 5], Range[-5, 5]}, 
      AxesLabel -> {Style["x", Italic], Style["y", Italic]}, 
      AspectRatio -> Automatic, ImageSize -> Medium]}, 
    Alignment -> Top], {{p1, {1, 3.}}, {-6, -6}, {6, 6}, 
    ControlType -> Locator}, {{p2, {-2, -2}}, {-6, -6}, {6, 6}, 
    ControlType -> Locator}, ControllerLinking -> True]]];
    
