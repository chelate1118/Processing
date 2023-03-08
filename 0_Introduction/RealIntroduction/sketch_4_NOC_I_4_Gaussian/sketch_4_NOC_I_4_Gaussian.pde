
void setup() {
  size(640, 360);
  background(255);
}

void draw() {
  drawCircle();
}

void drawCircle()
{
  float dist = randomGaussian();
  float sd = 60;
  float angle = random(TWO_PI);

  dist = ( dist * sd );
  fill(randomGaussian()*30 + 150, randomGaussian()*30 + 30, randomGaussian()*30 + 100, 50);
  noStroke();
  ellipse(dist * sin(angle) + width/2, dist * cos(angle) + height/2, 16, 16);
}