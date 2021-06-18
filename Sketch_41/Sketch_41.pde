void setup() {
  size(800, 800);
  stroke(255);
  noFill();
}

int distance = 50;

void draw() {
  background(0, 50);
  for (int x = 10; x <= width; x+= distance) {
    for (int y = 10; y <= height; y+= distance) {
      float siz = distance * sin(frameCount/20.0f + x/2.0f + y/8.0f) + 10;
      ellipse(x - siz/2, y - siz/2, siz, siz);
      ellipse(x - siz*4, y - siz*4, siz, siz);
      
    }
  }
  
  if (mousePressed == true) {
  fill(255);
    
  }

else {
noFill();

}


}
