

/* assets/player1.scd */


(
	~cas1 = 0.1;

	// ~t1 = "a b a a d f e ";
	~t1 = " ";


	Tdef(\player1,{
		loop{
			~t1.do({ |i|
				var a = i.ascii - 96;
				20.do({i.post});
				if(i.ascii != 32, { Synth(\sincu, [\freq, a * 50, \release, 1,\amp, a.reciprocal]) });
				~cas1.wait;
			});
				"".postln;
		}
	});
	Tdef(\player1).play;

)
