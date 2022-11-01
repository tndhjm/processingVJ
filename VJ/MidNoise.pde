class MidNoise {
    float blockSize;
    float x, y;
    int counter;

    MidNoise() {
        blockSize = height/40;
        x = 90;
        y = 90;

        counter = 0;
    }

    void dispMidNoise() {
        background(0);
        stroke(255);
        strokeWeight(2);
        
        noFill();

        for(int i = 0; i <= height; i += blockSize) {
            if(noise(i + fft.getBand(i)) < 0.7) stroke(255);
            else stroke(0);
            for(int j = 0; j <= width; j += blockSize) {
                line( j, i, j+ map( noise((fft.getBand(counter)) + counter), 0, 1, 0, blockSize+20), i);
                counter++;
            }
        }
    }
}
