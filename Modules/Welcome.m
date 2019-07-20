(* ::Package:: *)

(*  

  /$$$$$$$ /$$  /$$                                                                /$$             /$$/$$                             /$$             
| $$__  $|__/ | $$                                                               |__/            | $|__/                            | $$             
| $$  \ $$/$$/$$$$$$   /$$$$$$  /$$$$$$  /$$$$$$  /$$$$$$    /$$$$$$      /$$$$$$$/$$        /$$$$$$$/$$/$$    /$$/$$$$$$  /$$$$$$ /$$$$$$   /$$$$$$ 
| $$$$$$$| $|_  $$_/  |____  $$/$$__  $$/$$__  $$/$$__  |____  $$     /$$_____| $      /$$__  $| $|  $$  /$$/$$__  $$/$$__  $|_  $$_/  /$$__  $$
| $$____/| $$ | $$     /$$$$$$| $$  \ $| $$  \ $| $$  \__//$$$$$$$     |  $$$$$$| $$     | $$  | $| $$\  $$/$$| $$$$$$$| $$  \__/ | $$   | $$$$$$$$
| $$     | $$ | $$ /$$/$$__  $| $$  | $| $$  | $| $$     /$$__  $$      \____  $| $$     | $$  | $| $$ \  $$$/| $$_____| $$      | $$ /$| $$_____/
| $$     | $$ |  $$$$|  $$$$$$|  $$$$$$|  $$$$$$| $$    |  $$$$$$$       /$$$$$$$| $$     |  $$$$$$| $$  \  $/ |  $$$$$$| $$       |  $$$$|  $$$$$$$
|__/     |__/  \___/  \_______/\____  $$\______/|__/     \_______/      |_______/|__/       \_______|__/   \_/   \_______|__/        \___/  \_______/
                               /$$  \ $$                                                                                                             
                              |  $$$$$$/                                                                                                             
                               \______/                                                                                                              

Progetto d'esame di Matematica computazionale
Anno accademico 2018-2019

Sviluppato su Wolfram Mathematica 11.3
							   
							   
Davide Nunzio Maccarrone (0000843825)
Bruno Quintero Panaro 	 (0000850912)  
*)


ModuleWelcome[]:=Module[{},
(*Questa \[EGrave] la Home*)

(*Mi servir\[AGrave] avere i dati utenti e di sessione*)
Import["Modules/File_manager.m"];

userSessionName = GetUserSession[];
						
If[ userSessionName == "", ( 
	MessageDialog[ "Benvenuto in Pitagora si Diverte, per iniziare accedi al menu utente inserendo il tuo Nickname"<>"\n\n"<>"Poi, dalla home o dal menu in alto potrai accedere alla sessione di Eclide. "<>"\n\n"<>" Una volta completati i suoi esercizi potrai tornare procedere con la parte di Pitagora"];
)];

(*Immagini*)
imgDirectory = NotebookDirectory[] <> "Images/";
	
Logh = FileNameJoin[{ imgDirectory,"logo.png"}];	
	
Eu = FileNameJoin[{ imgDirectory,"1.png"}];
Pit = FileNameJoin[{ imgDirectory,"2.png"}];

Logo = Image[Import[Logh], ImageSize->Medium];

Pitagora=Image[ Import[Pit], ImageSize->Medium];
Euclide= Image[ Import[Eu], ImageSize->Medium];


(*Logo*)
Print[Grid[{
			{"",
			Logo}
	},Frame->Transparent, Alignment->Center, ItemSize -> {{Scaled[.28],Scaled[.3]}}, 
 Frame -> All]
];

(*Pitagora ed Euclide*)
Print[Grid[{
		{"", 
		Button[Euclide, NotebookLocate["_EuclideEnunciato"],ContentPadding -> False, FrameMargins->None, Background->White, Appearance->"Frameless"], 
		Button[
					Pitagora,
					(
						userSessionName = GetUserSession[];
						
						If[ userSessionName != "", ( 
							
							userData = AddUser[ userSessionName ];
						
							If[ userData[[GetIndexEx1Euclide[]]] == 0, (
								MessageDialog[ "E' necessario completare il primo esercizio nella sezione relativa ad Euclide prima di procedere"];
							), (
								If[ userData[[GetIndexEx2Euclide[]]] == 0, (
									MessageDialog[ "E' necessario completare il secondo esercizio nella sezione relativa ad Euclide prima di procedere"];
								), (
									NotebookLocate["_PitagoraEnunciato"];
								)];
							
							) ];
						), (
							MessageDialog[ "E' necessario effettuare il login, dal menu utente, prima di procedere"];
						)];
					)
				,ContentPadding -> False, FrameMargins->None, Background->White, Appearance->"Frameless"]}
	},Frame->Transparent, Alignment->Center, ItemSize -> {{Scaled[.15],Scaled[.3], Scaled[.3]}}, 
 Frame -> All]
];

];
