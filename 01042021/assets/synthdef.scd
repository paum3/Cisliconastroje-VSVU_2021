// Env.perc(0.1,2).plot
// {SinOsc.kr(10)}.plot(3)
// {SinOsc.kr(10) * Env.perc(0.1,2).kr(2)}.plot(3)


/* asstes/synthdef.scd */
Tdef(\player1).stop
Tdef(\player1).play
(

SynthDef(\sincu, {
	| freq = 100 attack=0.01 release=0.3 amp=0.2 |
	// arg freq = 100, attack=0.01, release=0.3, amp=0.2;

	var env = Env.perc(attack, release).kr(2);

	var sig = SinOsc.ar(
		(freq + [0,0.7]) + SinOsc.ar(MouseX.kr(20,20000)).range(-600,600)
	) * amp *0.3 * env;

	var env_f = LFTri.kr(0.1, iphase: Rand(0,4.0)).range(300, 2600);
	sig = RLPF.ar(sig, freq: SinOsc.ar(4).range(200, env_f), rq: 0.6);
	sig = HPF.ar(sig, 100);
	sig = Pan2.ar(sig, Rand(-0.4,0.4));
	Out.ar(0, sig * 0.6);
}).add

)


// Synth(\sincu)

// Synth(\sincu, [ \amp, 0.4, \freq, 300  ] )
// Synth(\sincu, [ \amp, 0.4, \freq, 300, \attack, 1.5  ] )
// Synth(\sincu, [ \amp, 0.4, \freq, 300, \release, 8.5  ] )

// Synth(\hammond)

// (

//  Synth(\sincu, [ \amp, 0.4, \freq, 300, \release, 8.5  ] );
//  Synth(\sincu, [ \amp, 0.4, \freq, 300.rand, \release, 8.5  ] );

// )
