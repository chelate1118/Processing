
static final int radius = 20;
static final int jailRadius = 300;
Photon photon;

void setup() {
    photon = new Photon();
    frameRate(300);
    size(800, 800);
}

void draw() {
    background(255);
    fill(180);
    strokeWeight(0);
    ellipse(width/2, height/2, jailRadius*2+radius*2, jailRadius*2+radius*2);

    drawPhoton(new PVector(mouseX-width/2, mouseY-height/2));
    photon.update();
    photon.draw();
}
