
void drawPhoton(PVector position) {
    pushMatrix();
    translate(position.x+width/2, position.y+height/2);
    
    fill(255, 0, 0);
    strokeWeight(2);
    ellipse(0, 0, radius*2, radius*2);

    strokeWeight(3);
    line(0, radius*0.7, 0, radius*-0.7);
    line(radius*0.7, 0, radius*-0.7, 0);

    popMatrix();
}

class Photon {
    PVector location = new PVector(0, 0);
    PVector velocity = new PVector(0, 0);
    PVector acceleration = new PVector(0, 0);

    void update() {
        PVector mousePosition = new PVector(mouseX-width/2, mouseY-height/2).sub(location).mult(-1);
        
        float mag = mousePosition.mag();
        float acc = 100/mag/mag;

        mousePosition.setMag(acc);
        acceleration = mousePosition;

        velocity.add(acceleration);
        PVector temp = new PVector(location.x, location.y);
        location.add(velocity);
        location.limit(jailRadius);
        velocity = temp.sub(location).mult(-1);
    }

    void draw() {
        drawPhoton(location);
    }
}