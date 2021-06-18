float angX, angY, angX2, angY2;

void setup() {
  size(800, 800);
   background(0,0,50);
  frameRate(530); 
}

void draw() {
   drawCurve();
}

void drawCurve() {
  float x = width/2 + ((random(10)) * (random(sin(angX)) ));
  float y = height/2 + ((random(10)) * (random ( sin(angY)) + ((random (200)) * sin(angY2))));
  angX2 += .31;
  angY2 += .31;
  angX += .31;
  angY += .31;
  translate (width/2, height/2);
rotate(random(250,360));
  stroke(255, 100);
  strokeWeight(.2);
  line(width/2, height/2, x, y);

  fill(255);
  noStroke();
  ellipse(x/2, y/2, 1.5, 1.5);
 
  rect (x, y, 4.5, 4.5);
  
}
