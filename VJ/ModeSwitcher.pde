class ModeSwitcher {

    ModeSwitcher() {
        for(int i = 1; i < modeNum; i++) {
            modes[i] = false;
        }
        bitwave = new Bitwave(50, 300, 40);
        ffttypo = new FFTTypo();
        highnoise = new HighNoise();
        midnoise = new MidNoise();
        baseline = new BaseLine(60, 512);
        particle = new Particle();
        
    }

    void switcher() {
        if(modes[0]) ffttypo.dispFFTBand();
        else if(modes[1]) bitwave.dispNoiseWave();
        else if(modes[2]) highnoise.dispHighNoise();
        else if(modes[3]) midnoise.dispMidNoise();
        if(modes[4]) baseline.dispBaseLine();
        if(modes[5]) particle.dispParticle();
    }
}
