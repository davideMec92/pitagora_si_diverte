(* ::Package:: *)
(*Esericizio in cui viene chisto all'utente di individuare l'equazione corretta delal retta in figura*)
      exercise61[] := 
      DynamicModule[{tryAgain,risposte,rispo,l,p1,p2,line,q,m,fcart}, {
      Print[
  Graphics[{
    p1 = {RandomInteger[{-5, 0}], RandomInteger[{-5, 5}]};
    p2 = {RandomInteger[{0, 5}], RandomInteger[{-5, 5}]};
    line = {Thick, Blue, Line[{p1, p2}]}, Off[Infinity::indet];
    q = (p1[[2]] - ((p2[[2]] - p1[[2]])/(p2[[1]] - p1[[1]]))*p1[[1]]);
    m = ((p2[[2]] - p1[[2]])/(p2[[1]] - p1[[1]]));
    fcart = "y ="<>IntFun[N[Round[100*q]/100]]<>If[m>0,"+ "," "]<>If[m!=0,IntFun[N[Round[100*m]/100]]<>" x",""];
    (*Viene generata una retta random e calcolata la formula y=mx+q*)
    Line[{p1, p2}],
    PointSize[Medium],
    Point[p1],
    Point[p2],
    	Text[Style[p1, Bold,14], p1 + 0.3],
        Text[Style[p2, Bold,14], p2 - 0.3],
        Text[Style["P1", Bold,14],p1-.3],
        Text[Style["P2", Bold,14], p2+0.3]
        (*Vengono visualizzati graficamento retta(Line),punti e relative etichette(Nome e Coordinate)*)},
   PlotRange -> {{-6, 6}, {-6, 6}},
   Axes -> True, AxesOrigin -> {0, 0},
   Ticks -> {Range[-5, 5], Range[-5, 5]}, 
   AxesLabel -> {Style["x", Italic],
     Style["y", Italic]}, AspectRatio -> Automatic, 
   ImageSize -> Medium]];
        tryAgain:={rispo=Null;};     
        messageAndTryAgain61:=If[rispo===fcart,
   		ModuleQuizAnswer[6,1,1];
   		MessageDialog["Corretto",{"OK":>Null}],
   		ModuleQuizAnswer[6,1,0];
   		MessageDialog["Sbagliato",{"Riprova":>tryAgain}]];
   		(*In caso di risposta corretta l'utente riceve un punto e viene avvisato tramite messagge dialog;*)		
   		(*in caso di rsiposta sbagliata viene invitato a riprovare ma ricevera' 0 punti e viene avvisato tramite messagge dialog;*)
   		(*La correttezza viene valutata in base alla corrispondenza tra equazione calcolata e riposta fornita dall'utente tra la rosa di risposte sbaglaite generate random a cui viene aggiunta la risposta corretta*)
    	Print["Qual e' l'equazione della retta in figura? (equazioni nella forma y = q + m x )"];
     l = Round[RandomReal[{-3, 3}, 6], 0.3];
   	 risposte =Table[(m *  " x  "+ q), {q, {l[[4 ;; 6]]}}, {m, {l[[1 ;; 3]]}}];
   	 risposte=Map["y ="<>ToString[#]&,risposte[[1,1]]];
   	 AppendTo[risposte,fcart];
   	 Print[RadioButtonBar[Dynamic[rispo], RandomSample[risposte,4], Appearance -> "Vertical"]],
     Print[Button["invia", messageAndTryAgain61,Background -> LightGray, FrameMargins -> Large]];
      }     
      ];
    IntFun[x_] := If[Round[x] == x, ToString[Round@x] <> ".0", ToString@x]  
    
         exercise62[] := 
      DynamicModule[{r1,r2,r3,r4,r2abs,r4abs,tryAgain,p1,p2,line,d}, {
      	 p1 = {RandomInteger[{-5, 0}], RandomInteger[{-5, 5}]};
    	 p2 = {RandomInteger[{0, 5}], RandomInteger[{-5, 5}]};
    	 d = N[Sqrt[(p1[[1]] - p2[[1]])^2 + (p1[[2]] - p2[[2]])^2], 3];
    	line = {Thick, Blue, Line[{p1, p2}]}, Off[Infinity::indet];
    	(*Viene generata una retta random e calcolata la distanza*)
    	Print[Graphics[{line = {Thick, Blue, Line[{p1, p2}]},
    PointSize[Medium],
    Point[p1],
    Point[p2],
    	Text[Style[p1, Bold,14], p1 + 0.3],
        Text[Style[p2, Bold,14], p2 - 0.3],
        Text[Style["P1", Bold,14],p1-.3],
        Text[Style["P2", Bold,14], p2+0.3]
         (*Vengono visualizzati graficamento retta(Line),punti e relative etichette(Nome e Coordinate)*)},
   PlotRange -> {{-6, 6}, {-6, 6}},
   Axes -> True, AxesOrigin -> {0, 0},
   Ticks -> {Range[-5, 5], Range[-5, 5]}, 
   AxesLabel -> {Style["x", Italic],
     Style["y", Italic]}, AspectRatio -> Automatic, 
   ImageSize -> Medium]];
   Print["Completa correttemente la formula"];  
    	   Print[Panel[
    	 Row[{"\[Sqrt]( ",
        InputField[Dynamic[r1], Number, ImageSize -> Tiny], "  ",
       InputField[Dynamic[r2], Number, ImageSize -> Tiny], " )\.b2 ",
       " + ( ",
       InputField[Dynamic[r3], Number, ImageSize -> Tiny], "   ",
       InputField[Dynamic[r4], Number, ImageSize -> Tiny], " )\.b2 "}]]],
       (*Viene visualizzato un pannello costituito da InputField in cui l'utente inserira' la propria risposta(solo numeri accettati)*)       
        tryAgain:={r1=Null;r2=Null;r3=Null;r4=Null;};     
               messageAndTryAgain62:={
               r2abs=Abs[r2];(* caso in cui l'utente inserisce il valore corretto ma senza il segno - *)
               r4abs=Abs[r4]; (* caso in cui l'utente inserisce il valore corretto ma senza il segno - *)
              If[
        	({r1,r2abs,r3,r4abs}=={p1[[1]],Abs[p2[[1]]],p1[[2]],Abs[p2[[2]]]}||(*Caso (x1-x2)+(y1-y2) *)
        	{r1,r2abs,r3,r4abs}=={p1[[1]],Abs[p2[[1]]],p2[[2]],Abs[p1[[2]]]}||(*Caso (x1-x2)+(y2-y1) *)
        	{r1,r2abs,r3,r4abs}=={p2[[1]],Abs[p1[[1]]],p1[[2]],Abs[p2[[2]]]}||(*Caso (x2-x1)+(y1-y2) *)
        	{r1,r2abs,r3,r4abs}=={p2[[1]],Abs[p1[[1]]],p2[[2]],Abs[p1[[2]]]}||(*Caso (x2-x1)+(y2-y1) *)
        	{r1,r2abs,r3,r4abs}=={p1[[2]],Abs[p2[[2]]],p1[[1]],Abs[p2[[1]]]}||(*Caso (y1-y2)+(x1-x2) *)
        	{r1,r2abs,r3,r4abs}=={p1[[2]],Abs[p2[[2]]],p2[[1]],Abs[p1[[1]]]}||(*Caso (y1-y2)+(x2-x1) *)
        	{r1,r2abs,r3,r4abs}=={p2[[2]],Abs[p1[[2]]],p1[[1]],Abs[p2[[1]]]}||(*Caso (y2-y1)+(x1-x2) *)
        	{r1,r2abs,r3,r4abs}=={p2[[2]],Abs[p1[[2]]],p2[[1]],Abs[p1[[1]]]})(*Caso (y2-y1)+(x2-x1) *)
               ,
   		ModuleQuizAnswer[6,2,1];
   		MessageDialog["La formula \[Sqrt][("<>ToString[r1]<>If[r2>0," - ","+"]<>ToString[r2abs]<>")\.b2 +("<>ToString[r3]<>If[r4>0," - ","+"]<>ToString[r4abs]<>")\.b2] e' corretta!",{"OK":>Null}],
   		ModuleQuizAnswer[6,2,0];
   		(*In caso di risposta corretta l'utente riceve un punto e viene avvisato tramite messagge dialog;*)		
   		(*in caso di rsiposta sbagliata viene invitato a riprovare ma ricevera' 0 punti e viene avvisato tramite messagge dialog;*)
   		(*La correttezza viene verificata tramite la corrispondenza tra le coordinate dei punti della retta indicati e le risposte fornite dall'utente nell'ordine corretto*)
   		MessageDialog["La formula \[Sqrt][("<>ToString[r1]<>If[r2>0," - ","+"]<>ToString[r2abs]<>")\.b2 +("<>ToString[r3]<>If[r4>0," - ","+"]<>ToString[r4abs]<>")\.b2] e' errata!",{"Riprova":>tryAgain}]]};    	  
     Print[Button["invia", messageAndTryAgain62,Background -> LightGray, FrameMargins -> Large]];
      }     
      ];
      
      
      
      
Print[TextCell["Esercizio I", "Subsection"]];      
exercise61[];
Print[TextCell["Esercizio II", "Subsection"]];   
exercise62[];