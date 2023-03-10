
final int row = 10;
final int col = 10;
final int dist = 50;
PVector mousePosition = new PVector();
Circle[][] circles = new Circle[row][col];

void setup()
{
    noStroke();
    size(500, 500);

    for (int i=0; i<row; i++) {
        for (int j=0; j<col; j++) {
            circles[i][j] = new Circle(dist*i + dist/2, dist*j + dist/2);
        }
    }
}

void draw()
{
    background(255);
    mousePosition.x = mouseX;
    mousePosition.y = mouseY;

    for (int i=0; i<row; i++) {
        for (int j=0; j<col; j++) {
            circles[i][j].update();
            circles[i][j].draw();
        }
    }
}