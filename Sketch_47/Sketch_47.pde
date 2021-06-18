float s = 10;
int n = 32;

void setup() {
  size(640, 640);
  fill(255, 0, 150);
}

void draw() {
  background(0);
  translate(width/8, height/8);
  for (int x = n/2; x < width; x+=n) {
    for (int y = n/2; y < height; y+=n) {
      
      float angle = sin(radians(dist(x, y, width/2, height/2)+frameCount)) * cos(dist(x, y, width/2, height/2))*n;
      
      strokeWeight(map(sin(radians(dist(x, y, 0, 0)*2+frameCount*15)), -1, 1, 1, s));
      pushMatrix();
      scale(1.5);
      translate(x/2, y/2);
      rotate(radians(angle+(angle)));
      
      
      if (mousePressed == true) {
      triangle(-s, s, 0, -s, s, s);
      rotate(radians(x*angle+(y*angle)));
       } 
      else {
      triangle(0, 0, 0, -s, s, s);
      rotate(radians(angle+(angle)));
       }
       
        if (keyPressed == true) {
      triangle(-s, s, 50, -s, s, s);
      
       } 
     
      popMatrix();
      
    }
  }
}
