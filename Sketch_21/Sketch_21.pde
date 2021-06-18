int fps = 15;
float seconds = 50;
boolean export = true;
int frames = int(fps*seconds);
float time = 0;
int cycle = 0;


void setup() {
  fullScreen ();
  background(0);
}

void draw() {
  if (export) {
    time = map((frameCount-1)%frames, 0, frames, 0, 20);
    cycle = int((frameCount-1)/frames);
  } 
  render();
}

void render() {
  translate(width*(0.5+cos(time*TAU)*0.03), height*(0.5+sin(time*TAU)*0.03));
  background(0);
  blendMode(ADD);


  int cc = 180;
  float da = TAU/cc;
  float r = width*0.25;
  noStroke();
  rectMode(CENTER);
  for (int i = 0; i < cc; i++) {
    float a = da*(i+time)+TAU*time;
    float s = 320*(cos(time*TAU+da*i*4)*0.8+0.2);
    pushMatrix();
    translate(cos(a+time*TAU)*r, sin(a+da*i+time*TAU)*r);
    float alp = 10;
    fill(getColor((time*2+i*(1.0/cc))*colors.length*2), alp);
    ellipse(0, 0, s*2, s*2);
    popMatrix();
  }
}

int colors[] = {#E01919, #966432, #E9EEF2, #D893AC, #1B2FA5};
int rcol() {
  return colors[int(random(colors.length))];
}

int getColor() {
  return getColor(random(colors.length));
}

int getColor(float v) {
  v = abs(v); 
  v = v%(colors.length); 
  int c1 = colors[int(v%colors.length)]; 
  int c2 = colors[int((v+1)%colors.length)]; 
  return lerpColor(c1, c2, v%1);
} 
