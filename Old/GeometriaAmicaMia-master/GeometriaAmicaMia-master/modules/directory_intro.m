(* ::Package:: *)

(* Questi moduli strutturano le slide di introduzione alle materie trattate utilizzando
i file testuali e le immagini contenuti nelle directory relative *)

ModuleDirectoryIntro[directoryNumber_]:=Module[{},
	directoryFilename=directoryNumber;
	
	videoFilename=FileNameJoin[{NotebookDirectory[],directoryNumber,"video.mp4"}];
	ButtonVideo := If[
		FileExistsQ[videoFilename ],
			Button[
				Grid[{{
					Style[ "Videolezione","Subsubsection"]
				},{
					Import[FileNameJoin[{directoryNumber,"video_preview.png"}]]
				}}],
				SystemOpen[  FileNameJoin[{NotebookDirectory[],directoryNumber,"video.mp4"}]],
				ImageSize -> { 250, 250 }],
			""
		];
	
	(* Questa funzione e' mappata sulle righe dell'introduzione per aggiungere il pulsante per l'accessibilita audio *)
	printLineAndSpeakIt[line_] := TextCell[Row[{Button[Import[FileNameJoin[{"files","audio.png"}]],Speak[line]],"\n",line,".\n"}],"Text", TextJustification -> 1];
	
	If[
		FileExistsQ[directoryFilename ],
			Print[
				Grid[{{ 
					
						Import[FileNameJoin[{directoryNumber,"image.png"}]],
						
					
					Column[Map[printLineAndSpeakIt,StringSplit[Import[FileNameJoin[{directoryNumber,"intro.txt"}]], ".\n"]]]
					
					
					,
					ButtonVideo
					}},
					Alignment->{{Left,Left,Left},{Top,Top,Top}},Frame->None
				] (* Costruisco la descrizione *)
			];
		];
	];

