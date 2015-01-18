////////////////////////////////////
//written by @joseCao5
//HackPact 2015 Dia 5
//SCtweet 17 enero 2015
///////////////////////////////////
s.boot;
s.scope;
//
fork{loop{play{a=Array.series(12,82,120).choose;Klang.ar(`[ [a, a*0.7, a*0.4],[0.3, 0.2, 0.2]])*EnvGen.ar(Env.perc,1,1,0,1,2)!2};0.2.wait}};
//140
s.record;
s.stopRecording;