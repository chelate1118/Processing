
final int ballNumber = 10;
Ball[] balls = new Ball[ballNumber];

// Global gravity variable
float gravity = 0.1;

void setup() { 
  size(1100,1100); 
  smooth();
  
  for (int i=0; i<ballNumber; i++) {
    balls[i] = new Ball(i*100 + 100, random(30, 500), random(50, 80));
  }
} 

void draw() { 
  background(255);   

  for (Ball ball: balls) {
    ball.display();
    ball.update();
  }
} 
