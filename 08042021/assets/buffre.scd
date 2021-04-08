
(
	~b = List.new;

	PathName.new("alphabet").entries.do({ |f|
		// f.fullPath.postln
		~b.add(Buffer.read(s,f.fullPath) );
	});



)


// ~b.size
// ~b[0].play
