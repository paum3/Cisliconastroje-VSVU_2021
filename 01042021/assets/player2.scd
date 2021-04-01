
/* assets/player2.scd */

(



~t2 = " ";
~cas2 = 0.1;
Tdef(\player2,{
	loop{
		~t2.do({ |i|
			var a = i.ascii - 96;
			20.do({i.post});
			if(i.ascii != 32, { Synth(\sincu, [\freq, a * 50, \release, 1.8, \attack, 0.05,\amp, a.reciprocal ]) });
			(~cas2*2).wait;
		});
			"".postln;
	}
});
Tdef(\player2).play;





)
