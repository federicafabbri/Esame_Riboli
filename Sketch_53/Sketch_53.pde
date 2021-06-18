float rotazione = 0;
float raggio = 0;
float elementi = 100;
float espansione = 250;
float tempo = 0;
float raggio_flusso = 0;
float rotazione_flusso = 0;
float colore_flusso = 0;

void setup() {
  fullScreen();
}
 
void draw() {
  background(0);
  setFlows();
  raggio = map(raggio_flusso, 0, width, 0, 10);
  rotazione = map(rotazione_flusso, 0, height, 0, 10);
  float spacing = PI/elementi ; 
  translate(width*0.5,height*0.5);
  noFill();
  strokeWeight(4);
  for (int i = 0; i < elementi;i++) {
      strokeWeight(i*5);
      stroke((i+colore_flusso)%255,255,255,i/10);
      pushMatrix();
      rotate(spacing*i*rotazione);
      translate(sin(spacing*i*raggio)*espansione, 0);
      ellipse(0,0,35,i);
      popMatrix();
  }
}

void setFlows() {
  colorMode(HSB);
  tempo += 0.4;
  raggio_flusso = sin(tempo/77)*750;
 colore_flusso = sin(tempo/111)*120+300;
 
}
