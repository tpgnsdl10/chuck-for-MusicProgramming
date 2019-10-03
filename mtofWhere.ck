TriOsc s => dac;
TriOsc t => dac;
TriOsc u => dac;


0.0 => u.gain;

1.0 => float onGain;
0.0 => float offGain;

0.5 :: second => dur q;
0.8 :: second => dur h;
0.1 :: second => dur rest;
0.25 :: second => dur e;


[53, 55, 57, 53, 53, 55, 57, 53,
 57, 58, 60, -1,
 57, 58, 60, -1,
 60, 62, 60, 58, 57, 53,
 60, 62, 60, 58, 57, 53,
 53, 48, 53, -1,
 53, 48, 53, -1] @=> int whereNotes1[];
 
[-1, -1, -1, -1, -1, -1, -1, -1,
 -1, -1, -1, -1,
 -1, -1, -1, -1,
 -1, -1, -1, -1, -1, -1,
 -1, -1, -1, -1, -1, -1,
 57, 52, 57, -1,
 57, 52, 57, -1] @=> int whereNotes2[];
 
[41, 52, 41, 41, 41, 52, 41, 41,
 41, 52, 41, -1,
 41, 52, 41, -1,
 41, 41, 52, 52, 41, 41,
 41, 41, 52, 52, 41, 41,
 41, 52, 41, -1,
 41, 52, 41, -1] @=> int whereNotes3[];
 

 

[q, q, q, q, q, q, q, q, 
 q, q, h, e,
 q, q, h, e,
 e, e, e, e, q, q,
 e, e, e, e, q, q, 
 q, q, q, e,
 q, q, q, e] @=> dur whereDurs1[];
 
for( 0=> int i;  i< whereNotes1.cap(); i++)
{
    if (whereNotes1[i] == -1){
        0 => s.gain;
        0 => t.gain;
        0 => u.gain;
        
    }
    else{
        Std.mtof(whereNotes1[i]) => s.freq;
        onGain => s.gain;
        Std.mtof(whereNotes2[i]) => t.freq;
        onGain => t.gain;
        Std.mtof(whereNotes3[i]) => u.freq;
        onGain => u.gain;
        
         
    }
    whereDurs1[i] => now;
    offGain => s.gain;
    
}




 
 
 
 
 
 