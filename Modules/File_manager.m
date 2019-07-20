(* ::Package:: *)

(*  Questo modulo include tutte le funzioni necessarie al salvataggio e alla lettura dei dati utente.
	
	Questo modulo \[EGrave] stato creato in quanto abbiamo riscontrato una particolare difficolt\[AGrave] nella gestione
	di variabili globali e/o di sessione che mantenessero la loro consistenza. Abbiamo preferito quindi
	creare dei file che contenessero dati permanenti nei diversi stati del notebook.
	
	Il presente modulo \[EGrave] atto a gestire:
	
	> I progressi utente: sono gestiti come una lista, in cui al primo posto \[EGrave] sempre presente l'username dell'utente
	e a seguire, con indici predefiniti, degli 0 e 1 che rappresentano l'avere completato o meno un determinato esercizio
	( 0 non completato, 1 completato )
	
	> La sessione utente: \[EGrave] semplicemente un file (session.txt) che porta al suo interno lo username dell'utente che ha
	eseguito l'accesso, in questo modo da qualsiasi altro modulo sar\[AGrave] possibile ottenere il file dei progressi utente
	(username.csv) mediante la sola lettura del contenuto del file "session.txt"
  *)

mainDirectory = "";
userDataset = Null;

(* Metodo di inizializzazione e settaggio directory *)
Init[ directory_ ]:=Module[{},
	mainDirectory = NotebookDirectory[];
];

(* La funzione AddUser ha il compito di verificare l'esistenza o meno di progressi relativi a un determinato
username. In caso l'username non esista la funzione inizializza i progressi per il nuovo utente. Nel caso in
cui l'username esista gi\[AGrave], la funzione ritorna i progressi precedentemente salvati. *)
AddUser[ username_ ]:=Module[{userDataset},

	(* Verifico che esista un salvataggio precedente con l'username ricevuto *)
	If[ FileExistsQ[ NotebookDirectory[] <> "Data/" <> username <> ".csv" ], 
		(
			importedDatasetList = Import[ NotebookDirectory[] <> "Data/" <> username <> ".csv", "CSV" ];
			userDataset = importedDatasetList[[1]];
			Return[userDataset];
		)
	, 
		(
			usersDatasetList = {username, 0, 0, 0, 0, 0, 0};
			Export[ NotebookDirectory[] <> "Data/" <> username <> ".csv",  {usersDatasetList} ]; 
			userDataset = usersDatasetList;
			Return [usersDatasetList];
		)
	 ];
	 
	 Return[Null];
	 
];

(* Tale funzione ritorna i progressi dell'utente, nel caso esistano *)
GetUser[ username_ ]:=Module[{usersDatasetList},

	If[ FileExistsQ[ NotebookDirectory[] <> "Data/" <> username <> ".csv" ] == True, 
		(
			usersDatasetList = Import[ NotebookDirectory[] <> "Data/" <> username <> ".csv", "CSV" ];
			usersDatasetList = usersDatasetList[[1]];
			userDataset = usersDatasetList;
			Return[usersDatasetList];
		)
	, 
		Return[Null];
	 ];
	 
	 Return[Null];
	 
];

(* Funzione che si occupa del salvataggio dei progressi utente *)
SaveUserData[ userData_ ]:=Module[{},
   Export[ NotebookDirectory[] <> "Data/" <> userData[[1]] <> ".csv",  {userData} ];   
   userDataset = userData;
];

(* Funzione che ha il compito di inzializzare la sessione dell'utente con l'username inserito *)
StartUserSession[ username_ ]:=Module[{},
   Export[ NotebookDirectory[] <> "Data/session.txt",  username ];
];

(* Funzione che ritorna lo username utente, attualmente attivo sul notebook *)
GetUserSession[]:=Module[{ username },
	username = "";
	
	If[ FileExistsQ[ NotebookDirectory[] <> "Data/session.txt" ] == True, (
		username = Import[ NotebookDirectory[] <> "Data/session.txt" ];
	) ];
   
    Return[username];
   
];

(* Funzione che si occupa di eseguire il logout, ripulendo il file session.txt *)
ClearUserSession[]:=Module[{},
   Export[ NotebookDirectory[] <> "Data/session.txt",  "" ];
];

