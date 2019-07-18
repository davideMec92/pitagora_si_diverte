(* ::Package:: *)

(* Il presente modulo contiene tutte le funzioni di utilit\[AGrave] rese necessarie per la gestione
dei dati utente al fine di evitare ripetizioni di codice e semplificando logicamente la programmazione *)

(* Questa funzione, data la lista dei dati utente, estrapola e ritorna l'username dell'utente *)
GetUsername[ userList_ ]:=Module[{username},
	username = userList[[1]];	
	Return[username];
];

(* Questa funzione, data la lista dei dati utente, estrapola e ritorna il risultato del primo
esercizio su Euclide *)
GetEuclideExercise1[ userList_ ]:=Module[{exercise1},
	exercise1 = userList[[2]]; 
	Return[exercise1];
];

(* Questa funzione, data la lista dei dati utente, estrapola e ritorna il risultato del secondo 
esercizio su Euclide *)
GetEuclideExercise2[ userList_ ]:=Module[{exercise2},
	exercise2 = userList[[3]]; 
	Return [exercise2];
];

(* Questa funzione, data la lista dei dati utente, estrapola e ritorna il risultato del primo 
esercizio su Pitagora *)
GetPitagoraExercise1[ userList_ ]:=Module[{exercise3},
	exercise3 = userList[[4]]; 
	Return [exercise3];
];

(* Questa funzione, data la lista dei dati utente, estrapola e ritorna il risultato del secondo 
esercizio su Pitagora *)
GetPitagoraExercise2[ userList_ ]:=Module[{exercise4},
	exercise4 = userList[[5]]; 
	Return [exercise4];
];

(* Questa funzione, data la lista dei dati utente, estrapola e ritorna il risultato del terzo 
esercizio su Pitagora *)
GetPitagoraExercise3[ userList_ ]:=Module[{exercise5},
	exercise5 = userList[[6]]; 
	Return [exercise5];
];

(* Questa funzione, data la lista dei dati utente, estrapola e ritorna il risultato del quarto 
esercizio su Pitagora *)
GetPitagoraExercise4[ userList_ ]:=Module[{exercise6},
	exercise6 = userList[[7]]; 
	Return [exercise6];
];


