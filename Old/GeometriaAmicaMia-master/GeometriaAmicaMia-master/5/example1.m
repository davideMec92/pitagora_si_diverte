(* ::Package:: *)

Print[
TextCell[
	Row[{"Eratostene, nel III secolo avanti Cristo, realizzo' la prima misurazione delle dimensioni della Terra. Egli si accorse che, a mezzogiorno del solstizio d'estate, i raggi solari cadevano perpendicolarmente sulla citta' di ",
	Tooltip[Style["Siene", "Text", Brown, Bold]," L'attuale Assan ",TooltipStyle -> {Background -> RGBColor[1, 1, 0.85],CellFrameColor -> Red, CellFrame -> 2, CellFrameMargins -> 20,TextAlignment -> Center}],", ossia che le ombre di tutti gli oggetti verticali sparivano, compresi gli gnomoni delle meridiane, la cui unica funzione era quella di proiettare ombre. Nello stesso momento ad Alessandria d'Egitto gli gnomoni delle meridiane formavano un angolo di circa 7.2 gradi rispetto alla perpendicolare del luogo. Eratostene ragiono' cosi': assumendo che la Terra sia perfettamente sferica e che i raggi solari siano paralleli tra loro, l'angolo formato dai raggi solari e la perpendicolare del luogo deve essere congruente all'angolo che ha per vertice il centro della Terra e lati le semirette che congiungono il centro della Terra con le due citta' di ",
	Tooltip[Style[" Siene e Alessandria", "Text", Brown, Bold],"Questo perche' se si assumono paralleli i raggi solari, si hanno due rette parallele passanti rispettivamente per Siene ed Alessandria tagliate dalla retta trasversale che congiunge il centro della Terra con Alessandria. In particolare si viene a formare una coppia di angoli corrispondenti congruenti che sono proprio i due angoli che Eratostene ha considerato congruenti",TooltipStyle -> {Background -> RGBColor[1, 1, 0.85],
	CellFrameColor -> Red, CellFrame -> 2, CellFrameMargins -> 20,TextAlignment -> Center}]}], "Text",TextJustification -> 1]];
		

(*Manipulate grafica in cui avviene una simulazione di della posizione del sole A Siene ed Alessandria*)
Cell[Print[DynamicModule[{c1,hour,c2,ora,t,s1,s2,o1,o2,l1,l2,l3,l4,a1,a2,g1,g2,p},
   Manipulate[
    Dynamic@Graphics[{c1 = {RGBColor[{0.70, 0.94, 1} + sky[hour]], 
         Rectangle[{-12, 0}, {0, 7}]},
         (*Oggetto grafico cielo Siene*)
       c2 = {RGBColor[{0.70, 0.94, 1} + sky[hour]], 
         Rectangle[{0, 0}, {12, 7}]},
         (*Oggetto grafico cielo Alessandria*)
       ora = {White, Disk[{0, 6}], Black, 
         Text[Style[hour, 24, Bold, Italic, 
           FontFamily -> "Algerian"], {0, 6}]}, 
           (*Variabile che mostra l'ora scelta*)
       t = {RGBColor["#e8d39a"], Rectangle[{-12, -7}, {12, 0}]}, 
       (*Oggetto grafico terreno*)
       s1 = Inset[imsun, sun[hour, 6, 0]], 
       (*Oggetto grafico immagine sole Alessandria*)
       s2 = Inset[imsun, sun[hour - .2, 18, 12]], 
       (*Oggetto grafico immagine sole Siene*)
       o1 = {RGBColor["Black"], 
         Triangle[{{5.5, 0}, {6.5, 0}, shadow[hour, 18]}]}, 
         (*Oggetto grafico ombra Siene: un trianbolo con base lo gnomone e vertice dato da una fuzione che varia con l'ora*)
       o2 = {RGBColor["Black"], 
         Triangle[{{-6.5, 0}, {-5.5, 0}, shadow[hour + .5, 6]}]}, 
          (*Oggetto grafico ombra Alessandria: un trianbolo con base lo gnomone e vertice dato da una fuzione che varia con l'ora*)
       l1 = {RGBColor["Black"], Arrow[{{-6, 0}, {-6, -7}}]}, 
       (* Oggetto grafico fraccia perpendicolare terra Alessandria*)
       l2 = {RGBColor["Black"], Arrow[{{6, 0}, {6, -7}}]}, 
         (* Oggetto grafico fraccia perpendicolare terra Siene*)
       l3 = {RGBColor["#ff6600"], 
         Arrow[{{-6, 0}, shadow[hour + .5, 6]}]}, 
           (* Oggetto grafico fraccia inclinazione sole Siene*)
       l4 = {RGBColor["#ff6600"], Arrow[{{6, 0}, shadow[hour, 18]}]}, 
       (* Oggetto grafico fraccia inclinazione sole Alessandria*)
       a1 = {RGBColor[1, 0, 0, .5], 
         Triangle[{{-6, -3}, shadow[hour + .5, 6], {-6, 0}}], 
         Text[
          Style["Alessandria", 14, FontFamily -> "Algerian"], {-8.5, 
           0.3}]}, 
           (*Etichetta indicante Alessandria *)
       a2 = {RGBColor[1, 0, 0, .5], 
         Triangle[{{6, -3}, shadow[hour, 18], {6, 0}}], 
         Text[Style["Siene", 14, FontFamily -> "Algerian"], {8, 
           0.3}]}, 
           (*Etichetta indicante Siene *)
           g1 = Inset[imcol, {-5.8, 1.8}], 
           (*Immagine gnomone Alessandria*)
       g2 = Inset[imcol, {6.3, 1.8}], 
         (*Immagine gnomone Siene*)
         p = {RGBColor["Black"], 
         Text[Style["<---5000 stadi--->", 14, FontFamily -> "Algerian"], {0, -5}]}
         (*Etichetta distanza*)}, ImageSize -> Large], {{hour,7,"Scegli l'ora:"},
     Range[7, 17]}, ControlType -> Slider]]]
  ];
 
  (* Importazione immagine e definizione funzione per l'ombra,la posizione del sole e cambio colore cielo*)
  imsun = Image[Import["sun.png"], 
   ImageSize -> 30];
imcol = Image[Import["column.png"], 
   ImageSize -> Tiny];
shadow[a_, b_] := If[a <= 12, {b - a, -3}, {b - a, -3},{0,0}]
(*Funzione che restituisce il vertice del triangolo per l'ombra in base orario*)
sun[a_, b_, c_] := If[a <= 12, {a - b, a - b + c}, {a - b, 18 - a}]
(*Funzione che restituisce posizione sole in base orario*)
sky[h_] := 
 If[h <= 12, {0, -1/h, 0}, sky[h - 1] + {0, -0.0833 + (1/h), 0}]
(*Funzione che restituisce livello oscuramento cielo in base all'orario*)
  

Print[TextCell[Row[{"In questo caso, poiche' uno dei due angoli e' di 7.2 gradi, l'angolo ad esso corrispondente sara' anch'esso di tale ampiezza. Visto che un angolo di 7.2 gradi e' circa un cinquantesimo dell'angolo giro allora anche la distanza tra le due citta' deve essere un cinquantesimo della circonferenza terrestre. A quel tempo, la distanza tra Alessandria e Siene era considerata di 5.000 stadi che, moltiplicati per 50, davano una misura di 250.000 stadi: era la prima determinazione della circonferenza della Terra basata su un metodo scientificamente valido. Secondo gli storici uno stadio corrisponde a 157,5 metri attuali e quindi la circonferenza terrestre, stimata da Eratostene, era di 39.690 km (che oggi sappiamo essere 40.075 km)."}], "Text", TextJustification -> 1]]; 

(*Manipulate grafica che mostra come l'inclinazione dei raggi solari tra le citta' di Siene e Alessandria abbia un angolo di 7,2*)
Print[
DynamicModule[{earth,dist,dist2,l,l2,lm},
Manipulate[
  Graphics[{
  	{Orange,Thick, Arrow[{2*{Cos[\[Theta]*Degree], Sin[\[Theta]*Degree]},{Cos[\[Theta]*Degree], Sin[\[Theta]*Degree]}}]},
  	 (*Oggetto grafico arrow per la segnalazione dell'ampiezza dell'angolo alfa  *)
       Opacity[1], 
      {LightBlue, 
      earth = Disk[]},
      (*Oggetto grafico Terra*)
     {Orange, Arrowheads[0.02], 
    Arrow[Table[
      0.5*{Cos[\[Theta]*Degree], Sin[\[Theta]*Degree]}, {\[Theta], 
       0, \[Theta], 0.01}]]}, 
           Text[Style["Inclinazione del raggio solare rispetto allo zenit \[Alpha]= " Row[{\[Theta], Degree}],Bold], 
     {0.6,-0.06}],
     dist=(39690*\[Theta])/360;
         Text[Style["Distanza da Siene = "<>ToString[dist]<>" km (Eratostene)",Bold,Black], 
     {0.9,0.85}],
     dist2=(40075*\[Theta])/360;
         Text[Style["Distanza da Siene = "<>ToString[dist2]<>" km (Reale)",Bold,Black], 
     {1,0.75}],
       (*Oggetto grafico freccia per indicare angolo con etichetta ampiezza*)
       Dashed, Black,Thick,
    l = {Orange,Line[{{0, 0}, {Cos[\[Theta]*Degree], 
        Sin[\[Theta]*Degree]}}]},
        l2 = {Black,Line[{{0, 0},{1,0}}]},
        (*Oggetto grafico linee di costruzione*)
   lm =If[\[Theta]<90 || \[Theta]>330, {{Red,Line[{{0,  Sin[\[Theta]*Degree]}, 
       {Cos[\[Theta]*Degree]+1, Sin[\[Theta]*Degree]}}]},
       Text[Style["Perpendicolare", 12,Red,Bold], RegionCentroid[Line[{{0,  Sin[\[Theta]*Degree]}, 
       {Cos[\[Theta]*Degree]+1.5, Sin[\[Theta]*Degree]}}]]+0.05]}],
       (*Oggetto grafico line di costruzione zenit *)
     {PointSize[Medium], Point[{1, 0}],
     	Point[{0,0}],
     	Text[Style["Centro della Terra",Bold,12],{0,+0.02}],
      Text[
      Style["Siene", 12, Bold, Italic], {Cos[7*Degree] + 0.15, 0}],
      (*Etichetta Siene*)
     Point[{Cos[7*Degree], Sin[7*Degree]}],
      Text[
      Style["Alessandria", 12, Bold, Italic], {1.2, Sin[7*Degree]}], 
      (*Etichetta Alessandria*)
     Point[{0.9, 0.425}], 
     Text[Style["Roma", 12, Bold, Italic], {1, 0.42}]}},
      (*Etichetta Roma*)
    ImageSize -> {500, 350}, PlotRange -> {{-0.5, 1.5}, {-0.5, 1}}
   ], 
    {{\[Theta], 0, "\[Alpha]", 0.05}, 0, 360,Appearance -> "Labeled"}, ControllerLinking -> True]
	]
	];

