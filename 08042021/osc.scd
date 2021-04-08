










	NetAddr.langPort // 57120
	IP ?

	// win
	// 1. spustit prikazovy riadok (cmd)
	// 2. v nom napisat prikaz ipconfig
	// 3. prikaz vypise aktualne nastavenia siete a medzi nimi aj IP adresu napr. 192.168.1.2

	// mac
	// system preferences -> wifi


	OSCFunc.trace(true)
	s.quit

	OSCFunc.trace(false)

	//OSCdef(\meno, {},'adresabuttonu' )
(
	OSCdef(\modry, {
		"nesnezi".scramble.postln;
	}, '/1/push1')
)

s.boot

(
	OSCdef(\modry, {

		Synth(\sincu, [
			\freq, 100.rand + 100,
			\amp, -1.dbamp,
			\attack, 2,
			\release, 2
		] );

	}, '/1/push1')

)

(
	OSCdef(\modry, { arg msg;
		// msg.postln; // Array
		// msg.class.postln;
		// msg[0].postln;
		// msg[1].postln;
		if(msg[1]==1.0, {
			Synth(\sincu, [
					\freq, 100.rand + 100,
					\amp, -1.dbamp,
					\attack, 2,
					\release, 2
				] );
		})

	}, '/1/push1')
)
