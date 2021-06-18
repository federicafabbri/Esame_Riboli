void setup() {
  size(640, 640);
  fill(0, 255, 0, 60);
  noStroke();
  frameRate(25);
}

void draw() {
  background(20);
  pushMatrix();
  translate(width/2, height/2);
  scale(0.1);
  for (int q = 0; q <= 360; q+=30) {
    float s = q*12;
    for (int i = 0; i < 360; i+=3  ) {
      float x = sin(radians(i+frameCount))*s;
      float y = cos(radians(i+frameCount))*s;
      float m = 0.5+sin(radians(sin(radians(frameCount))*s+i+frameCount*2));
      if(m > 0){
        ellipse(x, y, m*q, m*q);
      }
    }
  }
    popMatrix();
  }
