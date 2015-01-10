////////////////////////////////////
//written by @joseCao5
//HackPact 2015 Dia 2
//Jugando con arrays
///////////////////////////////////
s.boot;
(
Task({|i|
	var arr,palabra,letra;
	i=0;
	palabra = "hackpact2015";
	arr = Array.newClear(palabra.size);
	inf.do({
		letra=palabra.asArray.scramble;
		arr.put(i,letra[i]);
		i=i+1;
		if(i == arr.size,{i=0;"".postln;arr.join.postln},{".".post;});
		Ndef(\sonidito,{SinOsc.ar(letra[i].ascii,0,0.2)*Envgen.ar(Env.perc(0.01,0.1),1)});
		0.125.wait;
	});
}).play;
)