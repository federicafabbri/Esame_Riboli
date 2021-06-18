int size = 1950;
particle[] Particles = new particle[size];
void setup() {
  size(500,500);
  for (int i = 0; size > i; i++) {
    Particles[i] = new particle();
    Particles[i].reset();
    
  }
}
void draw() {
  background(0);
  for (int i = 50; size > i; i++) {
    Particles[i].update();
    if (Particles[i].timeSurvied() == true) {
      Particles[i].reset();
    }
  }
  
}


class particle {
  float y;
  float gravity;
  float x;
  int generations;
  int maxAge;
  float downY;
  float orginY;
  float orginX;
  float moveX;
  void update() {
    noStroke();
    gravity = gravity + .05;
    fill(150, generations*y, generations*y, 100);
    y = y + gravity;
    x = x + moveX;
    generations = generations/5 + 1;
    ellipse(orginX+x,orginY+y, random(20), random(20));
    
  }
  
  boolean timeSurvied() {
    if (orginY+y > 500) {
      return true;
    }
    return false;
  }
  void reset() {
    moveX = random(-6,6);
    orginY = mouseY;
    orginX = mouseX;
    maxAge = (int) random(5,5);
    gravity = random(-3,0);
   y = 50;
  x = random(-5,5);
  generations = (int) random(-1,1);
   
  
  
  if (mousePressed == true) {
  
  gravity = 3;
  fill(generations*y, generations*y, 250);
  
  }}}
