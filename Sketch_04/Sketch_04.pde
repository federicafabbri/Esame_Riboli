float theta;
float diam = 70;
int num = 15;


void setup() {
  
  size(600, 600);
  background(255);
  noFill();
}


void draw() {
  background(0);
  stroke(255);
  strokeWeight(diam/1);
  float y = height/2;

  for (int i=1; i<num+1; i++) {
    float x = map(sin(theta), -1, 1, 0, width*50);    
    
    strokeWeight(random(diam/9));
    ellipse(x, y, i*diam, i*diam*diam);
    ellipse(width-x, y, i*diam*diam, i*diam);
  }
  theta += 0.0223/5;
  
  
}
