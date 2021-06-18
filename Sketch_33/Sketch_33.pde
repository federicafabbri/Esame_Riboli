PFont myFont;
void setup () {
  size(800,800);
  background(0);
  frameRate(7);
}
  void draw () {
    
  myFont = createFont("Baskerville",48);
  textFont(myFont,272);
  translate(400,400);
  if (mousePressed == true) {
    fill(random(255), random(255), random(255));
  } else {
    fill(random(255));
  }
  
  for(int i=0; i<6; i=i+1)
  {
    
    textAlign(LEFT);
    pushMatrix();
    rotate(PI*i/3);
    scale(random(1.5));
    text("tunnel",0,0);
    popMatrix();
  }
}
