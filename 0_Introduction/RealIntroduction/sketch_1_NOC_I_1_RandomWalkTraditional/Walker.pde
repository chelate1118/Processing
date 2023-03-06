

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
    
    float choice = random(1);
    
    if (choice < 0.3) {
      x++;
    } else if (choice < 0.5) {
      x--;
    } else if (choice < 0.8) {
      y++;
    } else {
      y--;
    }

    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
  }
}