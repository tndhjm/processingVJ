class HighNoise {
    int minBand;
    int noiseSize;
    int timer;
    int bandNum;
    float noiseNum;
    int r;
    HighNoise() {
        minBand = 185; //8000Hz
        bandNum = minBand;

        noiseSize = 5;

        timer = millis();
        r = 100;
    }

    void dispHighNoise() {
        // background(255);
        noStroke();
        
        for(int i = 0; i <= width; i += noiseSize) {
            for(int j = 0; j <= height; j += noiseSize) {
                bandNum += 1;
                if(bandNum > specNum) bandNum = minBand;
                noiseNum = noise(fft.getBand(bandNum)*1000  + cos(random(0, 1000)));
                if(noiseNum < 0.6) fill(255, 255, 255, 0);
                else if(noiseNum >= 0.6) fill(0);
                rect(i, j, noiseSize, noiseSize);
            }
        }
    }
}
