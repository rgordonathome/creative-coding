/*
 * Software Structure #003
 * 
 * A surface filled with one hundred medium to small sized circles. Each
 * circle has a different size and direction, but moves at the same slow
 * rate. 
 * 
 * Display: 
 * 
 * A. The instantaneous intersections of the circles
 * B. The aggregate intersections of the circles
 * 
 * A. The points moving on the screen are the center of each circle and the
 * lines connect the intersections on the perimeters of overlapping
 * circles. To emphasize the difference in line length, they increase in
 * value from white to black as they grow longer. Because the edge of a
 * circle is a nonlinear surface, the lines drawn from the intersections
 * begin to grow quickly, linger as they approach maximum length, and
 * diminish quickly. When three or more circles overlap, the illusion of
 * depth increases as the resulting lines construct a corner.
 * 
 * B. The aggregate version is like photographing the instantaneous version
 * with the shutter left open for an extended time. It gives a different
 * vision into the structure by compressing changes over time into the same
 * visual space. The transition of the line values from white to black is
 * critical to avoid that the screen saturates entirely with one value. The
 * image created by this software is continually changing and never
 * repeating.
 *
 * Source: http://artport.whitney.org/commissions/softwarestructures/text.html#structure 
 */

// Variables to track number and location of circles
int circles = 2;
float[] circleX = new float[circles]; 
float[] circleY = new float[circles];
float[] diameter = new float[circles];

// Variables to track movement of circles
float[] dX = new float[circles];
float[] dY = new float[circles];
float[] direction = new float[circles];

// Initial length of vector
float velocity = random(1, 3);

// This runs once.
void setup() {

  // Create canvas
  size(800, 800);
  
  // Color mode
  colorMode(HSB, 360, 100, 100, 100);

  // Set initial positions and sizes of circles
  for (int i = 0; i < circles; i ++) {
    diameter[i] = random(100, 300);
    circleX[i] = random(0 + diameter[i], width - diameter[i]);
    circleY[i] = random(0 + diameter[i], width - diameter[i]);
  }

  // Draw circles at initial positions
  drawCircles();
}

// This runs repeatedly
void draw() {
}

// drawCircles
//
// Purpose: Draw the circles at their current locations
//
void drawCircles() {

  // Erase prior drawing
  background(0, 0, 100);

  // Set visual attributes
  strokeWeight(1);
  noFill();

  // Draw the circles and their centre points
  for (int i = 0; i < circles; i++) {
    stroke(i*120, 80, 90);
    ellipse(circleX[i], circleY[i], diameter[i], diameter[i]);
    point(circleX[i], circleY[i]);
    
    // Draw a line between the circles
    if (i > 0) {
      stroke(0, 0, 0, 30);
      line(circleX[i], circleY[i], circleX[i - 1], circleY[i - 1]);
    }
  }
  
}

// keyPressed
// 
// Purpose: Built-in Processing function that occurs when a key is pressed
//
void keyPressed() {
  
  // Reset the sketch when the 'r' key is pressed
  if (key == 'r') {
    setup();    
  }
  
}