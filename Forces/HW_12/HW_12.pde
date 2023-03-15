
Plain plain;
boolean[] keys = new boolean[2];

void setup() {
    plain = new Plain();
    size(1500, 1200);
    plainImg = loadImage("airplain.jpg");
    plainImg2 = loadImage("airplain2.jpg");
    textSize(20);
}

void draw() {
    background(98, 205, 255);
    fill(0);
    text("\"a\": move left, \"d\": move right", 40, 40);
    plain.update();
    plain.draw();
}

void keyPressed() {
    if (key == 'a') keys[0] = true;
    if (key == 'd') keys[1] = true;
}

void keyReleased() {
    if (key == 'a') keys[0] = false;
    if (key == 'd') keys[1] = false;
}