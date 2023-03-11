// Chat GPT draw Toothless

void setup() {
  size(400, 400);
}

void draw() {
  background(255); // Set the background color to white

  // Draw the body of Toothless
  fill(50); // Set the fill color to black
  noStroke(); // Remove the stroke
  ellipse(200, 250, 150, 100); // Draw the body

  // Draw the head of Toothless
  ellipse(150, 200, 75, 75); // Draw the left eye
  ellipse(250, 200, 75, 75); // Draw the right eye
  fill(255); // Set the fill color to white
  ellipse(145, 195, 25, 25); // Draw the left pupil
  ellipse(245, 195, 25, 25); // Draw the right pupil
  fill(0); // Set the fill color to black
  ellipse(140, 190, 10, 10); // Draw the left iris
  ellipse(240, 190, 10, 10); // Draw the right iris
  triangle(175, 210, 225, 210, 200, 240); // Draw the nose
  stroke(50); // Set the stroke color to black
  strokeWeight(5); // Set the stroke weight to 5 pixels
  noFill(); // Remove the fill
  arc(200, 250, 150, 100, radians(30), radians(150)); // Draw the mouth
  line(150, 200, 200, 250); // Draw the left horn
  line(250, 200, 200, 250); // Draw the right horn
}
