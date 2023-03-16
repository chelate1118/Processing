
/*

  BFS: Breadth First Search
*/


// Graph object
Graph graph;

// Keep all nodes in a 2D array called grid to track neighbors
Node[][] grid;

// Queue for BFS algorithm
ArrayList<Node> queue = new ArrayList<Node>();
// Solved path
ArrayList<Node> path = new ArrayList<Node>();;

void setup() {
  size(800, 800);
  graph = new Graph();

  // Create a 2D array with cols and rows
  int cols = 20;
  int rows = 20;
  int spacing = 40;
  grid = new Node[20][20];

  for(int i=0; i < cols; i++) {
    for(int j=0; j < rows; j++) {
      int x = spacing / 2 + i * spacing;//col
      int y = spacing / 2 + j * spacing;//row
      grid[i][j] = graph.addNode(str(i+j*20),x, y);
    }
  }
  // Connect them randomly to the right and down
  for (int j = 0; j < rows - 1; j++) {
    for (int i = 0; i < cols; i++) {
      Node n = grid[i][j];
      // 80% chance of being connected
      if (random(1) < 0.8) {
        n.addEdge(grid[i][j + 1]);
      }
      if (random(1) < 0.8 && i < cols - 1) {
        n.addEdge(grid[i + 1][j]);
      }
    }
  }
  // Slow down framerate
  //frameRate(15);

  // Start top left
  graph.setStart(grid[0][0]);

  // Pick a random end
  int endx = floor(random(cols));
  int endy = floor(random(rows));
  graph.setEnd(grid[endx][endy]);
  // Go
  queue.add(graph.start);
  
  noLoop();
}


void draw() {
  background(0);
  // Draw the graph
  graph.show();
  // Now we do one iteration of the loop
  if (queue.size() > 0) {
    Node node = queue.get(0);
    queue.remove(0);
    node.highlight();
    // If not already checked
    if (!node.searched) {
      
      if (node == graph.end) {
        println("End");
        println("queue size END: " + queue.size());

        // Figure out the path by going backwards through parent nodes
        path.add(node);
        Node next = node.parent;
        // Make path
        while (next != null) {
          println(next.value);
          path.add(next);
          next = next.parent;
        }
        // Stops draw() loop!
        noLoop();
      } else {
        // Look at node's neighbors
        ArrayList<Node> next = node.edges;
        
        for (int i = 0; i < next.size(); i++) {
          // Place them all in the queue and update parent
          
          Node neighbor = next.get(i);
          queue.add(neighbor);
          neighbor.parent = node;
        }
        // Mark that node as searched
        node.searched = true;
      }
    }
  }
  // Highlight th path if it exists!
  if (path.size() > 0) {
    println("path size: " + path.size());
    for (int i = 0; i < path.size(); i++) {
      path.get(i).highlight();
    }
  }
}

void mousePressed() {
  loop();
}
