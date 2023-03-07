

// A random walker object!

class Walker {
  int x,y;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void render() {
    stroke(0);
    point(x,y);
  }

  // Randomly move up, down, left, right, or stay in one place
  void step() {
    
    float choice = random(2);
    
    if (choice < 0.25) {
      x++;
    } else if (choice < 0.5) {
      x--;
    } else if (choice < 0.75) {
      y++;
    } else if (choice < 1.0) {
      y--;
    } else {
      final float distance = getMouseDistance();
      final float xSpeed = (mouseX - x) / distance;
      final float ySpeed = (mouseY - y) / distance;

      if (random(1) <= abs(xSpeed)) {
        if (xSpeed > 0) x++;
        else x--;
      } else {
        if (ySpeed > 0) y++;
        else y--;
      }
    }

    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
  }

  private float getMouseDistance() {
    return dist(mouseX, mouseY, x, y);
  }
}