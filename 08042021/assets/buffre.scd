
// buffre.scd //


(


	~b = List.new; // globalna premenna

	PathName.new("alphabet").entries.do({ |f|
		// f.fullPath.postln
		~b.add(
			Buffer.read(s,f.fullPath)
		);
	});



)


// ~b.size
// ~b[1].numFrames
// ~b[1].numChannels
// ~b[1].plot



// ~b[0].play



// (
// Ndef(\a,  {
// 	PlayBuf.ar(
// 				numChannels: 2,
// 				rate: SinOsc.kr(0.1).range(0.8,0.9),
// 				bufnum: ~b[9],
// 				loop: 1)
// 		* 0.1
// 	}  ).play
// )


// arg buf, loop = 0, start = 0, len = 1, rate = 1, amp = 1, pan = 0, atk = 0.01, rel = 0.01 ;

// Synth(\sp_mono, [\buf, ~b[17], \amp, 0.5, \start, 0, \len, 0.5 ] )
