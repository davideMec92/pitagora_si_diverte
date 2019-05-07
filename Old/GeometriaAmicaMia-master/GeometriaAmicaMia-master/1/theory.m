(* ::Package:: *)

(*  Questo testo e' stato generato in mathematica  (anziche' essere importato da un file txt) 
per inserire dei tooltip in mezzo al testo *)
Print[TextCell[
Row[{
"Si chiama trasformazione geometrica una  ",
Tooltip[Style[" corrispondenza biunivoca ", "Text", Brown, Bold],
"Una corrispondenza biunivoca \[EGrave] una funzione iniettiva e suriettiva", 
TooltipStyle -> {Background -> RGBColor[1, 1, 0.85], 
CellFrameColor -> Red, CellFrame -> 2, CellFrameMargins -> 20, 
TextAlignment -> Center}
],
"che associa a punti del piano, punti dello stesso piano.",
"\n",
"Una trasformazione geometrica si chiama isometria quando, comunque scelti due punti ",
Style["A e B del piano", Bold],
", se ",
Style["A' e B'", Bold],
" sono i punti ottenuti da ",
Style["A e B", Bold],
" applicando tale trasformazione geometrica, il segmento ","A'B'"," risulta congruente al segmento ",
Style["AB", Bold],
"."}]
,"Text", TextJustification -> 1]];
