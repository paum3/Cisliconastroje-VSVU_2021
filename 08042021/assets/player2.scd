
/* assets/player2.scd */

(
	~t2 = " ";
	~cas2 = 0.1;

	Tdef(\player2,{
				loop{
					~t2.do({ |i|
				var a = i.ascii;
				// a.postln;
				// 20.do({i.post});
				if(a >= 97 and: {a <= 122} , {
					Synth(\sincu, [
						\freq, (a - 96) * 100,
						\release, 1,
						\attack, 0,
						\amp, (a -96).reciprocal])
				});
				if(a >= 65 and: {a <= 90} , {
					Synth(\sincu, [
						\freq, (a - 64) * 100,
						\release, 1,
						\attack, 0,
						\amp, (a - 64).reciprocal * 2])

				});

				~cas1.wait;
			});
		}
	});


	Tdef(\player2).play;




)
