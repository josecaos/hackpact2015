////////////////////////////////////
//written by @joseCao5
//HackPact 2015 Dia 5
//SCtweet 17 enero 2015
///////////////////////////////////

fork{loop{plKlang.ar(`[ [800, 1000, 1200],[0.3, 0.3, 0.3],[pi,pi,pi]], 1, 0)*EnvGen.ar(Env.perc,1,1,0,1,2) };0.5.wait};}
Help.gui;