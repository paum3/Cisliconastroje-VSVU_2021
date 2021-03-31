


// setup file pre kurz I.


(

~cas1 = 0.1;
~cas2 = 0.1;

// ~t1 = "a b a a d f e ";
~t1 = " ";
~t2 = " ";

Tdef(\a,{
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


Tdef(\b,{
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



// synth



SynthDef(\sincu, {
	|freq = 100 attack=0.01 release=0.3 amp=0.2|
	var env = Env.perc(attack, release).kr(2);
	var sig = LFTri.ar(freq + [0,0.7]) * amp *0.3 * env;
	var env_f = LFTri.kr(0.1).range(300, 2600);
	sig = RLPF.ar(sig, freq: SinOsc.ar(4).range(200, env_f), rq: 0.6);

	sig = Pan2.ar(sig, Rand(-0.4,0.4));
	Out.ar(0, sig);
}).add












)
