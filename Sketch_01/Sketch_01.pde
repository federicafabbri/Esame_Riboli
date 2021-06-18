PImage img;

void setup() {
  frameRate(1200);
  size(800, 800);
  img = loadImage("farfalla.jpg");
  img.resize(width, height);
  background(0);
}


void draw() {

  float dimensione = (random(15));
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
  
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();

  fill(r,g,b,120);
  ellipse(x,y,dimensione,dimensione);
 rectMode (CENTER);
 rect(x+dimensione/2,y+dimensione/2,dimensione,dimensione);

}
