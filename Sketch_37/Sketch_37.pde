float swirlDensity = 0.1;
float swirlResolution = 0.08;

float swirlAngle = 50;
float magnification = 0;
PVector pre = new PVector(0, 0);
PVector neo = new PVector(0, 0);

void setup() {
   
    size(800, 800);
    background(0);
    stroke(255);
    strokeWeight(1);
}

void draw() {
  frameRate(255);
    translate(width/2, height/2);
    neo = PVector.fromAngle(swirlAngle);
    neo.mult(magnification);
   
    strokeWeight(1);
    line(pre.x, pre.y, neo.x, neo.y);
    magnification += swirlDensity;
    swirlAngle += swirlResolution;
    
    if (mousePressed == true) {
        stroke(random(255), random(255), random(255));
        
    }}
    
    void keyPressed () {
    
    if (key == ' ') {
    stroke (255);
        
  }
    
}
