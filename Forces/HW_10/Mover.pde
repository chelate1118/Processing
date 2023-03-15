class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    position = new PVector(30,300);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 1;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    pushMatrix();
      translate(position.x, position.y);
      ellipse(0,0,48,48);
      fill(0, 0);
      beginShape();
        vertex(0, 24);
        bezierVertex(0, 24, 10, 28, 0, 32);
        bezierVertex(0, 32, -10, 36, 0, 48);
      endShape();
    popMatrix();
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = width;
      velocity.x *= -1;
    } else if (position.x < 0) {
      velocity.x *= -1;
      position.x = 0;
    }

    if (position.y < 0) {
      velocity.y *= -0.95;
      position.y = 0;
    }

  }

}



