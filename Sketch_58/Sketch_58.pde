int startDiam = 3;
int diam = startDiam;
int arcStep = 1;
int speedGrow = 3;
int maxAngle = 360;
int cx;
int cy;
color [] arcClr = new color[maxAngle]; 
PImage img;

void setup() {
  img = loadImage("Gerry Scotti.jpg");
  size(600, 600);
  img.resize(600, 600);
  image(img, 0, 0);
  frameRate(300);
}

void draw() {
  if (mousePressed && mouseButton == LEFT) {
    arcCircle((int)mouseX, (int)mouseY, diam+=speedGrow, arcStep);
    cx = (int)mouseX;
    cy =(int)mouseY;
  } else if (mousePressed && mouseButton == RIGHT ) {
    image(img, 0, 0);
  } else {
    diam = startDiam;
  }
  
  float tiles = mouseX / 2;
    float tileSize = width / tiles;
    translate(tileSize / 2, tileSize / 2);
    for (int x = 0; x < tiles; x++) {
        for (int y = 0; y < tiles; y++) {
            int c = img.get(int(x * tileSize), int(y * tileSize));
            float size = map(brightness(c), 0, 255, tileSize, 0);
          fill(255, 251, 184);
            rect(x * tileSize, y * tileSize, size, size);
          }}
}

void keyPressed() {
  if (key == 's') {
    saveFrame("img-###" + (int)random(100, 700) +".jpg");
  } 
      }

void arcCircle(int cirlX, int cirlY, int diamRaduis, int arcStep) {
  int angle = 0;
  int speed = arcStep;
  int arcRadius = diamRaduis/2;
  int x, y;

  noStroke();
  fill(255);

  while (angle< maxAngle) {
    x = int(cirlX + cos(radians(angle)) * arcRadius);
    y = int(cirlY + sin(radians(angle)) * arcRadius);
 
    {
      x = min(max(x, 1), img.width-1);    
      y = min(max(y, 1), img.height-1); 
      color clr = img.get(x, y);
      arcClr[angle] = clr;
    }

    fill(arcClr[angle]);
    float radSrt = radians(angle);
    float radEnd = radians(angle+arcStep);
    arc(cirlX, cirlY, diamRaduis, diamRaduis, radSrt, radEnd);
    arc(cirlX, cirlY, diamRaduis, diamRaduis, radSrt, radEnd);
    angle += speed;
  }
}
