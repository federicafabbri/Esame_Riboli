PImage src, img, sel;
int x, y, w, h;
boolean painting = false;

void setup() {
size(800, 800);
rectMode(CORNERS);
src = loadImage("munari.jpg");
src.resize(width, height);
img = src.get();
}

void draw() {
image(img, 0, 0);

if (mousePressed) {
if (painting) {
int xDist = abs(mouseX-pmouseX);
int yDist = abs(mouseY-pmouseY);
int steps = max(xDist, yDist);
for (int i=0; i<steps; i++) {rotate(random(0,360));
float lerpX = lerp(pmouseX, mouseX, (1.0/steps)*i);
float lerpY = lerp(pmouseY, mouseY, (1.0/steps)*i);
image(sel, lerpX-(x), lerpY-(y));
}
img = get();
} else {
stroke(255,0,0);
strokeWeight(3);
fill(255,0,0,90);
rect(x, y, mouseX, mouseY);
}
}
}

void mousePressed() {
if (!painting) {
x = mouseX;
y = mouseY;
} else {rotate(random(0,360));
x = mouseX-x;
y = mouseY-y;
rotate(random(0,360));
}
}

void mouseReleased() {
if (mouseX!=x && mouseY!=y && !painting) { 
w = abs(x-mouseX);
h = abs(y-mouseY);
if (mouseX < x) x = mouseX;
if (mouseY < y) y = mouseY;
sel = src.get(x, y, w, h);
painting = true;
} else {
painting = false;
}
}
