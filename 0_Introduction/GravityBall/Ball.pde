
class Ball {

  float x;       // x location of square 
  float y;       // y location of square 
  float xSpeed;
  float ySpeed;   // ySpeed of square 
  float w;       // size
  int r;
  int g;
  int b;

  // Ball constuctor
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    xSpeed = random(-3, 3);
    ySpeed = 0;
    r = (int)random(255);
    g = (int)random(255);
    b = (int)random(255);
  }


  void display() {
    // Display the square 
    fill(r, g, b); 
    stroke(0); 
    ellipse(x,y,w,w); 
  }

  void update() {
    // Add ySpeed to location
    y = y + ySpeed; 
    x = x + xSpeed;

    // Add gravity to ySpeed
    ySpeed = ySpeed + gravity; 

    // If square reaches the bottom 
    // Reverse ySpeed 
    if (y > height - w/2) { 
      y = height - w/2;
      ySpeed = ySpeed * -0.95;  
    } 

    if (x < w/2) {
      x = w/2;
      xSpeed = -xSpeed;
    }

    if (x > width - w/2) {
      x = width - w/2;
      xSpeed = -xSpeed;
    }
  }
}