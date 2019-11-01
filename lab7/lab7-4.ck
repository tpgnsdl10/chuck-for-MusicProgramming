Moog mog => dac;
200.0 => mog.freq;

while (true) {
    Math.random2f(0.5,5.0) => mog.filterQ;
    Math.random2f(0.05,1.0) => mog.filterSweepRate;
    1 => mog.noteOn;
    if (Math.random2(0,50) == 0) {
        Math.random2f(5.0,20.0) => mog.vibratoFreq;
        0.5 => mog.vibratoGain;
        second => now;
    }
    else {
        0.05 => mog.vibratoGain;
        0.0125::second => now;
    }
    1 => mog.noteOff;
    0.125::second => now;
}
//filterQ
//filterSweepRate
//vibratoFreq
//vibratoGain 