//2016003372 김세훈


SqrOsc high => pan2 p1 => dac;
TriOsc mid => pan2 p2 => dac;
SinOsc low => pan2 p3 => dac;

SndBuf hhSnd4 => dac;
SndBuf hhSnd1 => dac;
me.dir()+"hihat_04.wav" => hhSnd4.read;
me.dir()+"hihat_01.wav" => hhSnd1.read;

0.3 => float onGain;
0 => int offGain;

0.25 :: second => dur e;
0.13 :: second => dur s;
0.5 :: second => dur q;
0.02 :: second => dur rest;
1.3 :: second => dur one;
0.7 :: second => dur h;

0.35 :: second => dur temp;
0.12 :: second => dur temp2;

Math.srandom(1);


offGain => high.gain;
offGain => mid.gain;
offGain => low.gain;

[79, 80, 82, 84, -1, 84, -1, 84, -1, 84,
 82, -1, 82, 80, -1, 80, 79, 80, 79, 77,
 75, 82, 75, -1,
 82, 84, 82, 80, 79, -1,
 80, -1, 80, -1, 80, -1, 80, 79, -1, 79, 82, 84,
 77, 79, 80, 79, 75, 80, 79, 75, 84, 82,
 82, -1, 82, -1, 82, 84, 82,
 75, 74, 75, 82, 75, 74, 75, 82, 75, 74, 75, 77, 75, -1,
 75, 74, 75, 70, 75, 74, 75, 77, 80, 79, 77, 75, -1,
 75, 74, 75, 82, 75, 74, 75, 82, 75, 74, 75, 77, 75, -1,
 75, 74, 75, 82, 80, 79, 77, 75, 74, -1, 74] @=> int ssh[];
 
[-1, -1, -1, 77, -1, 77, -1, 77,-1, 77,
 77,-1, 77, -1, -1, -1, 75, -1, 75, -1,
 70, -1, 70, -1,
 77, -1, 77, -1, 75, -1,
 -1, -1, -1, -1, 77, -1, 77, 74, -1, 74, -1, 79,
 -1, -1, 75, -1, -1, 75, -1, -1, -1, 77,
 -1, -1, -1, -1, -1, -1, -1,
 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 70, 70, -1,
 -1, -1, -1, -1, -1, -1, -1, -1, 75, -1, -1, -75, -1,
 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 70, 70, -1,
 -1, -1, -1, -1, 75, -1, -1, -1, 70, -1, 70] @=> int ssm[];
 
[-1, -1, -1, 72, -1, 72, -1, 72, -1, 72,
 74, -1, 74, -1, -1, -1, 72, -1, 72, -1,
 67, 70, 67, -1,
 74, -1, 74, -1, 72, -1,
 72, -1, 72, -1, 72, -1, 72, 71, -1, -1, 71, 72, 
 -1, -1, 72, -1, -1, 72, -1, -1, 72, 70, 
 70, -1, 70, -1, 70, 72, 70,
 70, -1, -1, -1, 70, -1, -1, -1, 70, -1, -1, 67, 67, -1,
 70, -1, -1, -1, 70, -1, -1, -1, 70, -1, 67, -1, -1,
 70, -1, -1, -1, 70, -1, -1, -1, 70, -1, -1, 67, 67, -1,
 70, -1, -1, -1, 70, -1, -1, -1, 67, -1, 67] @=> int ssl[];
 
[1,0,0,0] @=> int ff[];
 
     
 
[e, e, e, q, rest, q, rest, e, rest, q,
 q, rest, e, e, rest, e, e, e, e, e,
 q, q, q, e,
 q, e, e, e, one, rest,
 q, rest, q, rest, e, rest, q, q, rest, e, e, q,
 e, e, e, e, e, e, e, e, e, h,
 e, rest, e, rest, e, e, q,
 e, e, e, e, e, e, e, e, e, e, e, q, q, rest,
 q, e, e, e, e, e, e, e, q, e, q, q, s,
 e, e, e, e, e, e, e, e, e, e, e, q, q, rest,
 q, e, e, e, e, e, e, e, q, e, q] @=> dur sshd[];  
 
for( 0 => int beat; beat<8; beat++){
    
    if(beat==0 || beat==2 || beat==4 || beat==7){
        0 => hhSnd4.pos;
        temp => now;
    }
} 

for( 0=> int beat2; beat2<32; beat2++){
    if(ff[Math.random2(0,3)]){
        0 => hhSnd1.pos;
        temp2 => now;
    }
}
 
for (0=>int i; i<ssh.cap()+1;i++){
     
     if (ssh[i] == -1){
         offGain =>high.gain;
         offGain =>mid.gain;
         offGain =>low.gain;
     }
     else{
         Std.mtof(ssh[i]) => high.freq;
         Std.mtof(ssm[i]) => mid.freq;
         Std.mtof(ssl[i]) => low.freq;
         onGain => high.gain;
         onGain => mid.gain;
         onGain => low.gain;
     }
     sshd[i] => now;
} 