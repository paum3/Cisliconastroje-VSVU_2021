




s.boot; // boot server

"setup.scd".loadRelative  // cely program je dnu


~cas1 = 0.1



~a = "kdflkjgl  ";
~b = " i i i i i ";

~a ++ ~b

~t1 = ~a ++ ~a ++ ~b // concatenation
~t1 = ~a ++ ~b  ++ ~b // concatenation

~t1 = "dlkfjg  " ++ "dfkjl "

String

~t1 = "i"
//-----012345679abcde
~t1 = "a b a a d f e " // 7/4 beat
~t1 = "ijklmnopqrstuv"
~t1 = "abcdefghijklmnopqrstuvwxyz".scramble
~t1 = " " // ticho
~t1 = "a b a a d fae "
~t1 = "a b a aad fae "

~t1 = "a r a aad fae "

~t1 = "b sadfl hp dfasidhf odif  "

~cas1 = 0.1






Tdef(\player1).stop

Tdef(\player1).play

// .. a pridam druhu vrstvu
~t2 = " aba          "
~t2 = "babababacacabb"
~t2 = "babababacacabx"
~t2 = "baba af cacabx"
~t2 = "          c bx" ++ "            by"
~t2 = " aba af c c bx" ++ " aba af c c by"
~t2 = " " // nikdy nie uplne prazdne, nedolonaly algo...

Tdef(\player1).stop

~t2 = " aba    h     "

~cas1 = 0.1
~cas2 = 0.2

Tdef(\player2).play
Tdef(\player2).stop







Tdef(\player1).stop
Tdef(\player2).stop

Tdef(\player1).play
Tdef(\player2).play
