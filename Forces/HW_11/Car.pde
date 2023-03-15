class Car {
    final PVector position = new PVector(175, 175);
    final PVector velocity = new PVector(0, 0);
    PVector acceleration = new PVector(0, 0);

    void update() {
        acceleration = new PVector(0, 0);
        if (keys[0]) applyForce(new PVector(0, -1));
        if (keys[1]) applyForce(new PVector(-1, 0));
        if (keys[2]) applyForce(new PVector(0, 1));
        if (keys[3]) applyForce(new PVector(1, 0));

        velocity.add(acceleration);
        position.add(velocity);

        position.x = constrain(position.x, 0, width);
        position.y = constrain(position.y, 0, height);

        if (position.x == 0 || position.x == width) velocity.x = 0;
        if (position.y == 0 || position.y == height) velocity.y = 0;

        friction();
    }

    void applyForce(PVector force) {
        acceleration.add(force.mult(0.1));
    }

    void friction() {
        loadPixels();
        if (pixels[(int)position.x + (int)position.y*width] == rail.col) 
            velocity.mult(0.99);
        else velocity.mult(0.9);
        updatePixels();
    }

    void draw() {
        fill(0);
        ellipse(position.x, position.y, 50, 50);
    }
}