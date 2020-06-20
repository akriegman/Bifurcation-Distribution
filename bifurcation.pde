float r; // parameter for the recurence, changes with mouse height
int lod = 10; // level of detail for curve
int depth = 30; // how many xn to draw
int skip = 0; // how many xn to skip
// xn will be plotted for n = skip to n = skip + depth

// the recurence
float lambda (float x) {
  return r * x * (1 - x);
}

// transforms from [0, 1] to screen coordinates
void vertex(float x, float y) {
  curveVertex(x * width, (1 - y) * height);
}

void setup () {
  size(800, 800);
  background(0);
  stroke(255);
  noFill();
  smooth();
  r = 2;
}

void draw () {
  background(0);
  
  // parameters affected by mouse position
  r = (1 - mouseY / (float)height) * 4;
  float x0 = mouseX / (float)width;
  float x1;
  
  // skip the first few xn
  for (int i = 0; i < skip; i++) {
    x0 = lambda(x0);
  }
  
  // draw the curve
  stroke(255);
  beginShape();
  vertex(0, lambda(0));
  for (int i = 0; i <= lod; i++) {
    float x = i / (float)lod;
    vertex(x, lambda(x));
  }
  vertex(1, lambda(1));
  endShape();
  
  // draw the x=y line
  line(0, height, width, 0);
  
  // draw the recurrence in action
  stroke(255, 0, 0);
  for (int i = 0; i < depth; i++) {
    x1 = lambda(x0);
    
    // transform into pixel space
    float px0 = x0 * width;
    float py0 = (1 - x0) * height;
    float px1 = x1 * width;
    float py1 = (1 - x1) * height;
    
    line(px0, py0, px0, py1);
    line(px0, py1, px1, py1);
    
    x0 = x1;
  }
}
