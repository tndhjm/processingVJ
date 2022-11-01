import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
FFT fft;

int width = 2560;
int height = 800;

int specNum;

int modeNum = 6;
boolean []modes;

ModeSwitcher modeswitcher;
Bitwave bitwave;
FFTTypo ffttypo;
HighNoise highnoise;
MidNoise midnoise;
BaseLine baseline;
Particle particle;

float x, y;
void setup() {    
    size(2560, 800, P3D);
    pixelDensity(displayDensity());
    noCursor();

    minim = new Minim(this);
    in = minim.getLineIn();
    fft = new FFT(in.bufferSize(), in.sampleRate());

    specNum = fft.specSize();

    modes = new boolean[modeNum];
    modes[0] = true;
    modeswitcher = new ModeSwitcher();
}

void draw() {
    background(255);
    stroke(0);
    strokeWeight(2);

    fft.forward(in.mix);

    strokeCap(SQUARE);
    modeswitcher.switcher();
}

void stop()
{
  minim.stop();
  super.stop();
}

void keyPressed() {
  if(key == 'a') ffttypo.dispFFTBand();
  if (key == 's') bitwave.dispWave();
  if(key == 'd') highnoise.dispHighNoise();

  if(key == 'q'){
    modes[0] = true;
    modes[1] = false;
    modes[2] = false;
    modes[3] = false;
  }
  else if(key == 'w'){
    modes[0] = false;
    modes[1] = true;
    modes[2] = false;
    modes[3] = false;
  }
  else if(key == 'e'){
    modes[0] = false;
    modes[1] = false;
    modes[2] = true;
    modes[3] = false;
  }
  else if(key == 'r'){
    modes[0] = false;
    modes[1] = false;
    modes[2] = false;
    modes[3] = true;
  }

  if(key == 't'){
    modes[4] = (modes[4])?false:true;
  }
  
  if(key == 'y'){
    modes[5] = (modes[5])?false:true;
  }
}
