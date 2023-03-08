
float increment = 0.01;
int frameRateVal = 30;
float frequency = 0.5;

void setup() {
  noiseDetail(10,0.65f);
  size(640,360);
  frameRate(frameRateVal);
}

void draw() {
  background(0);
  
  loadPixels();

  float xoff = 0.0;
  
  for (int x = 0; x < width; x++) {
    xoff += increment; 
    float yoff = 0.0;  
    for (int y = 0; y < height; y++) {
      yoff += increment;
      
      float bright = noise(xoff, yoff, frameCount/(float)frameRateVal*frequency)*255;

      pixels[x+y*width] = color(bright);
    }
  }
  
  updatePixels();
}