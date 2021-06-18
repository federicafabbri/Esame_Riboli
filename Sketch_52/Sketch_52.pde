void setup() {
  size(700, 700);
  stroke(0, 255, 150, 20);
  frameRate(5);
}

void draw() { 
  
  noFill();
  background(0);
  translate(width/2, height/2);
  for (int i = 0; i < mouseX+20; i++) {
    for (float q = 1; q < 2; q+=0.01) {
   
      float x = sin(radians(i+frameCount+i))*200;
      float y = sin(radians(i+frameCount+i))*cos(radians(i+frameCount+i))*25;
      float s = cos(radians(i))*q*6;
       rotate (random(90));
       arc(x, y, random (s), s, -radians(i+frameCount*2), -radians(i+frameCount*2)+PI);
       arc(x, y, s, s, -radians(i+frameCount*2), -radians(i+frameCount*2)+PI); 
      
    }
  }
}
