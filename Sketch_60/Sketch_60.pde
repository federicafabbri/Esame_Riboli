float s=1;
float m=1;
float sc=20;
float xoff;
float yoff;

void setup(){
  fullScreen();
  frameRate(15);
  fill((random (0,100)),200,50,10);
stroke((random (0,100)),200,50,10);
  
  colorMode(HSB);
  background(0);
}

void draw(){
  s+=sc;
xoff+=random(8,30);
  yoff+=random(8,30);
  translate(width/2, height/2);
  beginShape();
  scale (0.2);
  
  if (keyPressed==true) {
fill ((random(255)),(random(255)),(random(255)),20);
}

  for(int i=0; i<width; i++){
    float d=TWO_PI/width*i;
    PVector p=PVector.fromAngle(d);
    float n=noise(p.x+xoff, p.y+yoff);
    p.mult(n*s);
    vertex(p.x, p.y);
  }
  
  endShape(CLOSE);
}
