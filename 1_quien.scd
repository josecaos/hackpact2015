////////////////////////////////////
//Dia 1
//Gran boton rojo para seleccionar
//Quien abre la puerta y no pelear
//+ track
///////////////////////////////////
s.boot;
(
~equipo=['Chucho','LAAD','Ricado','Fabricio','Gaby','Cesar','Josecaos','Pech','Karla','el fantasma'];
~norepite=Array.newClear(1);
~norepite.put(0,"No hay selecciones anteriores!");
Tdef(\seq,{
	var nota = Prand(Array.series(30,32,3),inf).asStream,notas;
  var t=[0.5,0.25];
	inf.do({
	  f=[0,1].choose;
		notas=nota.next.midicps;
	  if(f==0,{{EnvGen.ar(Env.perc(0.01,2),1,doneAction:2)*Blip.ar(XLine.kr(notas,notas-3,2),4,0.5)}.play;},
		    {{EnvGen.ar(Env.perc(0.01,0.5),1,doneAction:2)*GVerb.ar(Blip.ar(Line.kr(notas,notas+1,0.5),100,0.5),12,1,0.05,)}.play;});
	  "feliz 2015".scramble.post;
		t.choose.wait;
		});
	});
~w=Window("Quien abre la puerta???",Rect(200,200,300,300),false).front;
~b=Button(~w,Rect(10,10,280,250));
~b.states_([["Selecciona quien abre la puerta",Color.fromHexString("#000"),Color.fromHexString("#ff0000")]]);
~b.action={|val|
	val=~equipo.scramble.choose;
	if(~norepite[0]==val.value,{("Se ha repetido el nombre: " ++ val.value ++ "!!!!").postln;
		~norepite.put(0,val.value);val=~equipo.rotate(1).choose;
		{var nota = TChoose.kr(Impulse.kr(1),Array.series(88,36,1).midicps);
			EnvGen.ar(Env.perc(0.01,3),1,doneAction:2)*Blip.ar(Line.kr(nota,nota-3,1.5),4)}.play;},
		{("He seleccionado a: " ++ val.value ++ "\n espera...").postln;});
	1.do({
		("Quien abrio antes?: " ++ ~norepite[0]).postln;
		("Entonces quien abre la puerta es: " ++ val).postln;
		{var nota = TChoose.kr(Impulse.kr(1),Array.series(88,36,1).midicps);
			EnvGen.ar(Env.perc(0.01,0.5),1,doneAction:2)*GVerb.ar(Blip.ar(Line.kr(nota,nota+1,0.5),100),12,1,0.05)}.play;
		"/\/\/\/\/\/\/\/\/\/\/\/\break/\/\/\/\/\/\/\/\/\/\/\/\/\/\/".postln;
	});
	~norepite.put(0,val.value);
    };
~b2=Button(~w,Rect(10,260,280,20));
~b2.states_([["play bonus track",Color.fromHexString("#FFF"),Color.fromHexString("#222222")],
	["stop bonus track",Color.fromHexString("#FFF"),Color.fromHexString("#555555")]]);
~b2.action={|val|
	if(val.value==1,{Tdef(\seq).play;},{Tdef(\seq).stop;});
	}
);
//
s.record;
s.stopRecording;