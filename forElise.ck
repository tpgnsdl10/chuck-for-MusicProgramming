TriOsc t => dac;
1.0 => float onGain;
0.0 => float offGain;

0.3::second => dur s; // sixteenth (1/16)
0.6::second => dur e; // eighth (1/8)



[76, 75, 76, 75, 76, 71, 74, 72, 69, -1,
 60, 64, 69, 71, -1,
 64, 68, 71, 72, -1,
 64, 76, 75, 76, 75, 76, 71, 74, 72, 69, -1,
 60, 64, 69, 71, -1,
 64, 72, 71, 69] @=> int forEliseNotes[];
[ s,  s,  s,  s,  s,  s,  s,  s,  e, s,
 s,  s,  s,  e, s,
 s,  s,  s,  e, s,
 s,  s,  s,  s, s, s, s, s, s, e, s, s, s, s, e, s, s, s, s, e] @=> dur forEliseDurs[];
 
 for ( 0=>int i; i< forEliseNotes.cap(); i++){
     if (forEliseNotes[i]==-1){
         0=> t.gain;
     }
     else{
         Std.mtof(forEliseNotes[i]) => t.freq;
         onGain => t.gain;
     }
     forEliseDurs[i] => now;
 }     
  
  
    
    
  
    