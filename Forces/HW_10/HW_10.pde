Mover m;

void setup() {
  size(640,360);
  m = new Mover(); 
}

void draw() {
  background(255);

  float change = 0.03;
  float coeff = 0.1;
  PVector wind = new PVector(
    (noise(frameCount*change, 0)-0.5)*coeff,
    (noise(frameCount*change, 1)-0.5)*coeff
  );
  PVector gravity = new PVector(0,0.1);


  pushMatrix();
    translate(500, 60);
    fill(0, 0);
    ellipse(0, 0, 100, 100);
    line(0, 0, wind.x/coeff*100, wind.y/coeff*100);
  popMatrix();

  m.applyForce(wind);
  m.applyForce(gravity.mult(-1));

  m.update();
  m.display();
  m.checkEdges();
}
