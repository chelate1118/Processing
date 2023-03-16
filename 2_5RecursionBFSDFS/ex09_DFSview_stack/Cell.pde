
class Cell {

  int j, i;
  boolean visited = false;
  int value;
  color c;
  Cell(int i, int j, int k) {
    this.value = k;
    this.i = i;//row
    this.j = j;//col
    c = color(205, 204, 255);
    
  }
  
  void show() {
    stroke(255);
    if (visited) {
      fill(255, 0, 0, 100);
      rect(j*w, i*w, w, w);
    }
    else {
       fill(c);
       rect(j*w, i*w, w,w);
    }
 }
 
 void setValue(int v) {
   this.value = v;
 }
 
 void setGrid(color c) {
  this.c = color(c);
 }
 
 int index(int row, int col) {
   if (row < 0 || row > rows-1 || col < 0 || col > cols-1) {
     return -1;
   }
   return 0;
 }
 
 
 Cell checkNeighbors() {
   
   //i, j(row, col)
   //i-1 j, i j+1, i+1 j, i j-1
   Cell[] neighbors = new Cell[0];
   int topIndex, rightIndex, bottomIndex, leftIndex;
   topIndex      = index(i-1, j);
   rightIndex    = index(i, j+1);
   bottomIndex   = index(i+1, j);
   leftIndex     = index(i, j-1);
   Cell top, right, bottom, left;
   if (topIndex != -1) {
     top = grid[i-1][j];
     if (!top.visited && top.c != color(205,204,255))
            neighbors = (Cell[])append(neighbors, top);
   } 
   if (rightIndex != -1 ) {
     right = grid[i][j+1];
     if (!right.visited&& right.c != color(205,204,255) )
            neighbors = (Cell[])append(neighbors, right);
   }
   if (bottomIndex != -1) {
     bottom = grid[i+1][j];
     if (!bottom.visited&& bottom.c != color(205,204,255) )
            neighbors = (Cell[])append(neighbors, bottom);
   }
   if (leftIndex != -1) {
     left = grid[i][j-1];
     if (!left.visited && left.c != color(205,204,255))
            neighbors = (Cell[])append(neighbors, left);
   }
   
   if(neighbors.length > 0 ) {
     int r = floor(random(0, neighbors.length));
     return neighbors[r];
   } else
     return null;
 }
 
 void highlight() {
   noStroke();
   fill(255,0,0);
   rect(j*w, i*w, w, w);
 }
 
}
