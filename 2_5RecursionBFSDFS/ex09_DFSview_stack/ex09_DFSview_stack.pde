/*

  Depth First Search
*/

import java.util.Stack;

Cell [][] grid;
int rows=100, cols=100, count=0;
int w = 20;
int [] dx = {1, 0, -1, 0};
int [] dy = {0, 1, 0, -1};
boolean isFile = true;

Stack stack = new Stack();

Cell current;
void setup() {
  size(800, 800);
  grid = new Cell[rows][cols];
  for(int i=0;i<rows;i++)
    for(int j=0;j<cols;j++)
      grid[i][j]=new Cell(i, j, 0);
      
  if (isFile) {
    if (mapRead("test7.txt") == false){
      println("map open fail");
      return;
    }
  }
  
  current = grid[0][0];
  
  frameRate(5);
  noLoop();
}

void draw() {
  background(255);
  for(int i=0;i<rows;i++)
    for(int j=0;j<cols;j++)
      grid[i][j].show();
  
  
  if (stack.empty()) {
      boolean newStart = findNewStart();
      if (newStart == false) {
         if (isFinish()) {
            println("stack empty and new start false finish");
            println(count-1);
            noLoop();
            }
          }   
      }
  
  current.visited = true;
  current.highlight();


  
  Cell next = current.checkNeighbors();
  
  if (next != null && next.visited == false) {
    next.visited = true;
    stack.push(current);
    current = next;
  
  } 
  else if (!stack.empty()) {
    //back tracking
    current =  (Cell)stack.pop();
   }
 
}

boolean isFinish() {
  boolean finish = true;
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (grid[i][j].value == 1 && grid[i][j].visited == false) {
        finish = false;
      }
    }
  }

  if (finish)
    return true;
  else
    return false;
}

boolean findNewStart() {
  count++;
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (grid[i][j].value == 1 && grid[i][j].visited == false) {
          current = grid[i][j];
          return true;
      }
      
    }
  }
  return false;
}

void mousePressed() {
  loop();
}

boolean mapRead(String fileName) {

    String lines[] = loadStrings(fileName);
    if (lines == null)
      return false;
    
    //first line rows cols;
    String[] rowscols = split(lines[0], ' ');
    rows = int(rowscols[0]);
    cols = int(rowscols[1]);
    w = width/cols;
    
    color v;
    for (int i = 1; i < lines.length; i++) {
      String[] pieces = split(lines[i], ' ');
              
        for (int j = 0; j < cols; j++) {
          if (int(pieces[j]) == 0) {
            v = color(205,204,255);
            grid[i-1][j].setValue(0);  
        }
          else {
            v = 0;
            grid[i-1][j].setValue(1);  

          }
          grid[i-1][j].setGrid(v);
        }
    }
    
    return true;
}
