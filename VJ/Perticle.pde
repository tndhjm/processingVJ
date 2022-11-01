class Particle {
    int flagCounter;
    int waitTime;
    int particleNumX, particleNumY;
    float x, y;
    float xNoise, yNoise;
    int buffarX, buffarY;
    float bandSizeMapperX, bandSizeMapperY;

    Particle() {
        flagCounter = 0;
        waitTime = 10;

        particleNumX = 800;
        particleNumY = 200;

        buffarX = 1200;
        buffarY = 350;
    }

    void dispParticle() {
        background(0);
        stroke(255);
        for(int i = 0; i <= particleNumX; i ++) {
            for(int j = 0; j <= particleNumY; j ++) {
                x = map(i, 0, particleNumX, width/2-buffarX, width/2+buffarX);
                y = map(j, 0, particleNumY, height/2-buffarY, height/2+buffarY);
                // bandSizeMapperX = map(i, 0, particleNumX, 0, 50);
                // bandSizeMapperY = map(i, 0, particleNumY, 0, 400);
                xNoise = x + (fft.getBand((int)bandSizeMapperX)/50 * noise(x/100, y/100)) - 50;
                yNoise = y + (100 * noise(x/100+fft.getBand((int)bandSizeMapperX)/50, y/100+fft.getBand((int)bandSizeMapperY))) - 50;

                strokeWeight(2);
                point(xNoise, yNoise);
            }
        }
    }
}
