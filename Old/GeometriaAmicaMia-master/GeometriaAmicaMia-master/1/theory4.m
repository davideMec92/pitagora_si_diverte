(* ::Package:: *)

(*  Questo testo e' generato in mathematica  (anziche' essere importato da un file txt) 
per inserire dei tooltip in mezzo al testo *)

Print[TextCell[
Row[{
"Ogni traslazione \[EGrave] definita da ",
Tooltip[Style[" un vettore ", "Text", Brown, Bold],
"Un vettore \[EGrave] un segmento orientato che per essere individuato
ha bisogno di un modulo, verso e direzione
Modulo: lunghezza del segmento AB
Direzione: retta che congiunge A e B
Verso: direzione della freccia, in questo caso da A a B
", 
TooltipStyle -> {Background -> RGBColor[1, 1, 0.85], 
CellFrameColor -> Red, CellFrame -> 2, CellFrameMargins -> 20, 
TextAlignment -> Center}
],
OverVector["v"],
" che per definizione \[EGrave] caratterizzato da un modulo, un verso e una direzione.
La traslazione di un punto ",
Style["P", Bold],
" definita da un vettore ",
OverVector["v"],
" associa a un punto ",
Style["P", Bold],
" del piano un punto ",
Style["P'", Bold],
" tale che ",
"\n",
" - Il segmento PP' abbia la stessa lunghezza del vettore ",
OverVector["v"],
"\n",
"- Il vettore " ,
OverVector[" PP'"],
" abbia la stessa direzione e lo stesso verso del vettore ",
OverVector["v"],""
}]
,"Text", TextJustification -> 1]];


(* Modulo per manipolare l'isometria *)
ModuleIsometryManipulate["Translazione"];
