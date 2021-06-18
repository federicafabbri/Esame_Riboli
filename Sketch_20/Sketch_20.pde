PImage fondale_marino;
int w = 700;
int h = 700;

void setup(){
  size(700, 700);
  fondale_marino = loadImage("fondale_marino.jpg");
}

void draw() {
 
  fondale_marino.loadPixels();
    
  for (int i = 0; i < fondale_marino.width; i++) {
    for (int j = 0; j < fondale_marino.height - 1; j++) {
      color c = fondale_marino.pixels[j * fondale_marino.width + i];
      int nj = j + 1;
      color nc = fondale_marino.pixels[nj * fondale_marino.width + i];
      float bc = brightness(c);
      float bnc = brightness(nc);
      float t = 50 - noise(i,j) * 25;
      
      if (bc > t && bc > t && bc < bnc) {
       fondale_marino.pixels[j * fondale_marino.width + i] = nc;
       fondale_marino.pixels[nj * fondale_marino.width + i] = c;
      }
    }
  }
  
  fondale_marino.updatePixels();
  image(fondale_marino, 0, 0, w, h);
}
