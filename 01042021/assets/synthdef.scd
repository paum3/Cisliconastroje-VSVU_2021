


/* asstes/synthdef.scd */

(

SynthDef(\sincu, {
	|freq = 100 attack=0.01 release=0.3 amp=0.2|
	var env = Env.perc(attack, release).kr(2);
	var sig = LFTri.ar(freq + [0,0.7]) * amp *0.3 * env;
	var env_f = LFTri.kr(0.1, iphase: Rand(0,4.0)).range(300, 2600);
	sig = RLPF.ar(sig, freq: SinOsc.ar(4).range(200, env_f), rq: 0.6);
	sig = HPF.ar(sig, 100);
	sig = Pan2.ar(sig, Rand(-0.4,0.4));
	Out.ar(0, sig * 0.6);
}).add

)
