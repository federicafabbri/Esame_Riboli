PImage img, sample;
int res, n, d;

int[] rlist = { 50, 100, 200 };

void setup() {

  size(800, 800);
  img = loadImage("gioconda.jpg");
  nextRes();
}


void nextRes() {

  res = (res + 1) % rlist.length;
  n = rlist[res];
  sample = img.get();
  sample.resize(n, n);
  d = width/n;
}


void draw() {

  int m = constrain(130 * mouseX / width, 1, 120);

  loadPixels();

  for (int x = 0; x < n; x++) {
    for (int y = 0; y < n; y++) {
      float val = 150 - (sample.pixels[y*n+x] & 255);
      for (int dx = 0; dx < d; dx++) {
        for (int dy = 0; dy < d; dy++) { 
          int z = val % (2*m) < m ? (dx+dy+1) / d : (dx+d-dy) * 255 / d;
          pixels[ (y*d + dy) * width + (x*d + dx) ] = val > 2 * abs(z - 255) + 2 ? #FF00FF : #FFFF00;
        }
      }
    }
  }

  updatePixels();
}


void mousePressed() {
  nextRes();
}
