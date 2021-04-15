


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


// speaking piano
https://www.youtube.com/watch?v=muCPjK4nGY4&t=1s



--------------------------------------------------------------------------------
SUBTRAKTIVNA

SIGNAL ----> FILTER



{WhiteNoise.ar(1) * EnvGen.ar(Env.perc(0.001,0.1), doneAction:2)!2}.play

(
	{
		LPF.ar(   WhiteNoise.ar(1), MouseX.kr(50,3000)    )
		* EnvGen.ar(Env.perc(0.001,0.1), doneAction:2) !2

	}.play
)


/// SC TWEETS
// http://sccode.org/1-5eN#c958
{a=LocalIn.ar;LocalOut.ar(Mix.ar(x=SinOsc.ar((Decay.ar(Impulse.ar([4,4.005]),1e3*a.abs)*50), a).distort));x;}.play;//tryingharder_to_noavail

{f=LocalIn.ar(2).tanh;k=Latch.kr(f[0].abs,Impulse.kr(0.5));LocalOut.ar(f+AllpassN.ar(Pulse.ar([2,3],k*0.01+1e-6,0.9),1,k*0.3,100*k));f}.play


play{f=LocalIn.ar(2).tanh;k=Latch.kr(f[0].abs,Impulse.kr(1/4));LocalOut.ar(f+CombC.ar(Blip.ar([4,6],100*k+50,0.9),1,k*0.3,50*f));f}//44.1kHz
Pspawner({|r|f={|t|r.par(Pbindf(Pbind(\note,Pseq([-1,1,6,8,9,1,-1,8,6,1,9,8]+5,319)),\dur,t))};f.(1/6);r.wait(12);f.(0.1672)}).play//s.reich
play{t=Impulse.ar(75);Sweep.ar(t,150).fold(0,1)*PlayBuf.ar(1,Buffer.read(s,"s*/*".pathMatch[2]),1,t,Demand.ar(t,0,Dbrown(0,2e5,2e3,inf)))!2}
play{f={LocalBuf(512)};r={|k,m|RecordBuf.ar(Pulse.ar(8,m,6e3),k)};r.(a=f.(),0.99);r.(b=f.(),0.99001);Out.ar(0,IFFT([a,b]).tanh)};//44.1kHz:)
play{AllpassC.ar(SinOsc.ar(55).tanh,0.4,TExpRand.ar(2e-4, 0.4,Impulse.ar(8)).round([2e-3,4e-3]),2)};// #supercollider with bass please...
play{Mix({a=LFNoise1.ar(0.2.rand);DelayC.ar(BPF.ar(WhiteNoise.ar(Dust2.ar(a*a*4**2).lag(8e-3)),10e3.rand+300,0.09),3,a*1.5+1.5,45)}!80).dup}
play{a=BPF.ar(Saw.ar([40,40.001]),LFNoise0.kr(128)+1*4e3+146,LFNoise1.kr(1)+1*5e-2+0.01).tanh;CombC.ar(a,9,a.abs.lag(2)*9,a.abs.lag(1)*100)}
play{LocalOut.ar(x=DelayC.ar(LPF.ar(LFNoise0.ar(8)**2+LocalIn.ar(2).tanh.round(0.05),6e3),1,LFNoise0.ar(8!2).range(1e-4,0.02)));x.tanh}//#sc
play{t=Impulse.ar(8)*LFNoise1.ar(2);CombL.ar(Saw.ar([3,4],Decay.ar(t,0.1)).tanh,1,TRand.ar(0,0.01,t).round(15e-4),TRand.ar(-30,30,t))};//#sc
play{LocalOut.ar(x=LFNoise1.ar(0.5*LocalIn.ar(1)+0.1,0.5,0.5));PitchShift.ar(PitchShift.ar(Pulse.ar([90,90.01],x),10,x*4,x),10,4-(x*4),1-x)}
play{q=[0,3,5,7,10];t=Impulse.kr(4)*LFNoise0.kr>0;PitchShift.ar(Saw.ar(Demand.kr(t,0,Drand((q+12++q+33).midicps,inf)),Decay.kr(t,3)),7,2)!2}
play{(HPF.ar(LFNoise1.ar(2),[10,10.1])*100).tanh}// #supercollider yay! (be very careful with this one, very loud)
play{t=[0,3,5,7,10,12]+30;a=Demand.kr(Impulse.kr(8),0,Drand(t+24++t,inf));(BHiPass.ar(LFNoise1.ar(8)**3,[a,a+0.2].midicps,a/2e3,67-a)).tanh}
play{t=[0,0,0,1,5,7,10,12,12,12]+30;a=Duty.kr(1/8,0,Dxrand(t+24++t++t,inf));(BHiPass.ar(LFNoise1.ar(8)**6,[a,a+7].midicps,a/3e3,67-a)).tanh}
play{LeakDC.ar(BRF.ar(Saw.ar(8,Decay2.kr(x=Duty.kr(1/8,0,Drand([0,Drand((0.4,0.5..1))],inf)),0.01,0.3))**1.5,x*20+[45.1,45],0.1)).tanh}//#sc
play{t=Impulse.kr(1/4);k=Duty.kr(2,0,Dxrand((50,52..90),inf));r={|a|Saw.ar(TIRand.kr(1,6,t),a+1*3)}!3;BPF.ar(r.sum,[k,k+0.5],1/9,50).tanh}
play{Mix({|k|k=k+1/2;2/k*Mix({|i|i=i+1;Blip.ar(i*XLine.kr(rand(2e2,4e2),87+LFNoise2.kr(2)*k,15),2,1/(i/a=XLine.kr(0.3,1,9))/9)}!9)}!40)!2*a}
play{t=[0,3,5,7,10,12]+40;p=Duty.ar(1/4,0,Drand((t+12++t).midicps,inf));Blip.ar([b=TRand.ar(1500,2e3,Impulse.ar(16)).lag,b+p],1).mean!2**2}
play{n=LFNoise0.kr(_);v=Blip.ar([2e4,2e4-9],1,n.(16)*0.5+0.5**9);42.do{v=LeakDC.ar(AllpassC.ar(v,1,n.(5)*5e-2+(5e-2+1e-3),100))};tanh(v*99)}
play{Mix(HPF.ar(MidEQ.ar(Limiter.ar(GVerb.ar(HPF.ar(Pulse.ar([[0.1,0.11],[0.12,0.13]],0.6,5e-3),99),[[1,5/4],[1.5,2]],99)),9e3,0.9,9),200))}
{r=44100;BufRd.ar(1,Buffer.read(s,"s*/*".pathMatch[2]),[r,r+500]*LFNoise0.ar(8,9,9)+(Sweep.ar(t=Impulse.ar(8),r)%TRand.ar(100,r/2,t)))}.play
play{i=Impulse.ar(_);SinOsc.ar(i.(2).lagud(0,0.4)*360,Integrator.ar(Integrator.ar(i.(64).lag(LFNoise1.ar(2!2,2,2))*99,0.9),0.99).fold2(pi))}
play{Splay.ar(Integrator.ar(LFNoise0.ar(5!3,k=Duty.ar(6.4,0,Dseq([0.05,Drand([0.04,0.08],1)],inf))).round(k/10)).sin.sqrt.tanh,0.3)}//#sc...
play{LocalOut.ar(k=LeakDC.ar(Integrator.ar(Pulse.ar(pi/[1,2.57],[0.54,0.46]),(1-LocalIn.ar(2)).fold(0,[0.9,0.85])).wrap2(pi).sin));k.mean!2}
{n=LFNoise0.ar(_);f=[60,61];tanh(BBandPass.ar(max(max(n.(4),l=n.(6)),SinOsc.ar(f*ceil(l*9).lag(0.1))*0.7),f,n.(1).abs/2)*700*l.lag(1))}.play
play{LocalOut.ar(k=tanh(500*(PinkNoise.ar(1!2)**(8/(LagUD.ar(y=LocalIn.ar(2).range(0, 0.9)+0.1,0,0.2))))));Splay.ar(k,1-y)}
play{i=Impulse.ar(8).lag(0.3)!2;10.do{i=LeakDC.ar(AllpassC.ar(i,1,LFNoise0.ar(8).range(1e-5,0.2),-0.15,LFNoise0.ar(8).range(1,3))).tanh};i}
play{n=LFNoise0.kr(*_);v=Blip.ar([60,61],5,n.(4)**8);12.do{v=LeakDC.ar(CombC.ar(v,1,n.([1,0.05,0.06]).lag(5e3),9))};Limiter.ar(v,0.9,1)}
play{Blip.ar([16e3,16150],2,LFTri.ar(Duty.ar(LFNoise0.ar(0.2,4,6),0,Dseq([70,30,0],inf))).clip(0,1))}//#supercollider_summer



by 'block'

{SinOsc.ar(65.41,0,(SinOsc.kr(0.5, 0,0.5)))+SinOsc.ar(130.81,0,(SinOsc.kr(10,0,0.5)))+SinOsc.ar(523.25,0,(SinOsc.kr(0.05,0,0.05)))}.play;//b


//////////////////////////////
// https://raw.githubusercontent.com/supercollider/supercollider/develop/examples/pieces/spacelab.scd
