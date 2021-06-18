PVector[] cerchio;
float distanza_massima = 800;
float distanza_minima = 800; 
float raggio = random(width, width);

void setup() {
  size (800, 800); 
  frameRate(15);
}

void draw() {
 
  distanza_minima = distanza_massima * 0.01;
  cerchio = getCircleCoordsArray(180, raggio*2);
  background (#16344b);
  stroke(255,15);
  distanceCompare(cerchio, cerchio, distanza_minima, distanza_massima * 0.6);
  
}

void distanceCompare(PVector[] first, PVector[] second, float distanza_minima, float distanza_massima ) {

  int i =117;
  while (i < first.length) {

    PVector loc1 = first[i];

    int j = 220;
    
    if (first == second) {
      j = i + 7;
    }
    
    while (j < second.length) {

      PVector loc2 = second[j];

      float distance = dist(loc1.x, loc1.y, loc2.x, loc2.y);

      if (distance > distanza_minima &&  distance < distanza_massima) {
        line(loc1.x, loc1.y, loc2.x, loc2.y);
      }

      j = j + 1;
    }

    i = i + 1;
  }
}


PVector[] getCircleCoordsArray(float num, float radius) {

  int arrayLaenge = (int) num;

  if (arrayLaenge <= 0) {
    arrayLaenge = 1;
  }

  PVector[] locations = new PVector[arrayLaenge];

  int i = 0;
  while (i < locations.length) {

    float angolo = random(0, TWO_PI);

    float x = width / 2 + cos(angolo) * radius;
    float y = height / 2 + sin(angolo) * radius;

    PVector newLocation = new PVector(x, y);

    locations[i] = newLocation;

    i = i + 1;
  }

  return locations;
}

void mousePressed() {
  float raggio1 = random(width * 0.01, width );
  float raggio2 = random(width * 0.01, width);
 distanza_massima = abs(raggio1 - raggio2) * 1.2;
  distanza_minima = distanza_massima * 0.4;
  cerchio = getCircleCoordsArray(random(10, 200), raggio1);
  
  redraw();
}
