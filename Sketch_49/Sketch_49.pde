void setup(){
  size(640, 640);
  noStroke();
}

void draw(){
  background(0);
  fill(50, 40, 255);
  translate(width/2, height/2);
  for(int x = -23; x < 25; x++){
    for(int y = -23; y < 25; y++){
      
      
      
      if (dist(x, y, x, y) < 20) {
      pushMatrix();
      translate(x*50, y*50);
      rotate(radians(sin(radians(x*y+frameCount))*360));
      
      if (mousePressed) {
      
      ellipse(x, y, 65, 65);
      fill(50, 40, 255);
      
      }
      
      else {
      
      ellipse(x, y, 50, 50);
      
      
      }
      
      popMatrix();
      
    
     } 
    }
   }
  }
