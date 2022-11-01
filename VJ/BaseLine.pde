class BaseLine {
    int border,  max, buffer;
    boolean trriger;
    int phase;

    int counter;

    BaseLine(int b, int m) {
        border = b;
        max = m;
        trriger = false;
        buffer = height/(m/2);

        counter = m/2/2;
        println(counter);

        phase = 1;
    }

    void  dispBaseLine() {
        if (fft.getBand(1) > border) trriger = true;
        else if(fft.getBand(1) <= border) trriger = false;

        if(trriger) {
            phase = 1;
            counter = max/2/2;
            rectMode(CORNER);
            
            background(0, 0, 0);
            noStroke();
            fill(0);
            rect(0, 0, width/2, height);   
            fill(255);
            rect(width/2, 0, width/2, height);  

            for(int i = 0; i < max/2; i++) {
                if(phase == 1)
                    counter -= 1;
                    if(counter == 0) {
                        phase = 2;
                        counter = max/2/2;
                    }
                else if(phase == 2) {
                    counter += 1;
                }
                strokeWeight(fft.getBand(counter) * 0.1);
                stroke(255);
                line(0, buffer+i*buffer, width/2, buffer+i*buffer);
            }
            
            phase = 1;
            counter = max/2/2;

            for(int i = max/2; i <= max; i++) {
                if(phase == 1)
                    counter -= 1;
                    if(counter == 0) {
                        phase = 2;
                        counter = max/2/2;
                    }
                else if(phase == 2) {
                    counter += 1;
                }
                strokeWeight(fft.getBand(counter + max/2));
                stroke(0);
                line(width/2, buffer+(i-max/2)*buffer, width, buffer+(i-max/2)*buffer);
            }
        }
    }
}
