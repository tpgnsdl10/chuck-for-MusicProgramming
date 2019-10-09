// 2016003372 김세훈



// 0~ 11 0oct
// 12~ 23 1oct
// 24~ 35 2oct
// 36~ 47 3oct
// 48~ 59 4oct
// 60~ 71 5oct
// 72~ 83 6oct



SinOsc s => pan2 p1 => dac;
TriOsc u => pan2 p3 => dac;

1.0 => float onGain;
0.0 => float offGain;

0.5 :: second => dur q;
0.8 :: second => dur h;
0.25 :: second => dur e;
0.05 :: second => dur si;
0.01 :: second => dur rest;


70 => int melodyNote1;
60 => int melodyNote2;



offGain => s.gain;

offGain => u.gain;


    
    


Math.srandom(113);

Math.random2f(-1.0,1.0)=> p1.pan;
Math.random2f(-1.0,1.0)=> p3.pan;
    

[57, -1, 64, -1, 57, 64, -1,
 57, -1, 64, -1, 57, 64, -1, 
 57, -1, 64, -1, 57, 64, -1, 
 57, -1, 64, -1, 57, 64, -1 ] @=> int ramiNote[];
 
[69, -1, 76, -1, 69, 76, -1,
 69, -1, 78, -1, 69, 78, -1,
 69, -1, 80, -1, 69, 80, -1,
 69, -1, 81, -1, 69, 81 ] @=> int ramiMel[]; 
 
[q, si, e, e, e, q, e,
 q, si, e, e, e, q, e, 
 q, si, e, e, e, q, e,
 q, si, e, e, e, q, e] @=> dur ramiDur[];
 
 
for (0 => int j; j<2; j++){ 
    for(0=> int i; i<ramiNote.cap(); i++){
         if (ramiNote[i] == -1){
            offGain => s.gain;
            offGain => u.gain;
        }
        else{
        Std.mtof(ramiNote[i]) => s.freq; 
        onGain => s.gain;
        Std.mtof(ramiMel[i]) => u.freq;
        onGain => u.gain;
        }
        ramiDur[i] => now;
        rest => now;
        offGain => s.gain;
        offGain => u.gain;
    }
    
}

[76, 74, 73, 71, -1, 69, 68, -1,
 80, 76, 74, 73, -1, 71, 69, -1,
 76, 74, 73, 71, -1, 69, 68, -1,
 80,-1, 80,-1 ,80, 81, -1, 83, -1,
 76, 74, 73, 71, -1, 69, 68, -1,
 80, 76, 74, 73, -1, 71, 69, -1,
 76, 74, 73, 71, -1, 69, 68, -1,
 80,-1, 80,-1 ,80, 81, 80, 81] @=> int rami2[];
 
[e, e, e, q, si, e, e, e,
 e, e, e, q, si, e, e, e,
 e, e, e, q, si, e, e, e,
 e, rest, e, rest, e, q, si, e, q,
 e, e, e, q, si, e, e, e,
 e, e, e, q, si, e, e, e,
 e, e, e, q, si, e, e, e,
 e, rest, e, rest, e, e, e, e ] @=> dur rami2Dur[];
 
 for(0 => int i; i<rami2.cap(); i++){
     if (rami2[i] == -1){
         offGain => u.gain;
         offGain => s.gain;
     }
     else{
         Std.mtof(rami2[i]) => u.freq;
         onGain => u.gain;
         
     }
     rami2Dur[i] =>now;
     
 }
     
 

    
    
       