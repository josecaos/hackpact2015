////////////////////////////////////
//written by @joseCao5
//HackPact 2015 Dia 2
//juagando con arrays
//la palabra dice la musica
///////////////////////////////////
s.boot;
(
Tdef(\palabras,{|i|
	var arr,acomp,pan,palabra,letra,notas;
	i=0;
	palabra = "hackpact2015";//cambia la palabra y evalua el Tdef
	arr = Array.newClear(palabra.size);
	acomp = {Blip.ar(letra[i].ascii,12,0.2)*EnvGen.ar(Env.perc,1,1,0,1,2)!2};
	notas = Pseq(palabra.ascii.asArray.scramble,inf).asStream;
	inf.do({
		var l,r;
		letra=palabra.asArray.scramble;
		arr.put(i,letra[i]);
		pan=Array.series(21,-1,0.1).choose.postln;
		l=pan;
		if(pan<=0,{r=pan+0.7},{r=pan-0.6});
		i=i+1;
		if(i == arr.size,{i=0;"".postln;arr.join.postln;acomp.play;},{".".post;});
		Ndef(\s,{Out.ar(0,Pan2.ar(FreeVerb.ar(Blip.ar(notas.next.postln,6,0.3),0.99,0.7,0.1),[l,r]))}).play;
		0.3.wait;
	});
});
)
Tdef(\palabras).play;
Tdef(\palabras).stop;