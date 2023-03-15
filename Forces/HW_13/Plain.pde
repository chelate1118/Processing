PImage plainImg;
PImage plainImg2;

class Plain {
    final int imgWidth = 349;
    final int imgHeight = 147;
    PVector location;
    PVector velocity = new PVector(0, 0);
    PVector acceleration = new PVector(0, 0);

    Plain() {
        location = new PVector(0, height - imgHeight);
    }

    void update() {
        acceleration = new PVector(0, 0);
        if (keys[0]) acceleration = new PVector(-0.1, 0);
        if (keys[1]) acceleration = new PVector(0.1, 0);

        velocity.x = constrain(velocity.x, -11, 11);
        
        acceleration.add(new PVector(0, -abs(velocity.x)*0.1));
        acceleration.add(new PVector(0, 1));

        velocity.add(acceleration);
        location.add(velocity);
        
        location.y = constrain(location.y, 0, height - imgHeight);
        if (location.y == 0) velocity.y = 0;
        if (location.y == height - imgHeight) velocity.y = 0;

        if (location.x < -imgWidth/2) location.x = width - imgWidth/2;
        else if (location.x > width - imgWidth/2) location.x = -imgWidth/2;
    }

    void draw() {
        if (velocity.x >= 0)
            image(plainImg, location.x, location.y, imgWidth, imgHeight);
        else image(plainImg2, location.x, location.y, imgWidth, imgHeight);
    }
}