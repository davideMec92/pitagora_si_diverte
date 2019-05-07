(* ::Package:: *)

CheckFile[directory_]:=Module[{},
	(*Commento*)

	If[ FileExistsQ[ directory <> "Data/Users_data.dat" ], Print["Esiste"], Export[ directory <> "Data/Users_data.dat",  Null ] ];

];
