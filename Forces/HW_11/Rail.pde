class Rail {
    final color col = color(76, 75, 22);

    void draw() {
        fill(col);
        noStroke();
        rect(100, 100, 800, 600, 24);
        fill(backgroundCol);
        rect(250, 250, 500, 300, 12);
    }
}