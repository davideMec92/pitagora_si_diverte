(*Wolfram Language package*)
Print[
 TextCell["Rette tagliate da una trasversale", "Subsection"]];
CellPrint[TextCell[Row[{
   "Due rette qualsiasi ",Style["r",Bold]," ed ",Style["s",Bold]," tagliate da una trasversale ",Style["t",Bold]," determinano otto angoli cosi' chiamati:"}],
    "Text",TextJustification -> 1]];
   Print[
   	DynamicModule[{r,s,t,tipo},
   	Manipulate[
   	Graphics[{
   		Thick,
   r = Line[{{1, 1}, {3.7, 3.3}}], 
   Text[Style["r",14,Bold,Italic], {2.7, 2.1}], 
   s = Line[{{0.2, 1}, {3, 4}}], 
   Text[Style["s",14,Bold,Italic], {2.3, 3}], 
   t = Line[{{1.3, 3}, {2.3, 1}}], 
   Text[Style["t",14,Bold,Italic], {2.3, 1.3}], 
   Text[Dynamic[tipo]];
   aniAng[tipo, r, s, t],
   Text[Style["A",Bold,14], {1.6, 2.6}], 
   Text[Style["B",Bold,14], {1.4, 2.5}], 
   Text[Style["C",Bold,14], {1.5, 2.3}], 
   Text[Style["D",Bold,14], {1.7, 2.4}], 
   Text[Style["E",Bold,14], {1.95, 2}], 
   Text[Style["F",Bold,14], {1.7, 1.8}], 
   Text[Style["G",Bold,14], {1.9, 1.6}], 
   Text[Style["H",Bold,14], {2.1, 1.7}]}
   ],
   {tipo,{"Alterni interni", "Alterni esterni", "Coniugati interni","Coniugati esterni", "Corrispondenti"}}]]
   ];

Print[Grid[{{"Angoli", "Coppie"},
	{"Alterni interni", "C,E e D,F"},
	{"Alterni esterni","A,G e B,H"},
	{"Coniugati interni","C,F e D,E"}, 
    {"Coniugati esterni","A,H e B,G"},
    {"Corrispondenti","A,E e B,F e C,G e D,H"}
    },
     Alignment -> Left, Spacings -> {2, 1}, Frame -> All, 
 ItemStyle -> "Text", Background -> {{LightRed, None}, {Red, None}}]];


  Print[TextCell[
   Row[{"Due rette r ed s sono", 
     Tooltip[Style[" parallele ", "Text", Brown, Bold], 
      "Due rette sono parallele se non hanno punti in comune", 
      TooltipStyle -> {Background -> RGBColor[1, 1, 0.85], 
        CellFrameColor -> Red, CellFrame -> 2, CellFrameMargins -> 20,
         TextAlignment -> Center}], 
     "se, tagliate da una trasversale t, formano almeno:\n"}], "Text",
    TextJustification -> 1]];
     
     
     CellPrint[{TextCell[
    Row[{"una coppia di angoli ",Style["alterni esterni congruenti",Bold]}], {"Item"}]}];
         CellPrint[{TextCell[
    Row[{"una coppia di angoli ",Style["coniugati interni supplementari",Bold]}], {"Item"}]}];
        CellPrint[{TextCell[
    Row[{"una coppia di angoli ",Style["alterni interni congruenti",Bold]}], {"Item"}]}];
         CellPrint[{TextCell[
    Row[{"una coppia di angoli ",Style["corrispondenti congruenti",Bold]}], {"Item"}]}];  
      Print[TextCell["Notiamo che il teorema e' sempre valido comunque presa la retta trasversale, purche' non sia parallela alle altre due, in questo caso abbiamo semplicemente tre rette parallele.","Text",TextJustification -> 1]];


Print[TextCell["Teorema", "Subsection"]];
Print[TextCell[
   "Se n rette sono parallele, ogni retta del piano che incontra una di queste deve incontrare anche tutte le altre.", "Text", 
   TextJustification -> 1, Italic, FontSize -> 16, Bold]];
Print[TextCell[
   "Grazie a questo teorema possiamo generalizzare quello che abbiamo detto sopra per due rette parallele tagliate da una trasversale a n rette parallele tagliate da una trasversale", "Text", 
   TextJustification -> 1]];

(*Funzione che evidenzia con colori e label una determinata tipologia di angoli 
n=tipo angoli
r,t,s=rette le cui intersezioni generano gli angoli *)
aniAng[n_, r_, s_, t_] := Module[{ccr,ccs},{
  ccr = RegionIntersection[r, t][[1, 1]];
  ccs = RegionIntersection[s, t][[1, 1]];
    (*Calcolo delle intersezioni tra rette che serviranno da centro per le label*)
  Switch[n, 
   "Alterni interni", {Text[
     Style["ALTERNI INTERNI", Bold, FontSize -> 18], {1, 
      3.5}], {Orange, Disk[ccr, .3, {38 Degree, 117 Degree}], 
     Disk[ccs, 0.3, {227 Degree, 295 Degree}]}, {Yellow, 
     Disk[ccr, .3, {117 Degree, 217 Degree}], 
     Disk[ccs, 0.3, {295 Degree, 408 Degree}]}}, 
     (*Vengono evidenziati gli angoli alterni interni*)
   "Alterni esterni", {Text[
     Style["ALTERNI ESTERNI", Bold, FontSize -> 18], {1, 
      3.5}], {Orange, Disk[ccr, .3, {223 Degree, 295 Degree}], 
     Disk[ccs, 0.3, {45 Degree, 117 Degree}]}, {Yellow, 
     Disk[ccr, .3, {295 Degree, 398 Degree}], 
     Disk[ccs, 0.3, {117 Degree, 227 Degree}]}}, 
      (*Vengono evidenziati gli angoli alterni esterni*)
   "Coniugati interni", {Text[
     Style["CONIUGATI INTERNI", Bold, FontSize -> 18], {1, 
      3.5}], {Orange, Disk[ccr, 0.3, {38 Degree, 117 Degree}], 
     Disk[ccs, .3, {295 Degree, 408 Degree}]}, {Yellow, 
     Disk[ccr, 0.3, {117 Degree, 217 Degree}], 
     Disk[ccs, .3, {227 Degree, 295 Degree}]}},
      (*Vengono evidenziati gli angoli coniugati interni*) 
   "Coniugati esterni", {Text[
     Style["CONIUGATI ESTERNI", Bold, FontSize -> 18], {1, 
      3.5}], {Orange, Disk[ccr, .3, {295 Degree, 398 Degree}], 
     Disk[ccs, 0.3, {45 Degree, 117 Degree}]}, {Yellow, 
     Disk[ccr, .3, {223 Degree, 295 Degree}], 
     Disk[ccs, 0.3, {117 Degree, 227 Degree}]}}, 
     (*Vengono evidenziati gli angoli coniugati esterni*) 
   "Corrispondenti", {Text[
     Style["CORRISPONDENTI", Bold, FontSize -> 18], {1, 
      3.5}], {Orange, Disk[ccr, .3, {38 Degree, 117 Degree}], 
     Disk[ccs, 0.3, {45 Degree, 117 Degree}]}, {Yellow, 
     Disk[ccr, .3, {117 Degree, 217 Degree}], 
     Disk[ccs, 0.3, {117 Degree, 227 Degree}]}, {Red, 
     Disk[ccr, .3, {217 Degree, 295 Degree}], 
     Disk[ccs, 0.3, {227 Degree, 295 Degree}]}, {Green, 
     Disk[ccr, .3, {295 Degree, 398 Degree}], 
     Disk[ccs, 0.3, {295 Degree, 408 Degree}]}}]
     (*Vengono evidenziati gli angoli corrispondenti*) }];


Print[TextCell["Circonferenza", "Subsection"]];
(*Manipulate che mostra in maniera interattiva la teoria in base alla scelta fatta dall'utente(mostrati solo per Corda,Angolo e Angolo al Centro)*)
Print[
   DynamicModule[{l11 = {-1, 0}, l12 = {1, 0},scelta,a,b,c,lc},
   Manipulate[ (*Oggetti Locator per interazione utente*)
    Dynamic@Graphics[{
    	Switch[scelta, 
        "Definizioni", {
         Text[Style["Raggio", Bold, 14,Blue], {0.5, 0.1}], 
         Text[Style["Diametro", Bold, 14,Purple], {0, -0.1}],
         Thick, Blue,Line[{{0, 0}, {1,0}}],
          Purple, Dashed,Line[{{-1,0}, {1,0}}]},
            (*Viene mostrato la teoria di base ossia del raggio e del diametro(sono formate da due oggetti grafici Line*) 
            "Corda", {Red, Thick, lc=Line[{l11, l12}]}, 
            (*Viene mostrato la teoria delle corde e una Line tra i due Locator posizionati a scelta dall'utente*) 
        "Arco", {Thick, Red, Circle[], CapForm["Round"], 
         Thickness[.02], Green, 
         Circle[{0, 0}, 
          1, {ArcTan[l11[[1]], l11[[2]]], 
           ArcTan[l12[[1]], l12[[2]]]}]}, 
           (*Viene mostrato la teoria dell'arco e una semicirconferenza che evidenzia l'angolo che si viene a formare tra i locator posizionati a scelta dall'utente*)
        "Angolo al centro", {Thick, Black, 
         a = ArcTan[l11[[1]], l11[[2]]];
         b = ArcTan[l12[[1]], l12[[2]]]; Circle[{0, 0}, 1, {a, b}], 
         Orange, Disk[{0, 0}, 0.3, {a, b}]}],
          (*Viene mostrato la teoria dell'angolo al centro e vieno mostrato un disco indicante l'ampiezza dell'angolo generato dai locator posizionati a scelta dall'utente*) 
       If[scelta != 
         "Definizioni", {Text[Style["Muovi i punti A e B ",Bold,12],{0,1.1}],
         	{LightBlue,Disk[l11,0.1],Locator[
          Dynamic[l11, (l11 = RegionNearest[c, #]) &],          
          Text[Style["A", Blue, Italic, 24,Opacity[2]]]]},          
         {LightBlue,Disk[l12,0.1],Locator[Dynamic[l12, (l12 = RegionNearest[c, #]) &], 
          Text[Style["B", Blue, Italic, 24] 
          ]]}
          }
          ], 
            (*Condizione visibilita' locator e interazione*)
       If[scelta != "Definizioni" && scelta != "Corda", {Thick, Black,
          Dashed, Line[{{0, 0}, l11}], Line[{{0, 0}, l12}]}], 
          (*Condizione visibilita' corda*)
       c = Circle[], Point[{0, 0}],Text[Style["C", Bold, 14], {0, 0.035}]
      },
      PlotRange -> {{-1.2, 1.2}, {-1.2, 1.2}}, 
      ImageSize -> Medium], 
      (*Oggetti grafici comuni a tutte le scelte*)
      	 {scelta, {"Definizioni", "Corda", "Arco", "Angolo al centro"}, Labeled -> False},
      	(*Setter menu per la scelta*)
      	 (*InputFiled disattivato in cui viene mostrata il testo della teoria*)
   ControlType ->Setter]
   
   ]
   ];
   

CellPrint[{TextCell[Row[{"Si definisce ",Style["circonferenza",Bold], " e si indica con C l'insieme dei punti del piano aventi la stessa distanza da un punto fisso detto  ",Style["centro",Bold], ". La distanza tra centro e un punto qualsiasi della cironferenza e' detta ",Style["raggio ",Bold], " e si indica con ",Style["r",Bold], ". Il ",Style["diametro",Bold], " e' un qualsiasi segmento che passa per il centro e unisce due punti della circonferenza; esso corriponde al doppio del raggio e si indica con ",Style["d",Bold], ". La formula per trovare la lunghezza della circonferenza e':"}], {"Item"}]}];
Print[TextCell[Row[{"C = 2 \[Pi] r ." }],"Text",Italic,Bold,TextJustification->1,TextAlignment->Center]];
CellPrint[{TextCell[Row[{"Si definisce ",Style["corda",Bold], " ogni segmento che ha per estremi due punti qualsiasi di una circonferenza. Una corda che passa per il centro ha la massima lunghezza possibile e corrisponde al ",Style["diametro",Bold], "."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Siano dati una circonferenza e due suoi punti A e B. Si definisce ",Style["arco",Bold], " ciascuna delle due parti in cui la circonferenza viene divisa dai due punti A e B detti ",Style["estremi",Bold], " dell\[CloseCurlyQuote]arco."}], {"Item"}]}];
CellPrint[{TextCell[Row[{"Si definisce ",Style["angolo al centro",Bold], " ogni angolo che ha il vertice nel centro di una circonferenza. I lati dell\[CloseCurlyQuote]angolo al centro intersecano la circonferenza in due punti che individuano un arco interno all\[CloseCurlyQuote]angolo: si dice in questo caso che l\[CloseCurlyQuote]angolo al centro ",Style["insiste",Bold], " su questo arco o viceversa che l\[CloseCurlyQuote]arco di circonferenza e' ",Style["sotteso",Bold], " dall\[CloseCurlyQuote]angolo."}], {"Item"}]}];
  	
  
Print[TextCell["Posizione di una retta rispetto a una circonferenza","Subsection"]];
Print[
  TextCell[
   "Siano dati una retta r ed una circonferenza C. Una retta puo' assumere tre posizioni rispetto ad una circonferenza:","Text", TextJustification -> 1]
  ];
  CellPrint[{TextCell[
    Row[{"r e' ",Style["esterna",Bold], " a C se l'intersezione tra la retta e la circonferenza e' vuota;
      "}], {"Item"}]}];
        CellPrint[{TextCell[
    Row[{"r e' ",Style["tangente",Bold], " a C se l'intersezione tra la retta e la circonferenza contiene uno e un solo punto detto punto di tangenza;
      "}], {"Item"}]}];
       CellPrint[{TextCell[
    Row[{"r e' ",Style["secante",Bold], " di C  se l'intersezione tra la retta e la circonferenza contiene due punti."}], {"Item"}]}];
 (*Manipulate che mostra graficamente la posizione di una retta rispetto a una circonferenza*)     
 
  Print[
  	DynamicModule[{cir,line,m,int},
  		Manipulate[
  Graphics[{Thick, 
  	cir = Circle[], 
    line = Line[{{m, m - 2}, {m - 2, m}}],
    (*Oggetti grafici per retta e cironferenza*)
    int = RegionIntersection[cir, line];
    (*Calcolo punti intersezione tra retta e cironferenza*)
    PointSize[0.025],
    If[Length[int[[1]]] == 2 ,
     If[EuclideanDistance[int[[1, 1]], int[[1, 2]]] > 0.5, 
     	{Red, 
      Point[int[[1, 1]]],
      Point[int[[1, 2]]],
        Text[
        Style["Secante", Bold, 30, Italic, 
         Opacity[1.1]], {0, -1.5}]}, 
         (*Se ci sono due punti di intersezione e la loro distanza e' apprezzabile la retta e' secante*)
         {Green,Text[Style["Tangente", Bold, 30, Italic,   Opacity[1.1]], {0, -1.5}], Point[RegionCentroid[line]]
         (*Se ci sono due punti di intersezione e la loro distanza  non e' apprezzabile la retta e' tangente*)}]],
    If[Length[int[[1]]] == 0, {Blue, 
      Text[Style["Esterna", Bold, 30, Italic, 
        Opacity[1.1]], {0, -1.5}]}
        (*Se non c'e' unpunto di intersezione allora la retta e' esterna*)]
    }, PlotRange -> {{-2, 2}, {-2, 2}}], 
    {m, 0, 2},FrameLabel -> {"","","Muovi la retta",""}, ControlType -> {Slider} 
    (*Slider per posizionamento retta*)
  ]]
  ]; 
  


Print[TextCell["Angoli alla circonferenza", "Subsection"]];
CellPrint[
  TextCell[Row[{
   "Si chiama ",Style["angolo alla circonferenza",Bold], " ogni angolo convesso che ha il vertice su una circonferenza e i due lati secanti alla circonferenza, oppure uno secante e l'altro tangente. ","Gli angoli alla circonferenza che insistono sullo stesso arco sono tutti ", Style["congruenti",Bold], ": infatti, ciascuno di questi angoli ha il medesimo angolo al centro corrispondente, e pertanto sono tutti congruenti a meta' di esso."}],"Text",TextJustification -> 1]  
   ];
  
(*Manipulate che mostra in maniera interattiva la teoria relativa agli angoli al centro e alla cironferenza*)
Print[Manipulate[
   DynamicModule[{l11 = {-0.9, -0.45}, l12 = {0.9, -0.45},l13 = {0, 1},ca,cb,rca,rcb,c,a,b,c1,la}, 
   	(*Locator per il posizionamento interattivo dei punti*)
    Dynamic@Graphics[{
    	Text[Style["Muovi i punti A e B relativi all'arco e C relativo al vertice",Bold,12],{0,1.1}],
    	{Opacity[1.1],LightOrange,Disk[l11,0.1],
    	Locator[
        Dynamic[l11, (l11 = RegionNearest[c, #]) &], 
        Text[Style["A", Red, Bold, 20,Opacity[2]]]]},
        {Opacity[1.1],LightOrange,Disk[l12,0.1], 
       Locator[Dynamic[l12, (l12 = RegionNearest[c, #]) &], 
        Text[Style["B", Red, Bold, 20,Opacity[2]]]]}, 
        {Opacity[1.1],LightBlue,Disk[l13,0.1],Locator[Dynamic[l13, (l13 = RegionNearest[c, #]) &], 
        Text[Style["C", Blue, Bold, 20,Opacity[2]]]]},
        (*Calcolo delle interesezione rette circonferenza e indicazione degli stessi con etichette*) 
        {Dashed,ca = Line[{l11, l13}]}, 
        {Dashed,  cb = Line[{l12, l13}]}, 
        (*Oggetto grafico Line per rette passanti per A,C e B,C*)
        	{Polygon[{rca = RegionCentroid[ca], 
          rcb = RegionCentroid[cb], l13}, 
         VertexColors -> {White, White, Blue}]
         },
         (*Oggetto grafico angolo alla cinconferenza*)
         	{Gray,Polygon[{l11, l12, {0, 0}}, 
         VertexColors -> {White, White, Orange}]}, 
         (*Oggetto grafico angolo al centro*)
       a = ArcTan[l11[[1]], l11[[2]]];
       b = ArcTan[l12[[1]], l12[[2]]];
       c1 = ArcTan[l13[[1]], l13[[2]]];
       la = farcCirc[Abs[(a - b)*90/3.14]];
       (*Calcolo e visualizzazione ampiezza angoli*)
       Text[farcCirc[la]*2*Degree, {0, 0.1}], 
       Text[la*Degree, RegionCentroid[Line[{l13, {0, 0}}]]], 
       c = Circle[], Point[{0, 0}]}], 
    PlotRange -> {{-1.2, 1.2}, {-1.2, 1.2}}], 
   Initialization :> (farcCirc[x_] := 
      If[x < 180, IntegerPart[x], IntegerPart[360 - x]])
      (*Calcolo della funzione per ridurre computazione*)]];


   