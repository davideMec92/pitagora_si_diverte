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


ModuleOptions[]:=Module[{},



(* Vengono settate le opzioni iniziali del programma *)
	SetDirectory[NotebookDirectory[]];
    
	SetOptions[$FrontEnd,ShowCellLabel->False];
	(* Questa \[EGrave] la barra in cima *)
	SetOptions[EvaluationNotebook[],DockedCells->Cell[BoxData[ToBoxes[Grid[
		{{
			Import[FileNameJoin[{"Images","logo_small.png"}]], (* Logo a sinistra *)
			ActionMenu[    (* ActionMenu al centro, quelli di pitagora hanno i controlli *)
				"              Dove vuoi andare?             ",
				{"Euclide Teorema" :> NotebookLocate["_EuclideEnunciato"],
				 "Euclide Dimostrazione" :> NotebookLocate["_EuclideDimostrazione"],
				 "Euclide Esempi" :> NotebookLocate["_EuclideEsempi"],
				 "Euclide Esercizi" :> NotebookLocate["_EuclideEsercizi"],
				 "Pitagora Teorema" :> (
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
					),
				 "Pitagora Dimostrazione" :> (
						userSessionName = GetUserSession[];
						
						If[ userSessionName != "", ( 
							
							userData = AddUser[ userSessionName ];
						
							If[ userData[[GetIndexEx1Euclide[]]] == 0, (
								MessageDialog[ "E' necessario completare il primo esercizio nella sezione relativa ad Euclide prima di procedere"];
							), (
								If[ userData[[GetIndexEx2Euclide[]]] == 0, (
									MessageDialog[ "E' necessario completare il secondo esercizio nella sezione relativa ad Euclide prima di procedere"];
								), (
									NotebookLocate["_PitagoraDimostrazione"];
								)];
							
							) ];
						), (
							MessageDialog[ "E' necessario effettuare il login, dal menu utente, prima di procedere"];
						)];
					),
				 "Pitagora Esempi" :> (
						userSessionName = GetUserSession[];
						
						If[ userSessionName != "", ( 
							
							userData = AddUser[ userSessionName ];
						
							If[ userData[[GetIndexEx1Euclide[]]] == 0, (
								MessageDialog[ "E' necessario completare il primo esercizio nella sezione relativa ad Euclide prima di procedere"];
							), (
								If[ userData[[GetIndexEx2Euclide[]]] == 0, (
									MessageDialog[ "E' necessario completare il secondo esercizio nella sezione relativa ad Euclide prima di procedere"];
								), (
									NotebookLocate["_PitagoraEsempi"];
								)];
							
							) ];
						), (
							MessageDialog[ "E' necessario effettuare il login, dal menu utente, prima di procedere"];
						)];
					),
				 "Pitagora Esercizi" :> (
						userSessionName = GetUserSession[];
						
						If[ userSessionName != "", ( 
							
							userData = AddUser[ userSessionName ];
						
							If[ userData[[GetIndexEx1Euclide[]]] == 0, (
								MessageDialog[ "E' necessario completare il primo esercizio nella sezione relativa ad Euclide prima di procedere"];
							), (
								If[ userData[[GetIndexEx2Euclide[]]] == 0, (
									MessageDialog[ "E' necessario completare il secondo esercizio nella sezione relativa ad Euclide prima di procedere"];
								), (
									NotebookLocate["_PitagoraEsercizi"];
								)];
							
							) ];
						), (
							MessageDialog[ "E' necessario effettuare il login, dal menu utente, prima di procedere"];
						)];
					)}
			], (* Bottoni a destra *)
			Button["Home",NotebookLocate["_intro"],Background->White,FrameMargins->Medium],
			Button["Utente",NotebookLocate["_user"],Background->White,FrameMargins->Medium],
			Button["Help",NotebookLocate["_help"],Background->White,FrameMargins->Medium]
		}},
		ItemSize->{{ (* Regolo le dimensioni *)
			Scaled[0.3],
			Scaled[0.4],
			Scaled[0.1],
			Scaled[0.1],
			Scaled[0.1]
		}},
		Frame-> Transparent
	]]], Background-> RGBColor["#1d8376"]]];

];



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
									PitagoraEsercizio1[];
                                    PitagoraEsercizio2[];
                                    PitagoraEsercizio3[];
                                    PitagoraEsercizio4[];
								)];
							
							) ];
						), (
							MessageDialog[ "E' necessario effettuare il login, dal menu utente, prima di procedere"];
						)];
					)
				,ContentPadding -> False, FrameMargins->None, Background->White, Appearance->"Frameless"];



