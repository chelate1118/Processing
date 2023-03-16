class Graph{

  ArrayList<Node> nodes = new ArrayList<Node>();
  HashMap<String,Node> graph = new HashMap<String,Node>();
  Node end;
  Node start;
  Graph() {
    this.end = this.start = null;
    
  }
  // Set start
  void setStart(Node node) {
    this.start = node;
    node.start = true;
  }
  
  // Set end
  void setEnd(Node node) {
    this.end = node;
    node.end = true;
  }
  
  // Add a node
  Node addNode(String value, int x, int y) {
    // Create the node
    Node n = new Node(value, x, y);
    // Keep track of it
    this.nodes.add(n);
    this.graph.put(n.value, n);
    
    return n;
 
  }
  // Draw everything
  void show() {
    for (int i = 0; i < this.nodes.size(); i++) {
      this.nodes.get(i).showEdges();
    }
    for (int i = 0; i < this.nodes.size(); i++) {
      this.nodes.get(i).show();
    }
  }
}
