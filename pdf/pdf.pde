import java.util.HashMap;

float r; // parameter for recurence
int lod = 1000; // level of detail for curves
int k; // recurrence depth
float yscale = 16; // scale down the y-axis by this factor

// pdf of Xn+1 = r*Xn*(1-Xn), where X0 is uniform
float fn(float x, int n) {
  if (n == 0) {
    return 1;
  }
  else if (x > r/4) {
    return 0;
  }
  else {
    float d = sqrt(1 - 4/r*x);
    return (fn(0.5 + 0.5*d, n-1) + fn(0.5 - 0.5*d, n-1)) / (r*d);
  }
}

// the recurence
float lambda (float x) {
  return r * x * (1 - x);
}

// transforms from [0, 1] to screen coordinates
void vertex(float x, float y) {
  curveVertex(x * width, (1 - y) * height);
}

void setup() {
  size(1200, 800);
  background(0);
  stroke(255);
  noFill();
  r = 3.57;
  k = 15;
}

void draw() {
  background(0);
  
  r = (1 - mouseY / (float)height) + 3;
  //k = (int)(mouseX / (float)width * 50);
  //k = (int)(mouseY / (float)height * 30);
  
  // lines to show where the mouse's x coordinate maps to
  stroke(255, 0, 0);
  line(mouseX, 0, mouseX, height);
  float x1 = lambda(mouseX / (float)width) * width;
  line(x1, 0, x1, height);
  
  // draw the pdf of Xk
  stroke(255);
  beginShape();
  vertex(0, fn(0, k) / yscale);
  for (int i = 0; i <= lod; i++) {
    float x = i / (float)lod;
    vertex(x, fn(x, k) / yscale);
  }
  vertex(1, fn(1, k) / yscale);
  endShape();
}
