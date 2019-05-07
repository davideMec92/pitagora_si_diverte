(* ::Package:: *)

ModulePythagoreanTriple[]:=Module[{
	PythagoreanTriples,
	RandomPythagoreanTriple
},
(* Estrazione di una terna pitagorica dall'insieme delle terne pitagoriche costituite da interi minori di 100 *)
	PythagoreanTriples =Cases[Append[#, Norm@#] & /@ Subsets[Range[100], {2}], {_, _, _Integer}];
	RandomPythagoreanTriple = RandomChoice[PythagoreanTriples];
	Return[RandomPythagoreanTriple];
	
];
