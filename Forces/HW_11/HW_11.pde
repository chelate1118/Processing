final color backgroundCol = color(137, 129, 33);
final Rail rail = new Rail();
final Car car = new Car();
final boolean[] keys = new boolean[4];

void setup() {
    size(1000, 800);
}

void draw() {
    background(backgroundCol);
    rail.draw();
    car.update();
    car.draw();
}

void keyPressed() {
    if (key == 'w') keys[0] = true;
    if (key == 'a') keys[1] = true;
    if (key == 's') keys[2] = true;
    if (key == 'd') keys[3] = true;
}

void keyReleased() {
    if (key == 'w') keys[0] = false;
    if (key == 'a') keys[1] = false;
    if (key == 's') keys[2] = false;
    if (key == 'd') keys[3] = false;
}