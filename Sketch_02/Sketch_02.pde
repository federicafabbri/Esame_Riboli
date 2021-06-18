int num =20;
float step, sz, offSet, theta, angle;

void setup() {
  size(600, 400);
  strokeWeight(6);
  step = 9;
}

void draw() {
 background(mouseY/2, 80, 120);
  translate(width/2, height);
  angle=0;
  for (int i=0; i<width; i++) {
    stroke(360-mouseY/2, 120, 80);
    noFill();
    sz = i*step;
    float offSet = TWO_PI/num*i-i;
    float arcEnd = map(sin(theta+offSet),0,1, PI, TWO_PI);
    arc(0, 0, sz, sz, PI, arcEnd);
  }
  colorMode(HSB, 360, 100, 100);
  resetMatrix();
  theta += .0223;
  
}
