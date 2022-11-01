class FFTTypo {
    int boxW,boxH;
    int n;    
    int bd;
    int counter;
    int flag;
    int spacer;
    float y;
    float bandWidth;

    FFTTypo() {
        boxW = 1000;
        boxH = 700;

        n = 10;

        bd = (fft.specSize()-1)/n;
        counter = 0;
        flag = 0;

        spacer = 240;
        bandWidth = 0;

        textAlign(RIGHT);
    }

    void dispFFTBand() {
        counter = 0;
        flag = 0;
        bandWidth = 0;
        background(255);
        
        rectMode(CENTER);
        textAlign(LEFT);
        
        fill(0);  

        for(int i = 0; i < fft.specSize()-3; i++)  {
            y = map(counter + bd*flag, bd*flag, bd*flag + bd, height/2-boxH/2-20, height/2+boxH/2+40);
            textSize(8);
            text(bandWidth + "Hz:", width/2-n/2*spacer + flag*spacer, y);

            textSize(19);
            text(fft.getBand(i), width/2-n/2*spacer+ 80 + flag*spacer, y);
            counter++;
            bandWidth += fft.getBandWidth();
            if(counter == bd)  {
                flag += 1;
                counter = 0;
            }
        }

        if(fft.getBand(1) == 0) background(255);
    }
}