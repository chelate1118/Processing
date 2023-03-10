class Ball {
  final float RADIUS = 28f;
  PVector position;
  PVector velocity;

  Ball() {
    position = new PVector(100, 100);
    velocity = new PVector(2.5, 5);
  }

  void update() {
    // Add the current speed to the position.
    position.add(velocity);

    if(pressed) velocity.mult(1.05);
    else velocity.mult(0.95);

    velocity.setMag(constrain(velocity.mag(), 10, 50));

    if ((position.x > width-RADIUS) || (position.x < RADIUS)) {
      velocity.x = velocity.x * -1;
    }
    if ((position.y > height-RADIUS) || (position.y < RADIUS)) {
      velocity.y = velocity.y * -1;
    }

    position.x = constrain(position.x, RADIUS, width-RADIUS);
    position.y = constrain(position.y, RADIUS, height-RADIUS);
  }

  void display() {
    // Display circle at x position
    noStroke();
    
    if (pressed) fill(223,120,87);
    else fill(175);

    ellipse(position.x, position.y, RADIUS*2, RADIUS*2);
  }
}

