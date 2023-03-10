class Circle {
    private float radius = 0f;
    private PVector position;

    public Circle(int x, int y) {
        position = new PVector(x, y);
    }

    public void update() {
        float mouseDis = position.dist(mousePosition);
        radius = dist/2 - exp(mouseDis/64);
        radius = constrain(radius, 5, dist/2-5);
    }

    public void draw() {
        fill(175);
        ellipse(position.x, position.y, radius*2, radius*2);
    }
}