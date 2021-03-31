s.boot;

"setup.scd".loadRelative



Tdef(\a).play

//-----012345679abcde
~t1 = "a b a a d f e "
~t1 = "ijklmnopqrstuv"
~t1 = " "
~t1 = "a b a a d f e "

// .. a pridam druhu vrstvu
Tdef(\b).play

~t2 = "sss uuu ppp eee rrr ccc ooo lll iii ddd eee rrr "



Tdef(\a).stop



~t2 = " aba          "
~t2 = "babababacacabb"
~t2 = "babababacacabx"
~t2 = "baba af cacabx"
~t2 = " aba af c c bx" ++ " aba af c c by"
~t2 = " " // nikdy nie uplne prazdne, nedolonaly algo...

Tdef(\a).stop

~t2 = " aba    h     "

~cas2 = 0.2

Tdef(\b).stop
