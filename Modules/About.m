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



(* Chi siamo? *)
ModuleAbout[]:=Module[{},
	
	SetDirectory[NotebookDirectory[]];
    imgDirectory = NotebookDirectory[] <> "Images/";
	
	Noh = FileNameJoin[{"Images","index.jpg"}];	
	Noi = Image[Import[Noh], ImageSize->Large];
	
	Print[
		Grid[{
				{"", Noi}
			},
			Frame->Transparent,
			Alignment->Center, 
            Frame -> All,
            ItemSize -> {{Scaled[.28],Scaled[.3]}}
            ]
	];
	
	(*Print[ Row[" Il presente programma nasce come progetto d'esame del corso di Matematica Computazionale del primo anno Magistrale di Informatica.
	(Anno Accademico 2018-2019). Il suo sviluppo ha avuto una durata complessiva di circa due mesi. \n

    Nella progettazione del software si \[EGrave] cercato di 
	prestare particolare attenzione all'utente, cercando di facilitare la comprensione e l'assimilazione degli argomenti trattati. E' stata implementata
	una logica di gestione dei progressi utente, mediante un procedura 'step-by-step', volta a verificare l'apprendimento dei vari argomenti con una sequenza
	ben definita, tenendo conto per gli enunciati dei teoremi di utenti con disturbi specifici dell'apprendimento. \n

    Si sono riscontrate alcune difficolt\[AGrave] con l'ambiente di progettazione 'Mathematica', il quale ha richiesto un modus operandi di tipo matematico a tratti diverso da quello
	normalmente utlizzato nel percorso di studi informatico. In alcuni casi si \[EGrave] resa necessaria l'adozione di metodi che aggirassero i problemi con soluzioni, forse,
    meno performanti ma che permettessero, comunque, l'ottenimento dell'obiettivo finale (Ad esempio: la gestione di manipulate annidate all'interno di oggeti Grid e la
    loro rappresentazione grafica sul notebook). Per la condivisione e il versionamento del progetto \[EGrave] stato utilizzato il tool 'git', con un numero totale di 77 commit.  
  ", TextJustification\[Rule]1] ];*)
	 
];
