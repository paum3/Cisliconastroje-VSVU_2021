


//   Synteza

sinus
filter
attack
-------------------------
 SIGNAL

 SIGNAL ------>  FILTER   ------> AMPLIFIER

 SIGNAL ------>  FILTER  ----> ENVELOPE ------> AMPLIFIER

 SIGNAL ------>  MODULATORY --->  FILTER  ----> ENVELOPE ------> AMPLIFIER

 ------------------------------------------------------------------------
 1.aditivna
 2.subtraktivna
 3.granularna
 4.pulzna
 5.FM / PM
 6.AM
 ------------------------------------------------------------------------
 s.boot

 ADITIVNA SYNTEZA

 FreqScope.new(500, 300);

 {SinOsc.ar(440,0, 0.4) ! 2} .play

 {SinOsc.ar(440,0, 0.2) + SinOsc.ar(880, 0, 0.1)!2}.play


 Env([0,1,0], [0.5,2], [-5,5]).plot


 (
	 {
		 var sig = LFSaw.ar(1000);
		[
			sig,
			sig * Env([0,1,0], [0.5,2], [-5,5]).kr(2)
		]
	}.plot(3)

)


 (
	SynthDef(\elecorgan, {
		arg freq=200, attack=0.1, release=0.1, amp=0.5;
        var env = Env([0,1,0], [attack,release], [2,-4]).kr(2);
		var sig = SinOsc.ar(freq * 1, mul: 1) +
				  SinOsc.ar(freq * 2, mul: 0.5) +
				  SinOsc.ar(freq * 3, mul: 0.2) +
				  SinOsc.ar(freq * 4, mul: 0.1);
		sig = sig * env * amp;
		Out.ar(0,sig ! 2);
	} ).add

 )

Synth(\elecorgan)

(
	Pbindef(\a,
		\instrument, \elecorgan,
		\degree, Pseq([1, 5, 3, 1, 6, 2, 5, 0, 3, 0, 2], inf),
		\attack, 0.05,
		\release, 0.3,
		\dur, 0.2
	).play;
)

Pbindef(\a).stop;








/////////////////////////////////////////////////////



 (
	SynthDef(\elecorgan2, {
		arg freq=200, attack=0.1, release=0.1, amp=0.5;
        var env = Env([0,1,0], [attack,release], [2,-4]).kr(2);
		var sig = SinOsc.ar(freq * 1, mul: 1) +
				  LFSaw.ar(freq * 2, mul: 0.2) +
				  LFTri.ar(freq * 3, mul: 0.2) +
				  PinkNoise.ar(0.5);
		sig = sig * env * amp;
		Out.ar(0,sig ! 2);
	} ).add

 )


(
	Pbindef(\a,
		\instrument, \elecorgan2,
		\degree, Pseq([1, 5, 3, 1, 6, 2, 5, 0, 3, 0, 2], inf),
		\attack, 0.06,
		\release, 0.9,
		\dur, 0.2
	).play;
)

Pbindef(\a).stop;

https://www.youtube.com/watch?v=muCPjK4nGY4&t=1s
