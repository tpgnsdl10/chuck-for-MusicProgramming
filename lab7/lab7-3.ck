Bowed bh => dac; //BlowHole , BlowBotl, Saxofony

[60, 62, 64, 65, 67, 69, 71, 72, 71, 69, 67, 65, 64, 62, 60] 
@=> int scale[];


for (0 => int i; i<scale.cap(); i++)
{
    Std.mtof(scale[i]) => bh.freq;
    0.9 => bh.bowPressure;
    0.3 => bh.bowPosition;
    0.3 => bh.vibratoGain;
    0.9 => bh.volume;     //0.1~0.9
    
    1 => bh.noteOn;
    0.3 :: second => now;
    1 => bh.noteOff;
    0.1 :: second => now;
}

