TriOsc s => dac;

0.25 :: second => dur q;
0.55 :: second => dur h;
0.1 :: second => dur rest;
0.1 :: second => dur e;
1.0 => float onGain;
0.0 => float offGain;

1.0 => s.gain;

[67, 67, 69, 69, 67, 67, 64, -1,
 67, 67, 64, 64, 62, -1,
 67, 67, 69, 69, 67, 67, 64, -1,
 67, 64, 62, 64, 60] @=> int schoolBellNotes[];

[q, q, q, q, q, q, h, e,
 q, q, q, q, h, e,
 q, q, q, q, q, q, h, e,
 q, q, q, q, h] @=> dur schoolBellDurs[];
 
 
 for( 0=> int i;  i< schoolBellNotes.cap(); i++)
 {
     if (schoolBellNotes[i] == -1){
         0 => s.gain;
         
     }
     else{
         Std.mtof(schoolBellNotes[i]) => s.freq;
         onGain => s.gain;
         
     }
     offGain => s.gain;
     rest => now;
     onGain => s.gain;
     schoolBellDurs[i] => now;
     onGain => s.gain;
   
 }
 


