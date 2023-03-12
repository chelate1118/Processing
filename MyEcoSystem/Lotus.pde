class Lotus extends Agent {
    static final int maxHealth = 200;
    static final int minHealth = 100;
    float angle;

    Lotus(PVector l) {
        super(l);
        maxspeed = 0.5;
        angle = random(TWO_PI);
        velocity = new PVector(random(1), random(1));
    }

    void update() {
        super.update();
        angle = map(noise(xoff/10.), 0, 1, 0, TWO_PI);
        health = constrain(health+0.7, minHealth, maxHealth);
    }

    void drawBody() {
        pushMatrix();
            translate(location.x, location.y);
            scale (health / 10f);
            rotate(angle);
            fill (97, 113, 67, health);
            noStroke();
            beginShape();
                for (int i=0; i<=360; i+=10) {
                    float r = 1+sin(radians(i));
                    vertex(r*sin(radians(i)), r*cos(radians(i)));
                }
            endShape();
        popMatrix();
    }

    void setColor() {
        fill(97, 113, 67, health);
    }

    boolean dead() {
        return false;
    }
}