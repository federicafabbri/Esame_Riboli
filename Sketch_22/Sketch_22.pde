ArrayList<PVector> particles;
float minAngle = PI*2.5;
float maxAngle = PI*2.5;
float resolution = random(10, 150);
float det = random(0.001);

void setup() {  
  size(1280, 720);
  smooth(4);
  background(0);
  reset();
}

void draw() {
  noStroke();
  fill(0, 4);
  rect(0, 0, width, height);
  stroke(50, 80, (random(100, 250)));
  strokeWeight(3.5);
  for (int i = 0; i < particles.size(); i++) {
    PVector p = particles.get(i);
    float px = p.x;
    float py = p.y;
    float a = getAngle(px, py);

    p.x += cos(a);
    p.y += sin(a);
  }

  beginShape(POINTS);
  for (int i = 0; i < particles.size(); i++) {
    PVector p = particles.get(i); 
    vertex(p.x, p.y);
  }
  endShape();
}

float getAngle(float x, float y) {
  float dr = 1./resolution;
  float noi = noise(x*det, y*det)*(1)+dr*0.7;
  noi -= noi%dr;
  float aux = map(noi, 0, 1, minAngle, maxAngle);
  return aux;
}
void reset() {
  particles = new ArrayList<PVector>();
  for (int i = 0; i < 1200; i++) {
    particles.add(new PVector(random(width), random(height)));
  }
}
