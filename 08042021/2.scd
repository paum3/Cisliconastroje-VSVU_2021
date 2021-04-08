// 2 ////////////////

// vylepsena verzia ?



//-- inicializacia ----------------------------------------------------//
s.boot; // boot server

// tu nechajte trochu casu
"setup.scd".loadRelative  // cely program je dnu

//---------------------------------------------------------------------//
Tdef(\player1).stop

Tdef(\player1).play



s.meter

~t1 = "A  A  B  a";
//---------- hrame !
// charater zvuku sa meni ppoziciou mysy MouseX

//-----012345679abcde
~t1 = "a b a a d f e " // 7/4 beat
~t1 = "a b a a d f f " // 7/4 beat
~t1 = "a b A a d f G " // 7/4 beat
~t1 = "a b a a d f gf" // 7/4 beat
~t1 = "ijklmnopqrstuv"
~t1 = "abcdefghijklmnopqrstuvwxyz"
~t1 = "abcdefghijklmnopqrstuvwxyz".reverse
~t1 = "abcdefghijklmnopqrstuvwxyz".scramble


~t1 = "   "

~t1 = "A B A Cc"


// skus zmenit synthdef ktory pouziva nas player
(

SynthDef(\sincu, {
	| freq = 100 attack=0.01 release=0.3 amp=0.2 |
	// arg freq = 100, attack=0.01, release=0.3, amp=0.2;

	var env = Env.perc(attack, release).kr(2);

	// toto je 'hlavny' oscilator ( UGen ) zodpovedny za typ zvuku, skus zmenit za iny
	// povodne bol SinOsc,
	var sig = LFTri.ar(
		(freq + [0,0.7]) + SinOsc.ar(MouseX.kr(20,20000)).range(-600,600)
	) * amp *0.3 * env;

	var env_f = LFTri.kr(0.1, iphase: Rand(0,4.0)).range(300, 2600);
	sig = RLPF.ar(sig, freq: SinOsc.ar(4).range(200, env_f), rq: 0.6);
	sig = HPF.ar(sig, 100);
	// sig = Pan2.ar(sig, Rand(-0.4,0.4));
	Out.ar(0, sig * 0.3);
}).add

)


~t1 = " " // ticho
~t1 = "a b a a d fae "
~t1 = "a b a aAd fAe "

~t1 = "a A a A a A "
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
