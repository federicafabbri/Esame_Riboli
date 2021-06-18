void setup() {
  size(640, 640);
  noStroke();
}

void draw() {
  background(15, 25, 9);
  translate(width/2, height/2);

  for (int i = 0; i < 360; i+=10) {
    if ((i % 60) != 0)
    for (int q = 0; q < 120; q+=10) {
      float x = sin(radians(i+64+frameCount*2))*100+sin(radians(i-q+frameCount*2.5))*100;
      float y = cos(radians(i+64+frameCount*2))*100+cos(radians(i-q+frameCount*2.5))*100;
      float s = map(q, 0, 120, 10, 0);
      fill(map(q, 0, 140, random(255), 50), 100, 25);
      ellipse(x, y, s, s);
    }
    
    for (int q = 0; q < 140; q+=10) {
      float x = sin(radians(i))*120+sin(radians(i+q-frameCount*2))*175;
      float y = cos(radians(i))*120+cos(radians(i+q-frameCount*2))*175;
      float s = map(q, 0, 140, 15, 0);
      fill(map(q, 0, 140, random(255), 50), 100, 25);
      ellipse(x, y, s, s);
    }
  }
}
