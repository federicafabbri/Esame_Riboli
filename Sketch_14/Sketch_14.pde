int distance = 240;

void setup() {
  size(700, 700);
  noStroke();
}

void draw() {
  background(160, 220, 255);
  for (int x = 0; x <= width; x+= distance) {
    for (int y = 0; y <= height; y+= distance) {
      float siz = distance * sin(frameCount/40.0f + x/50.0f + y/8.0f) + 5;
      ellipse(x - siz/2, y - siz/2, siz, siz);
     
    }
  
  }
}
