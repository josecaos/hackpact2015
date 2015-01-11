////////////////////////////////////
//written by @joseCao5
//HackPact 2015 Dia 3
//
///////////////////////////////////
s.boot;
~escala=Scale.indian;
~int=~escala.as(Array);//intervalo
~ton=48;//tonica
~notas=[~ton,~ton+~int[1],~ton+~int[2],~ton+~int[3],~ton+~int[4],~ton+12,~ton+~int[1]+12,~ton+~int[2]+12,~ton+~int[3]+12,~ton+~int[4]+12];
(
Ndef(\pasaje).play;
Ndef(\pasaje)[0] = {|nota|
	var osc1,osc2;
	osc1=LFTri.ar(nota.midicps,0,0.5);
	osc2=LFTri.ar(nota.midicps+3,0,0.5);
	FreeVerb2.ar(osc2,osc1,0.3,1,0.05);
};
Ndef(\pasaje)[1] = \set -> Pbind(\dur, Pseq([0.25,0.25,0.5,0.5,0.5,0.25,0.25,0.25,0.25],inf),
	\nota, Pxrand(~notas,inf));
Ndef(\pasaje)[2] = \set -> Pbind(\dur, Pseq([1,2],inf),
	\nota, Pxrand(~notas,inf));
);
//
Scale.indian.as(Array).postln;
Scale.melodicMinor.degrees;
Scale.directory;
s.scope(2,0);
Help.gui;
s.quit;
TempoClock.tempo=10/60;