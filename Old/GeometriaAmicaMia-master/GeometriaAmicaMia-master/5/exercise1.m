(* ::Package:: *)
(* Funzione per generare grafici con rette casuali :
o: specifica di quanto le rette debbano essere distanti
labellist: specifica dicome chiamare le etichette(es.numeri,lettere)*)

funRandQuiz[o_,lablist_] :=
 DynamicModule [{pt1,pt2,pr1,pr2,lt,lr1,lr2},
  Graphics[{
    pt1 = {RandomInteger[{-15, -10}], RandomInteger[{-10, -15}]};
    pt2 = {RandomInteger[{10, 15}], RandomInteger[{10, 15}]};
    pr1 = {RandomInteger[{-15, -10}], RandomInteger[{20, 25}]};
    pr2 = {RandomInteger[{10, 15}], RandomInteger[{-15, -10}]};
    (*Vengono generati dei punti casuali*)
    Red, lt = Line[{pt1, pt2}],
    Blue, lr1 = Line[{pr1, pr2-1}], 
    lr2 = Line[{pr1 + 2 , pr2 + 2 + 2*o}],
    (*Vengono generate le Line con i punti casuali con distanza minima 2 e offset random  *)
    funlabel4[lt, lr1, 0,lablist],
    funlabel4[lt, lr2, 1,lablist]},
    (*Viene richiamata la funzione per le etichette*)
   ImageSize -> Medium, PlotRange -> {{-10, 10}, {-10, 10}}]
  ]
  
  
(*Funzione per inserire etichette numeriche sugli angoli delle intersezione tra due rette date*)
funlabel4[l1_, l2_, o_,labellist_] := DynamicModule[{cab,ia,ib,lab1,lab2,lab3,lab4},
	{cab = RegionIntersection[l1, l2][[1, 1]];
  {Opacity[.6, LightBlue], Disk[cab, 1]}, 
  ia = RegionIntersection[Circle[cab], l1];
  ib = RegionIntersection[Circle[cab], l2];
  (*Vengono calcolate le intersezioni rette date con cironferenza*)
  lab1 = Line[{ia[[1, 1]], ib[[1, 1]]}];
  lab2 = Line[{ia[[1, 1]], ib[[1, 2]]}];
  lab4 = Line[{ia[[1, 2]], ib[[1, 1]]}];
  lab3 = Line[{ia[[1, 2]], ib[[1, 2]]}];
   (*Vengono calcolate le Line che congiungono i punti*)   
  Text[labellist[[1]] + 4*o, RegionCentroid[lab1]], 
  Text[labellist[[2]] + 4*o, RegionCentroid[lab2]], 
  Text[labellist[[3]]+ 4*o, RegionCentroid[lab3]], 
  Text[labellist[[4]] + 4*o, RegionCentroid[lab4]]}
   (*Vengono applicate le etichette ai punti*)
   ]
   
   
   
     
(*Esercizio in cui una volta generato un grafico casuale viene chiesto di trovare tutti gli angoli congruenti a un angolo dato
p=0,1 0 se si vogliono disegnare rette parallele; 1 altrimenti*)
exercise51[p_] := DynamicModule[{str,tryAgain,offset,nAngle,rispW,labellist}, {
   offset=RandomReal[{0,p}];
   labellist={1,2,3,4};
   	Print[funRandQuiz[offset,labellist]],
   	(*Viene generato il grafico casuale*)
   	  nAngle=RandomInteger[{1,8}];
   	  rispW=If[EvenQ[nAngle],{2,4,6,8},{1,3,5,7}];
   	  rispW=Delete[rispW,Position[rispW,nAngle]];
   	  (*Viene creata la lista per il controllo della risposta in base alla parita' o meno del numero nAgle richiesto*)
   	    tryAgain:={str=Null};
        messageAndTryAgain51:=If[ContainsOnly[str,rispW]&& Length[str]==3,    	
   		ModuleQuizAnswer[5,1,1];
   		MessageDialog["Corretto",{"OK":>Null}],
   		ModuleQuizAnswer[5,1,0];
   		MessageDialog["Gli angoli selezionati sono errati oppure non sono stati selezionati tutti gli angoli congruenti!",{"Riprova":>tryAgain}] 
   		(*In caso di risposta corretta l'utente riceve un punto e viene avvisato tramite messagge dialog;*)		
   		(*in caso di rsiposta sbagliata viene invitato a riprovare ma ricevera' 0 punti e viene avvisato tramite messagge dialog;*)
   		(*La correttezza viene valutata in base al controllo di parita' del numero random indicante l'angolo *)
   		];
    	Print["Quali angoli sono congruenti all'angolo " <> ToString[nAngle] <> "?"];
     Print[CheckboxBar[Dynamic[str], Delete[Range[1, 8], Position[Range[1, 8],nAngle]]]];    
     Print[Button["Invia", messageAndTryAgain51,Background -> LightGray, FrameMargins -> Large]];
    (*Viene generata la domanda, pulsante di invio e richiamo della variabile per il controllo*)
     
};]

     
 (*Esercizio in cui una volta generato un grafico casuale viene chiesto di trovare tutti gli angoli specificati nella domanda           
 p=0,1 0 se si vogliono disegnare rette parallele; 1 altrimenti
 q="" stringa di testo relativa alla domanda
 n=1,2.. indica il numero della domanda che sara salvato nel csv utente
 e' possibile aggiungere domande semplicemente andando modifica lo Switch in domanda e rispcorr
 *)
      exercise52[p_,q_,n_] := DynamicModule[{str,tryAgain,offset,rispq,labellist,domanda,rispcorr}, {
      offset=RandomReal[{0,p}];
      (*p indica il valore da sommare alle coordinate della seconda retta per ottenere rette parallele(q=0) o meno(q!=0)*)
      labellist={1,2,3,4};
      domanda=Switch[q,
      	1,"Quali tra i seguenti sono angoli alterni interni?",
      	2,"Quali tra i seguenti sono angoli alterni esterni?",
      	3,"Quali tra i seguenti sono angoli coniugati interni?",
      	4,"Quali tra i seguenti sono angoli coniugati esterni?",
      	5,"Quali tra i seguenti sono angoli corrispondenti?"
      	];
      rispcorr=Switch[q,
      	1,{{3,5},{4,6}},
      	2,{{1,7},{2,8}},
      	3,{{3,6},{4,5}},
      	4,{{1,8},{2,7}},
      	5,{{1,5},{2,6},{3,7},{4,8}}
      	];
      (*A seconda del numero della domanda viene genrata la domanda corripondete e le risposte corrette*)
   	Print[funRandQuiz[offset,labellist]],   	
   	(*Viene generato il grafico casuale mentre le etichette sono mantenute fisse*)    
   tryAgain:={str=Null;};
        messageAndTryAgain52:=If[Count[Map[MemberQ[str, #] &,rispcorr],True]==Length[rispcorr] && Length[str]==Length[rispcorr],
   		ModuleQuizAnswer[5,n,1];
   		MessageDialog["Corretto",{"OK":>Null}],
   		ModuleQuizAnswer[5,n,0];
   		MessageDialog["Sbagliato",{"Riprova":>tryAgain}]
   		(*In caso di risposta corretta l'utente riceve un punto e viene avvisato tramite messagge dialog;*)		
   		(*in caso di rsiposta sbagliata viene invitato a riprovare ma ricevera' 0 punti e viene avvisato tramite messagge dialog;*)
   		(*La correttezza viene valutata in base alla presenza della riposta corretta tra le scelte dell'utente tramite MemberQ*)
   ];   
    	Print[domanda];
    	rispq = Subsets[{1, 2, 3, 4, 5, 6, 7, 8}, {2}];
		rispq=DeleteDuplicates[RandomSample[Delete[rispq, Flatten[Map[Position[rispq, #] &, rispcorr], 1]],5]];	
	   	(*Vengono generate le risposte sbagliate e scelte casualmente e eliminate tutte quelle corrette*)
	   	rispcorr=RandomSample[rispcorr,RandomInteger[{1,Length[rispcorr]}]];   	
    	Map[AppendTo[rispq,#]&,rispcorr];
    	(*Vengono inseriti un numero random di risposte corrette nelle risposte*)
     Print[CheckboxBar[Dynamic[str], RandomSample[rispq]]];
     Print[Button["invia", messageAndTryAgain52,Background -> LightGray, FrameMargins -> Large]];
      (*Viene generata la domanda con alternative random, pulsante di invio e richiamo della variabile per il controllo*)
	 }
      ]
Print[TextCell["Esercizio I", "Subsection"]];
exercise51[1];
Print[TextCell["Esercizio II", "Subsection"]];
exercise52[1,RandomChoice[{1,2,3,4,5}],2];

