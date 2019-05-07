(* 
	Esercizio 3: preleva 3 domande vero/falso a caso da una lista di 10
	
	L'elenco di quiz puo' essere arricchito modificando opportunamente il
	file /2/quiz.csv con la struttura:
	{numero incrementale, 1 o 0 che indica vero o falso, il testo della domanda}
*)

ModuleQuizExercise3[] := DynamicModule[
   {checkCorrected},
   
   (* compara le risposte date con quelle reali e restitusce feedback all'utente *)
   checkCorrected[sol1_, res1_, sol2_, res2_, sol3_, res3_] := (
     
     If[res1 == -1  || res2 == -1 || res3 == -1, {
       MessageDialog["Rispondi a tutte le domande!"]
       }, {
       tempTot = 0;
       If[res1 == sol1, tempTot = tempTot + 1];
       If[res2 == sol2, tempTot = tempTot + 1];
       If[res3 == sol3, tempTot = tempTot + 1];
       
       ModuleQuizAnswer[2, 3, tempTot, 3];
       
       (* compone il messaggio da mostrare in risposta dentro a una finestra *)
       MessageDialog[
        StringJoin[{"Risposte corrette: ", 
          ToString@tempTot, " su 3"}]]
       }]
     
     );
   
   (* importa i quiz dal file CSV e sceglie 3 domande 
   *)
   exerciseQuizFilename = 
    FileNameJoin[{NotebookDirectory[], directoryNumber, "quiz.csv"}];
    
   ImportedData = Import[exerciseQuizFilename, "CSV"];
   
   picks = RandomSample[Range[10], 3];
   
   item1 = ImportedData[[picks[[1]]]];
   item2 = ImportedData[[picks[[2]]]];
   item3 = ImportedData[[picks[[3]]]];
   
   (* 
   	pre-imposta gli indici dei radio button su un qualunque valore
   	non riscontrabile tra quelli passati dentro i radio button
   	*)
   res1 = -1;
   res2 = -1;
   res3 = -1;
   
   (* stampa le domande nel layout dell'esercizio *)
   
   Print[Style[item1[[3]], "Subsubsection"]];
   Print[RadioButtonBar[Dynamic@res1, {1 -> "Vero", 0 ->  "Falso"}, 
     Appearance -> "Vertical"]];
   
   Print[Style[item2[[3]], "Subsubsection"]];
   Print[RadioButtonBar[Dynamic@res2, {1 -> "Vero", 0 ->  "Falso"}, 
     Appearance -> "Vertical"]];
   
   Print[Style[item3[[3]], "Subsubsection"]];
   Print[RadioButtonBar[Dynamic@res3, {1 -> "Vero", 0 ->  "Falso"}, 
     Appearance -> "Vertical"]];
   
   (* bottone finale per verificare la corretteza dell'esercizio *)
   
   Print[Button["Verifica correttezza", 
     checkCorrected[item1[[2]], res1, item2[[2]], res2, item3[[2]], res3], Background -> LightGray, FrameMargins -> Large]];
   ];

ModuleQuizExercise3[];