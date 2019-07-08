(* ::Package:: *)

(*Directory di root progetto*)
mainDirectory = "";
userDataset = Null;

(*Metodo di inizializzazione, deve essere sempre richiamato prima di richiamare qualsiasi metodo*)
Init[ directory_ ]:=Module[{},
	mainDirectory = NotebookDirectory[];
];

(*Funzione che verifica se un determinato username, \[EGrave] presente nel dataset*)
AddUser[ username_ ]:=Module[{userDataset},

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

(*Funzione che verifica se un determinato username, \[EGrave] presente nel dataset*)
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

SaveUserData[ userData_ ]:=Module[{},
   Export[ NotebookDirectory[] <> "Data/" <> userData[[1]] <> ".csv",  {userData} ];   
   userDataset = userData;
];

GetUserLoadedData[]:=Module[{userDataset},
	Return[userDataset];
];

GetMainDirectory[]:=Module[{mainDirectory},
	Return[mainDirectory];
];

StartUserSession[ username_ ]:=Module[{},
   Export[ NotebookDirectory[] <> "Data/session.txt",  username ];
];

GetUserSession[]:=Module[{ username },
	username = Null;
	
	If[ FileExistsQ[ NotebookDirectory[] <> "Data/session.txt" ] == True, (
		username = Import[ NotebookDirectory[] <> "Data/session.txt" ];
	) ];
   
    Return[username];
   
];

ClearUserSession[]:=Module[{},
   Export[ NotebookDirectory[] <> "Data/session.txt",  "" ];
];

