float t;
int numOfLines = 150;

void setup() {
  size(800, 800);
  background(0);
}

void draw() {
  background(0);
  strokeWeight(10);
  translate(width / 2, height / 2);

 

  for (int i = 0; i < numOfLines; i++) {
    line(x(t + i), y(t + i), x2(t + i), y2(t + i));
    line(-x2(t + i), -y2(t + i), x(t + i), y(t + i));
    stroke(187, 45, 87, 255 - (i * 8));
  }

  t-= 1;
  
  if (mousePressed == true) {
  t-=10;
  }
}

    

float x(float t) {
  return sin(t / 30) * 150 + sin(t / 15) * 100;
}

float y(float t) {
  return cos(t / 15) * 150 + cos(t / 15) * 200;
}

float x2(float t) {
  return sin(t / 10) * 100 + sin(t / 20) * 200;
}

float y2(float t) {
  return cos(t / 15) * 100 + cos(t / 15) * 200;
}
