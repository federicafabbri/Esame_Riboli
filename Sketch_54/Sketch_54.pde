float lapse = 0;    
boolean frame = true, circles = false;
float num;

void setup() {
  size(860, 640);
  noStroke();
  }

void draw() {
  if(!circles){
    fill(255, 150);
    rect(0, 0, width, height);
  }
  
  
  translate(width/2, height/2);

  for (int i = 0; i < 360; i+=60) {
    fill(0);
    float am = map(mouseY, 0, height, 2, 10);
    float s = map(mouseX, 0, width, 50, 290);
    float x = sin(radians(i+num)) * s;
    float y = x/2 + cos(radians(i+num)) * s;
    
    for (int q = 0; q < 360; q+=am) {
      float x2 = sin(radians(q))*250;
      float y2 = cos(radians(q))*250;
      float m = sin(radians(q-i-frameCount*3))*30;
      
      if (m > 0) {
        ellipse(x+x2, y+y2, m, m);
      } else {
        ellipse(x+x2, y+y2, 1, 1);
      }
    }
  }
}

void mousePressed() {
  if (frame && circles) {
    circles = false;
    frame = false;
  }
  if (frame && !circles) {
    circles = true;
    frame = false;
  }
}

void mouseReleased() {
  frame = true;
}
