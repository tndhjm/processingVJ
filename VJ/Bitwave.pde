class Bitwave {
    int bufferW, bufferH;
    int border;
    float x, y, x_2, y_2;
    float noiser;


    Bitwave(int w, int h, int b) {
        bufferW = 0;
        bufferH = h;

        border = b;
    }

    void dispWave(){
        strokeWeight(100);
        stroke(0);
        
        for(int i = 0; i < in.bufferSize() - 1; i++) {
            x = map(i, 0, in.bufferSize() - 1, bufferW, width-bufferW);
            y = map(in.left.get(i), -1, 1, height/2-bufferH, height/2+bufferH);
            x_2 = map(i+1, 1, in.bufferSize(), bufferW, width-bufferW);
            y_2 = map(in.left.get(i+1), -1, 1, height/2-bufferH, height/2+bufferH);

            line( x, y, x_2, y_2 );
        }
    }
    void dispNoiseWave(){
        background(255);
        stroke(0);
        
        for(int i = 0; i < in.bufferSize() - 1; i++) {
            strokeWeight(fft.getBand( (int)random(0, 512) ) * fft.getBand( (int)random(0, 512) ) *10);
            x = map(i, 0, in.bufferSize() - 1, bufferW, width-bufferW);
            y = map(in.left.get(i), -1, 1, height/2-bufferH, height/2+bufferH);

            x_2 = map(i+1, 1, in.bufferSize(), bufferW, width-bufferW);
            y_2 = map(in.left.get(i+1), -1, 1, height/2-bufferH, height/2+bufferH);

            line( x, y, x_2, y_2 );
        }
    }

}
