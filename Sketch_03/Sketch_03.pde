int num = 1660, frames = 130;
float theta, sz=3;

void setup() {
  size(540, 540);
  noStroke();
}

void draw() {
 
  fill(0, 45);
  rect(0, 0, width, height);
  for (int i=0; i<num; i++) {
    float offSet = TWO_PI/num*i;
    pushMatrix();
    translate(width/2, height/2);
    rotate(offSet);
    float x2 = map(sin(theta), -1, 1, -140, 220);
    float x = map(sin(theta+offSet*300), -1, 1, x2*x2, 150);
    fill(255);
    if (random(1)>.8) fill(0, 255, x2);   
    if (random(2)>1.2) fill(0, x2, 255);   
    if (random(1)>0.2) ellipse(x, x2, sz, sz);    
    popMatrix();
  }
  theta += TWO_PI/frames;

}
