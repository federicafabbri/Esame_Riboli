PGraphics pg;
int nHor, nVer;
float gridSpacingHor, gridSpacingVer;
float r, r_;

void setup() 
{
  size(1000, 800);
  frameRate(30);
  background(255);

  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.textSize(width/3.8);
  pg.textAlign(CENTER, CENTER);
  pg.fill(0);
  pg.text("SPRAY", pg.width/2, pg.height/2); 
  pg.endDraw();

  nHor = 180;
  nVer = 180;
  gridSpacingHor = float(width) / nHor;
  gridSpacingVer = float(height) / nVer;
  r = min(gridSpacingHor, gridSpacingVer);
}

void draw() 
{
  fill(255, 60);
  noStroke();

  for (int y=0; y<nVer; y++) 
  {
    for (int x=0; x<nHor; x++) 
    { 
      float e_x = x * gridSpacingHor;
      float e_y = y * gridSpacingVer;

      color c = pg.get(int(e_x), int(e_y));

      boolean textDrawn = (c == color(0));

      if (textDrawn == true)
      {
        fill(0, 200);
        r_ = r/2.5 * cos(frameCount * 0.01);
        pushMatrix();
        translate(e_x, e_y);
        rotate(random(360));
        if (random(1) < 0.2) ellipse(30 * sin(frameCount * 0.01), random(-10, 10), r_ * 1.2, r_ * 1.2);
         noFill();
   popMatrix();
      }
    }
  }
}
