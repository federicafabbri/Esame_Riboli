int margin = -50;
int dotCount = 25;
float dotSize = 80;
int dotSpacing;

void setup() {
  size(800, 800);
  dotSpacing = (width - 2 * margin) / dotCount;
}

void draw() {
  background(255);
  frameRate(10);
  
  dotSize = mouseX / 5.0;
  
  for (int i = 0; i < dotCount; i++) {
    for (int n = 0; n < dotCount; n++) {
       fill(255, 50 - dotSize);
       ellipse(n * dotSpacing + margin, i * dotSpacing + margin, dotSize, dotSize);
       rotate(random(360));
    }
  }


if (mousePressed == true) {
  background(0);
  stroke(255);
  dotSize = mouseX / 5.0;
  for (int i = 0; i < dotCount; i++) {
    for (int n = 0; n < dotCount; n++) {
       fill(0, 50 - dotSize);
       ellipse(n * dotSpacing + margin, i * dotSpacing + margin, dotSize, dotSize);
       rotate(random(360));
    }
  }
   }
 else {
   stroke(0); }
 }
