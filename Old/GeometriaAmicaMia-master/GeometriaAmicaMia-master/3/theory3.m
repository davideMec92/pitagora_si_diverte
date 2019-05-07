(* ::Package:: *)

(* Formule riguardanti il Teorema di Pitagora *)

Print[Style["Partiamo dalla formula del teorema di Pitagora","Text"]];
Print[ "A"^2,"+","B"^2,"=","C"^2];

Print[Style["da qui possiamo ricavare subito la lunghezza dell'ipotenusa supponendo di conoscere i due cateti infatti:","Text"]];
Print["C=",Sqrt[Row[{"A"^2,"+","B"^2}]]];

Print[Style["se vogliamo invece la misura del cateto A possiamo come prima cosa ricavare A"^2," in questo modo: ","Text"]];
Print["A"^2,"=","C"^2,"-","B"^2 ];

Print[Style["facendo la radice quadrata otteniamo la misura di A:","Text"]];
Print["A=",Sqrt[Row[{"C"^2,"-","B"^2}]]];

Print[Style["Possiamo applicare lo stesso ragionamento per calcolare la lunghezza di B:","Text"]];
Print["B"^2,"=","C"^2,"-","A"^2];

Print[Style[" da cui","Text"]];
Print["B","=",Sqrt[Row[{"C"^2,"-","A"^2}]]];

Print[Style["Capiamo quindi che non occorre ricordarsi una formula diversa a seconda della richiesta dell'esercizio, ma \[EGrave] sufficiente la formula del teorema di Pitagora per ricavarsi tutte le altre.","Text"]];

