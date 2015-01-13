////////////////////////
//written by @joseCao5
//HackPact 2015 Dia 4
//Esto iba a ser un
//Requiem para el metal
////////////////////////
s.waitForBoot{
	(
		SynthDef(\timbre, {|nota,trig,att,rel,del,gate|
			var osc,osd,env;
			osc=SyncSaw.ar(XLine.kr(nota,nota+432,0.1),Phasor.kr(Impulse.kr(trig/2),1,100,MouseX.kr(101,1000)), 0.1);
			osd=SyncSaw.ar(Line.kr(nota,nota+120,0.1),Phasor.kr(Impulse.kr(trig/4),1,100,MouseY.kr(1001,10000)), 0.07);
			env=EnvGen.ar(Env.perc(att,rel),gate,doneAction:2);
			Out.ar(0,Pan2.ar(AllpassC.ar((osc+osd)*env,0.25,del,1),[0.9,-0.8]));
		}).add;
	);
//
	(
		Tdef(\mods,{|i|
			var e,tono,inter,z,rit,tiempo,del;
			e=Scale.yakah.as(Array);
			tono=36;
			inter=[tono,tono+e[1],tono+e[2],tono+e[3],tono+e[4],tono+e[5],tono+e[6]].midicps;
			z=Prand([Pxrand(inter,1),Pxrand(inter+24,1)],inf).asStream;
			rit=Pxrand(Array.series(7,1,3),inf).asStream;
			del=Prand(Array.series(12,0.01,0.03)).asStream;
			tiempo=Array.series(3,0.25,0.25);
			inf.do({
				var x;
				x=Synth(\timbre);
				x.set(\att,del.resume,\rel,rit/11,\gate,1);
				x.set(\nota,z.resume,\trig,rit.resume,\del,del.resume);
				if(i==7,{i=0},{i=i+1});
				tiempo.choose.wait;
			});
		});
	);
	Tdef(\mods).play;
}.scope(2,0,zoom:2);
Tdef(\mods).stop(8);
//