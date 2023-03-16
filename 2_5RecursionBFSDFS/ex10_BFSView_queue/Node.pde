
class Node {
  int x, y;
  String value = "";
  boolean start, end, searched;
  ArrayList<Node> edges = new ArrayList<Node>();
  Node parent;
  
  Node(String value, int x, int y) {
    // Position
    this.value = value;
    this.x = x;
    this.y = y;
    // Start or end node?
    this.start = false;
    this.end = false;
    // Neighbors
    this.parent = null;
    this.searched = false;
  }
  
  //connect
  void addEdge(Node n) {
    edges.add(n);
  }
  
  
  void show() {
    stroke(255);
    
    fill(0);
    // Different colors based on what has happened so far
    
    if (this.start || this.end) {
      fill(0, 255, 0);
    } else if (this.searched) {
      fill(150, 0, 150);
    }
    ellipse(this.x, this.y, 16, 16);
    fill(255);

  }
  
  // Highlight the node a different color
  void highlight() {
    fill(255, 0, 0, 150);
    ellipse(this.x, this.y, 16, 16);
  }
  
  // Draw lines to neighbors
  void showEdges() {
    noFill();
    stroke(255);
    for (int i = 0; i < this.edges.size(); i++) {
      line(this.x, this.y, this.edges.get(i).x, this.edges.get(i).y);
    }
  }
}
