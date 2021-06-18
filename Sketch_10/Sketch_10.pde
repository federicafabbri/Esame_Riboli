float rAngle =random(5,30);
float rFill = random(50,255);
float bgFill = random(200,255);
float rStroke = random(0.3,2);

void setup() {
  size(800, 600);
  frameRate(100);
}

void draw() {
  background(0,0,0);
  translate(width/2, height/2);

  float wave = sin(radians(frameCount)); 
  float w = wave*map(mouseX,0,height,2500,0);

  for (int i = 0; i <500; i++) {
    rotate(rAngle);
    stroke(255);
   
    line(-230, -i+w, 550, i++);
     fill (255,255,255,90);

    stroke(0, rFill, rFill);
   
  }
}
