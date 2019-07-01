(* ::Package:: *)

GetUsername[ userList_ ]:=Module[{username},
	username = userList[[1]];	
	Return[username];
];

GetExercise1[ userList_ ]:=Module[{exercise1},
	exercise1 = userList[[2]]; 
	Return[exercise1];
];

GetExercise2[ userList_ ]:=Module[{exercise2},
	exercise2 = userList[[3]]; 
	Return [exercise2];
];

GetExercise3[ userList_ ]:=Module[{exercise3},
	exercise3 = userList[[4]]; 
	Return [exercise3];
];

