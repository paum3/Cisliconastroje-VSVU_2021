// Env.perc(0.1,2).plot
// {SinOsc.kr(10)}.plot(3)
// {SinOsc.kr(10) * Env.perc(0.1,2).kr(2)}.plot(3)


/* asstes/synthdef.scd */
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
	Out.ar(0, sig * 0.6);
}).add;




SynthDef.new(\sp_mono,{
      arg buf, out = 0, loop = 0, start = 0, len = 1, rate = 1, amp = 1, pan = 0, atk = 0.01, rel = 0.01 ;
      var sig, env;
      start = start * BufFrames.kr(buf);

      len = len * BufFrames.kr(buf) / 44100;
      env = EnvGen.kr( Env( [0,1,1,0], [atk, len ,rel], [3,0,-3] ) , doneAction:2);
      sig = PlayBuf.ar(2, buf, BufRateScale.kr(buf) * rate,startPos:start, loop:loop, doneAction:2);

      sig = sig * env * amp;
	  Out.ar(out, Pan2.ar(sig, pan) );
}).add;



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
