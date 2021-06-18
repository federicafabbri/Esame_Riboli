void setup() {
  size(700, 700);
  noFill();
}

void draw() {
  background(20);
  
  float maxX = (float)180/mouseX;
  float maxY = (float)180/mouseX;
  
  translate(width/2, height/2);
  
  for (int q = 0; q < 20; q++) {
    float f = map(q, 0, 20, 255, 0);
    stroke(f, 0, 150, 255);
    for (int i = 0; i < 360; i+=60) {
      float x = sin(radians(i))*(10+q*10) / maxX;
      float y = cos(radians(i))*(10+q*10) / maxY;
      pushMatrix();
      translate(x, y);
      rotate(radians(-i));
      float l = (sin(radians(q*50+frameCount*3))*(5+sin(radians(q*50))*(q*50)));
      if (l > 0) ellipse(0, 0, l, 150);
      popMatrix();
      
      }
    }
  }
