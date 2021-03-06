// Variables declare here have global scope (can be used anywhere)
int numFrames = 5; // number of frames to be placed in animated gif
int colorBase = 2; // Set the color base (0 = red, 1 = green, 2 = blue)

// This runs once
void setup() {

  // Set canvas size
  size(650, 650);

  // Draw rectangles from top-left corner
  rectMode(CENTER);

  // Use Hue-Saturation-Brightness colour model
  // See: https://twitter.com/rgordon/status/406373396939673602/photo/1
  colorMode(HSB, 360, 100, 100, 100);

  // No border
  noStroke();

  // Slow animation - 1 frame per second
  frameRate(1);

  // Seed random number generator
  randomSeed(hour() + minute() + second() + millis());
}

// This loops forever
void draw() {

  // Reset background
  background(0, 0, 90);

  // Calculate width of cell
  // 25 pixel boundary around drawing  
  int cellWidth = (width - 50) / 5;

  // Set a random square size for this run
  int squareWidth = cellWidth;
  squareWidth -= (int) random(0, 2);

  // Draw the grid of squares
  for (int col = 0; col < 5; col++) {
    for (int row = 0; row < 5; row ++) {

      // Rotate each square just a touch
      float angle = random(-3, 3);

      // Determine the color for this square
      int divisor = (int) random(3, 5);
      if ((col * row * 4) % divisor == 0) {
        // Duller reddish fill, 75% opaque
        fill(10 + 120 * colorBase, 83, 32, 75);
      } else {
        // Reddish fill
        fill(5 + 120 * colorBase, 92, 72, 75);
      }

      // Pick a random x and y offset for each square
      int xOffset = (int) random(-10, 10);
      int yOffset = (int) random(-10, 10);

      // Position the origin and draw the square
      pushMatrix();
      translate(cellWidth / 2 + row * cellWidth + 25 + xOffset, cellWidth / 2 + col * cellWidth + 25 + yOffset);
      rotate(radians(angle));
      rect(0, 0, squareWidth, squareWidth);
      popMatrix();
    }
  }

  // Save each frame
  saveFrame("f###.gif");
  if (frameCount == numFrames) {
    exit();
  }
} //end of draw 
