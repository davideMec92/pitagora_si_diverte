(* ::Package:: *)

Print[TextCell["Il piano Cartesiano", "Subsection"]];
CellPrint[TextCell[Row[{
   "Prende il nome di ",Style["piano cartesiano",Bold]," un piano dotato d'un sistema di riferimento cartesiano."}], "Text", TextJustification -> 1]];
Print[TextCell[
   Row[{"Siano date due rette ", 
     Tooltip[Style["orientate ", "Text", Brown, Bold], 
      "Una retta si dice orientata quando fisso su di essa un verso di percorrenza, individuato da una freccia", 
      TooltipStyle -> {Background -> RGBColor[1, 1, 0.85], 
        CellFrameColor -> Red, CellFrame -> 2, CellFrameMargins -> 20,
         TextAlignment -> Center}], 
     "ortogonali x ed y. Fissiamo rispettivamente su x e y due punti che chiameremo ",Style["origine di x ",Bold],"e ",Style["origine di y",Bold]," e prendiamo le due rette tali che la prima, la retta x, sia disposta orizzontalmente con verso positivo a destra e la seconda, la retta y, sia disposta verticalmente con verso positivo in alto. Chiediamo inoltre che le due rette abbiano la stessa ",Style["unita' di misura",Bold]," e origini coincidenti. In questo caso si dice che il piano e' stato dotato di un sistema di riferimento cartesiano."}], "Text", TextJustification -> 1]];
CellPrint[TextCell[Row[{
   "La comune ",Style["Origine O",Bold]," delle due rette orientate \[EGrave] detta origine del piano,la retta x \[EGrave] detta ",Style["asse delle ascisse",Bold],",mentre la retta y \[EGrave] detta ",Style["asse delle ordinate",Bold],"."}], "Text", TextJustification -> 1]];
   
(*Graphics che mostra le definizioni della teoria*)     
     Print[Graphics[{PointSize[0.025],
    {Red, Point[{0, 0}], 
     Text[Style["ORIGINE", Bold, 14, Red], {1, 0.25}]},
    {Green, Point[{3, 4}], 
     Text[Style["P (     3       ,       4    )", Bold, 14, Green], {3, 4.25}],Text[Style["P (Ascissa,Ordinata)", Bold, 14, Gray], {3, 4.75}]},
    {Thick, Dashed, Opacity[0.5], Gray, Line[{{3, 0}, {3, 4}}], 
     Line[{{0, 4}, {3, 4}}]}
    },
   Axes -> True, ImageSize -> Medium, PlotRange -> {{-2, 6}, {-2, 6}},
    Ticks -> {Range[-5, 5], Range[-5, 5]},
   AxesStyle -> Arrowheads[{0.0, 0.05}], 
   AxesLabel -> {Style["Asse delle ascisse", Italic], 
     Style["Asse delle ordinate", Italic]}]];
  Print[TextCell[
 "Sul piano cartesiano e' possibile rappresentare un qualsiasi punto e  calcolare la distanza tra due di questi.", "Text", 
   TextJustification -> 1]];   



Print[TextCell["Distanza di due punti", "Subsection"]];
CellPrint[TextCell[Row[{
   "Siano dati due punti ",Style["P",Bold]," e ",Style["Q",Bold],"  la loro distanza indicata con ",Style["d(P , Q)",Bold]," o ",Style["PQ",Bold]," \[EGrave] data da:"}], "Text", TextJustification -> 1]];
   Print[TextCell[Row[{"P = (", Subscript["x", "p"], "," Subscript["y", "p"], ")"}],"Text",Italic,Bold,TextJustification->1,TextAlignment->Center]];
   Print[TextCell[Row[{"Q = (", Subscript["x", "q"], "," Subscript["y", "q"], ")"}],"Text",Italic,Bold,TextJustification->1,TextAlignment->Center]];
   Print[TextCell[Row[{"d(P,Q) = ",Sqrt[(Subscript["x", "p"]-Subscript["x", "q"])^2 + (Subscript["y", "p"] -Subscript["y", "q"])^2]// HoldForm}],"Text",Italic,Bold,TextJustification->1,TextAlignment->Center]];

 (*Manipulate grafica che mostra la distanza tra due punti nel piano cartesiano scelti dall'utente*)  
Print[DynamicModule[{p1,p2,lineA,d},
Manipulate[
   p1 = Round[p1];
   p2 = Round[p2];
   lineA = {Thick, Blue, Line[{p1, p2}]}; 
   (*Viene mostrata la retta passante per i due punti scelti dall'utente tramite Locator*)
   d =Sqrt[Power[p1[[1]] - p2[[1]],2]+ Power[p1[[2]] - p2[[2]],2]];   
   (*d =Round[d,0.01];*)
   (*Viene calcolata la misura della distanza tra i due punti scelti dall'utente *)
  Column[{Text[
      Which[p1 == p2, 
       Row[{Style["I punti sono coincidenti quindi la loro distanza e' 0", 14]}],
           p1[[1]] == p2[[1]], 
       Row[{Style["I punti hanno la stessa ascissa e la loro distanza e' "],Style[d, 14,Bold]}],
           p1[[2]] == p2[[2]], 
        Row[{Style["I punti hanno la stessa ordinata e la loro distanza e' "],Style[d, 14,Bold]}],
       p1 != p2, 
       Style[Row[{Style["La distanza tra i due punti e'  ",Bold],Style[d, 14,Bold]}]]]
       (*Viene mostrata l'etichetta con la distanza tra i due punti ed evidenziati i casi particolari*)
       ], 
     Graphics[{lineA, Text[p1, p1 + 0.5], Text[p2, p2 - 0.5]}, 
      PlotRange -> {{-6, 6}, {-6, 6}}, Axes -> True, 
      AxesOrigin -> {0, 0}, Ticks -> {Range[-5, 5], Range[-5, 5]}, 
      AxesLabel -> {Style["x", Italic], Style["y", Italic]}, 
      AspectRatio -> Automatic, ImageSize -> Medium]}, 
    Alignment -> Top], {{p1, {1, 3.}}, {-6, -6}, {6, 6}, 
    ControlType -> Locator}, {{p2, {-2, -2}}, {-6, -6}, {6, 6}, 
    ControlType -> Locator}, ControllerLinking -> True]] ]; 
    
    
   
Print[TextCell["La retta nel piano Cartesiano", "Subsection"]];
Print[TextCell[
   Row[{"Introducendo nel piano un sistema di coordinate cartesiane abbiamo la possibilit\[AGrave] di studiare oggetti geometrici, come punti e linee rette, anche con gli strumenti dell'algebra. L'equazione di una retta nel piano \[EGrave]  ", 
   	 Tooltip[Style["y = mx + q ", "Text", Brown, Bold, Italic], 
      "Formula esplicita di una retta", 
      TooltipStyle -> {Background -> RGBColor[1, 1, 0.85], 
        CellFrameColor -> Red, CellFrame -> 2, CellFrameMargins -> 20,
         TextAlignment -> Center}], 
     ", dove ",Style["m",Bold]," \[EGrave] detto ",Style["coefficiente angolare",Bold]," e indica la pendenza della retta; ",Style["q",Bold]," \[EGrave] detto ",Style["intercetta",Bold]," e denota il punto in cui la retta interseca l'asse delle y."}], "Text", TextJustification -> 1]];


(*Manipulate grafica in cui viene mostrato il comportamento di una retta al variare di m e q*)
Print[DynamicModule[{m,q,y,x},
Manipulate[  
     Plot[{If[m==0 && q==0, y=0, y = m*x + q]}, {x, -10, 10}, 
      Epilog -> {
      	Text[Style["y = " <> If[m!=0, ToString[m] <>If[q>0,"x + ","x "],"0"] <> If[q!=0,ToString[q],""],14,Bold,Black],{7,8}],
      	      	Text[Style["(0," <> ToString[q] <> ")", 14, Bold,Red], {2, q+1}], Red,
         PointSize@Large, Point[{0, q}]}, 
      PlotStyle -> {{Blue, Thickness[0.01]}}, 
      PlotRange -> {-12,12}], {m, -20, 20}, {q, -10, 10}]]
];
     
      
Print[TextCell["Due casi particolari sono dati da: ", "Text", TextJustification -> 1]];  
CellPrint[{TextCell[
    Row[{"la ",Style["retta orizzontale",Bold]," che corrisponde al caso in cui ",Style["m = 0",Bold],", ossia la retta avr\[AGrave] equazione ",Style["y = q",Bold],"."}], {"Item"}]}];
CellPrint[{TextCell[
    Row[{"La ",Style["retta verticale",Bold]," che pu\[OGrave] essere considerata un caso estremo di retta obliqua, in cui la pendenza diverge verso valori infiniti. La sua equazione non comprende la variabile y, ma sar\[AGrave] data da \:feff",Style["x = k ",Bold],"."}], {"Item"}]}];
Print[
	DynamicModule[{q,k},
	Manipulate[	
   Graphics[{{Orange, Thick, Line[{{k, -5}, {k, 5}}],Text[Style["Retta Verticale",Bold,14],{k-.5,-4},{-1,0},{0,1}]},
   	{Red, Thick, Line[{{-5, q}, {5, q}}],Text[Style["Retta Orizzontale",Bold,14],{-2,q+0.5}]}}, 
   Axes -> True, ImageSize -> Medium, PlotRange -> {{-6, 6}, {-6, 6}},
    Ticks -> {Range[-5, 5], Range[-5, 5]},
   AxesStyle -> Arrowheads[{0.0, 0.05}], 
   AxesLabel -> {Style["Asse delle ascisse", Italic], 
     Style["Asse delle ordinate", Italic]}],
   {q, -5, 5, 0.5},
   {k, -5, 5, 0.5}
   ]]
   ];