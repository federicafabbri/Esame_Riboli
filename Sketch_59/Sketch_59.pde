PImage paesaggio;
void setup() {
  paesaggio = loadImage("girasoli.jpg");
  size(800, 600);
  background(255);
  paesaggio.loadPixels();
}

void draw() {
  translate(width/2, height/2);
  int index = 0;
  for (int y = 0; y < paesaggio.height; y+=1) {
    for (int x = 0; x < paesaggio.width; x+=1) {
      int prob = (int)random(200);
      if (prob < 1) {
        color colori_pixel = paesaggio.pixels[index];
       colori_pixel = color(red(colori_pixel), green(colori_pixel), blue(colori_pixel), 100);
        pushMatrix();
        translate(x-paesaggio.width/2, y-paesaggio.height/2);
     painting(20, colori_pixel, (int)random(1, 30));
        popMatrix();
      }
      index += 1;
    }
  }
}

void painting(float lunghezza_traccia, color colore_traccia, int spessore_traccia) {
  float stepLength = lunghezza_traccia/7.0;
  float prob = random(1.0);
  
  if (prob < 1.5) {
    float a = random(lunghezza_traccia, -lunghezza_traccia);
    float b = random(lunghezza_traccia, -lunghezza_traccia);
 
  noFill();
  stroke(colore_traccia);
  strokeWeight(spessore_traccia);
  curve(a, -stepLength*2, 100, -stepLength, 0, stepLength, b, stepLength*2);
  int z = 1;
  for (int num = spessore_traccia; num > 0; num --) {
   
    color newColor = color(red(colore_traccia), green(colore_traccia), blue(colore_traccia), random(100, 255));
    stroke(newColor);
    strokeWeight((int)random(0, 3));
    curve(a, -stepLength*2, z-spessore_traccia/2, -stepLength*random(0.9, 1.1), z-spessore_traccia/2, stepLength*random(0.9, 1.1), b, stepLength*2);
    z += 3;
  }
}}
