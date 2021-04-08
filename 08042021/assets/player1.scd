

/* assets/player1.scd */


(
	~cas1 = 0.1; // defaultne nastavenie

	// ~t1 = "a b A a d f e ";
	// ~t1 = "A  A  B  a";
	~t1 = " ";


	Tdef(\player1,{
		loop{
			~t1.do({ |i|
				var a = i.ascii;

				if(a >= 97 and: {a <= 122} , { // male pismena = sample
					Synth(\sp_mono, [\buf, ~b[a-97], \amp, 0.05 ] );
				});

				if(a >= 65 and: {a <= 90} , { // velke pismena = synth
					Synth(\sincu, [
						\freq, (a - 64) * 100,
						\release, 1,
						\attack, 0,
						\amp, (a - 64).reciprocal])


				});

				~cas1.wait;
			});
		}
	});

	Tdef(\player1).play;

)

// ~cas1
// ~cas1 = 1
// (97..122).asAscii // a - z

// (48..57).asAscii // 0 - 9

// (65..90).asAscii // A - Z


// (
// Tdef(\player1,{
// 		loop{

// 			100.rand.postln;
// 			 ~cas1.wait;
// 			 // 1.wait;
// 		}
// });
// )


// 	Tdef(\player1).play
// 	Tdef(\player1).stop

// 	~cas1 = 0.1


// 	\ahoj.class
// 	222
// 	"string"



// 	"andras".class // String
// 	"andras".do(   { |c| c.ascii.postln      }    )

// 	"a".ascii // 97
// 	"b".ascii // 98
// 	" ".ascii // 32


// 	~t1.do({ |i|
// 				var a = i.ascii - 96;
// 				20.do({i.post});
// 				if(i.ascii != 32, { Synth(\sincu, [\freq, a * 50, \release, 1,\amp, a.reciprocal]) });
// 				~cas1.wait;
// 			});
