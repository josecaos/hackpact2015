////////////////////////////////////
//written by @joseCao5
//HackPact 2015 Dia 2
//juagando con arrays
//la palabra dice la musica atonal
///////////////////////////////////
s.boot;
s.scope(2,0);
(
Tdef(\palabras,{|i|
	var arr,pan,palabra,letra,notas,t,sum;
	i=0;
	palabra = "hackpact 2015";//cambia la palabra o agrega otras y evalua el Tdef
	arr = Array.newClear(palabra.size);
	notas = Pseq(palabra.ascii,inf).asStream;
	t = Pwrand([0.3,0.6,1.2,1.8],[0.4,0.5,0.07,0.03],inf).asStream;
	sum = [24,48,96,192];
	inf.do({
		var l,r,nota;
		letra=palabra.asArray;
		arr.put(i,letra[i]);
		pan=Array.series(21,-1,0.1).choose;
		l=pan;
		if(pan<=0,{r=pan+pan},{r=pan-pan});
		i=i+1;
		nota=notas.next.cpsmidi+92;
		if(i == arr.size,{i=0;"".postln;arr.scramble.join.postln},{".".post});
		Ndef(\s,{Pan2.ar(
			FreeVerb.ar(
				[Blip.ar([nota,nota+sum.choose],6,0.35),
					Blip.ar([nota+sum.choose,nota+sum.choose],12,0.35)]
				,0.99,1,0.01)
			,[l,r]);
		}).play;
		t.next.wait;
	});
});
)
Tdef(\palabras).play;
Tdef(\palabras).stop;
//
s.record;
s.stopRecording;