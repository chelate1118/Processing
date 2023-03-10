class Circle {
    private float radius = 0f;
    private color col;
    private PVector position;

    public Circle(int x, int y) {
        position = new PVector(x, y);
    }

    public void update() {
        float mouseDis = position.dist(mousePosition);
        radius = dist/2 - exp(mouseDis/64);
        radius = constrain(radius, minRad, dist/2-padding);
        col = color(15, 61, map(radius, minRad, dist/2-padding, 50, 100));
    }

    public void draw() {
        fill(col);
        ellipse(position.x, position.y, radius*2, radius*2);
    }
}