
Ball b;
boolean pressed = false;

void setup() {
  size(1000, 1000);
  b = new Ball();
}

void draw() {
  fill(255, 80);
  rect(0, 0, width, height);
  b.update();
  b.display();
}

void keyPressed() {
  pressed = true;
}

void keyReleased() {
  pressed = false;
}
