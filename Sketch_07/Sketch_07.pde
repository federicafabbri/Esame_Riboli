PImage img; 

void setup() {
  size(800, 600); 
  img = loadImage("Johnson_Tsang.jpg");
  img.resize(800, 600);
}

void draw() {
  background(255);
  fill(0,0,255);
  noStroke();

  float tilesX = map(mouseX, 0, width, 1, 250);
  float tileSize = width / tilesX;
  for (int y = 0; y < img.height; y += tileSize) {
    for (int x = 0; x < img.width; x += tileSize) {
      color c = img.get(x, y);
      float b = map(brightness(c), 0, 255, 1, 0);
      pushMatrix();
      translate(x, y);
      rotate (random(360));
      rect(0, 0, b * tileSize, b * tileSize);
      popMatrix();
    }
  }
}
