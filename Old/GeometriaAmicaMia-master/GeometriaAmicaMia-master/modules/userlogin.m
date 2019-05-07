(* ::Package:: *)

ModuleUserLogin[]:=DynamicModule[{Welcome,UserName},


	usernameFilename = FileNameJoin[{"data","username.txt"}];
	userquizFilename = FileNameJoin[{"data","quiz.csv"}];
	
	deleteUsernameFilename := If[
		FileExistsQ[usernameFilename],
		DeleteFile[usernameFilename],
		Null
	];
	
	deleteUserquizFilename := If[
		FileExistsQ[userquizFilename],
		DeleteFile[userquizFilename],
		Null
	];
		
	ResetUserData := Button[
		StringJoin["Non sei ",UserName,"? Clicca qui per resettare i dati relativi all'utente"],
		Welcome = WelcomeYouHaveToSubcribe;
		deleteUsernameFilename;
		deleteUserquizFilename;
		UserName = Null,
		Background->LightGray,
		FrameMargins->Small
	];
		
	WelcomeBack := Grid[{
		{Style[StringJoin[ "Bentornato ", UserName,"!"],"Chapter"]},
		{ResetUserData}
	},Frame->Transparent];
			
	WelcomeForTheFirstTime := Grid[{
		{Style[StringJoin[ "Benvenuto ", UserName,"!"],"Chapter"]},
		{Style["Siamo sicuri che sei impaziente di conoscere la Storia della Geometria.","Text"]},
		{ResetUserData}
	},Frame->Transparent];
			
	WelcomeYouHaveToSubcribe := Grid[{
		{Style[ "Conosciamoci meglio: come ti chiami?","Text"]},
		{Row[{
			InputField[Dynamic[UserName], String,FrameMargins->Medium],
			Button[
				"Salva il tuo nome",
				Welcome = WelcomeForTheFirstTime;
				Export[FileNameJoin[{"data/","username.txt"}], UserName],
				Background->LightGray,
				FrameMargins->Medium
			]
		}]}
	},Frame->Transparent];
	
	If[
		FileExistsQ[usernameFilename],
		UserName=Import[usernameFilename];
		Welcome = WelcomeBack,
		Welcome= WelcomeYouHaveToSubcribe;
	];
	

	
	Print[Style[Dynamic[Welcome]]];




];
