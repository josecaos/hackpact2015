////////////////////////////////////
//written by @joseCao5
//HackPact 2015 Dia 3
//paisaje acido hindu
///////////////////////////////////
s.boot;
s.record;
s.stopRecording;
~escala=Scale.indian;
~int=~escala.as(Array);//intervalo
~ton=48;//tonica
~notas=[~ton,~ton+~int[1],~ton+~int[2],~ton+~int[3],~ton+~int[4],~ton+12,~ton+~int[1]+12,~ton+~int[2]+12,~ton+~int[3]+12,~ton+~int[4]+12];
~notas2=[~ton,~ton+~int[2],~ton+~int[3],~ton+~int[4]];
~ritmo=[0.25,0.25,0.5,0.5,0.5,0.25,0.25,0.25,0.25];
~melodia=Ndef(\pasaje).play;
~basso=Ndef(\ostinato).play;
(
~melodia[0] = {|nota,filt,fimp|
	var osc1,osc2,phas,phas2;
	phas=Phasor.kr(Impulse.kr(fimp),1,220,2940);
	phas2=Phasor.kr(Impulse.kr(fimp),1,2940,220);
	osc1=CombN.ar(Blip.ar(nota.midicps,12,0.15),0.1,0.02,1.2);
	osc2=RLPF.ar(Pulse.ar(nota.midicps,0.5,0.125),phas,0.15);
	FreeVerb2.ar(osc2,osc1,0.2,1,0.05);
};
~melodia[1] = \set -> Pbind(\dur, Pseq(~ritmo*8,inf), //<-cambia el tiempo de las duraciones
	\nota, Pxrand(~notas,inf),
	\filt, Pseq([220,440,880],inf),
	\fimp, Prand([1,2,4,8],inf)
);
);
//bajo
(
~basso[0] = {|nota,rythm|
	var osc1,osc2,phas;
	phas=Phasor.kr(Impulse.kr(1),1,120,440);
	osc1=SinOsc.ar(nota.midicps,0.2,0.35);
	osc2=LFTri.ar(nota.midicps,0.4,0.4);
	Pan2.ar(Resonz.ar(osc2+osc1,phas,rythm),[-1,0.98]);
};
~basso[1] = \set -> Pbind(\dur, Pseq(~ritmo*32,inf),
	\nota, Pxrand(~notas2,inf),
	\rythm, Pwrand([0.2,0.5,1],[0.23,0.43,0.33],inf)
);
);
//
~melodia.stop(4);
~basso.stop(4);