

s.boot; // boot server

"setup.scd".loadRelative




//-----012345679abcde
~t1 = "a b a a d f e "
~t1 = "ijklmnopqrstuv"
~t1 = " " // ticho
~t1 = "a b a a d fae "
~t1 = "a b a aad fae "


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

~cas2 = 0.1
~cas2 = 0.2

Tdef(\player2).play
Tdef(\player2).stop
