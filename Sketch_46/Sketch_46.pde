void setup(){
  size(640, 640);
  stroke(0, 250, 255);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  for(int x = -23; x < 25; x++){
    for(int y = -23; y < 25; y++){
      
      
      fill(0, 250, 255);
      if (dist(x, y, 0, 0) < 20) {
      pushMatrix();
      translate(x*10, y*10);
      rotate(radians(sin(radians(x*y+frameCount))*180));
      rect(x, y, 5, 5);
      line(-10, 40, 10, 40);
      popMatrix();
      
      if (mousePressed) {
      
      rotate(radians(sin(radians(x*y+frameCount))*180));
      
      }
     } 
    }
   }
  }
