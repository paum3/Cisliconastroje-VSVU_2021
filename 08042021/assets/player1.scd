

/* assets/player1.scd */


(
	~cas1 = 0.1; // defaultne nastavenie

	// ~t1 = "a b a a d f e ";
	~t1 = " ";


	Tdef(\player1,{
		loop{
			~t1.do({ |i|
				var a = i.ascii;
				a.postln;
				// 20.do({i.post});
				if(a >= 96 and: {a <= 122} , {
					Synth(\sincu, [
						\freq, (a - 96) * 100,
						\release, 1,
						\attack, 0,
						\amp, (a -96).reciprocal])
				});
				~cas1.wait;
			});
				"".postln;
		}
	});

	Tdef(\player1).play;

)

// ~cas1
// ~cas1 = 1
// (96..122).asAscii // a - z

// (48..57).asAscii // 0 - 9



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
