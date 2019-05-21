(* ::Package:: *)

(*Directory di root progetto*)
mainDirectory = "";
userDataset = Null;

(*Metodo di inizializzazione, deve essere sempre richiamato prima di richiamare qualsiasi metodo*)
Init[ directory_ ]:=Module[{},
	mainDirectory = directory;
];

(*Funzione che verifica se un determinato username, \[EGrave] presente nel dataset*)
AddUser[ username_ ]:=Module[{userDataset},

	If[ FileExistsQ[ mainDirectory <> "Data/" <> username <> ".csv" ], 
		(
			importedDatasetList = Import[ mainDirectory <> "Data/" <> username <> ".csv", "CSV" ];
			userDataset = importedDatasetList[[1]];
			Return[userDataset];
		)
	, 
		(
			usersDatasetList = {username, 0, 0, 0};
			Export[ mainDirectory <> "Data/" <> username <> ".csv",  {usersDatasetList} ]; 
			userDataset = usersDatasetList;
			Return [usersDatasetList];
		)
	 ];
	 
	 Return[Null];
	 
];

(*Funzione che verifica se un determinato username, \[EGrave] presente nel dataset*)
GetUser[ username_ ]:=Module[{usersDatasetList},

	If[ FileExistsQ[ mainDirectory <> "Data/" <> username <> ".csv" ], 
		(
			usersDatasetList = Import[ mainDirectory <> "Data/" <> username <> ".csv", "CSV" ];
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
   Export[ mainDirectory <> "Data/" <> userData[[1]] <> ".csv",  {userData} ];   
   userDataset = userData;
];

GetUserLoadedData[]:=Module[{userDataset},
	Return[userDataset];
];

GetMainDirectory[]:=Module[{mainDirectory},
	Return[mainDirectory];
];

