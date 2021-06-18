PGraphics pg;
int distanza = 19; 
float xoff, yoff;
float incremento = 0.6/10;

void setup() {
  size(800, 800);
  PFont schrift = createFont("Menlo-Regular.ttf",100);
  pg = createGraphics(width, height);
 pg.beginDraw();
  pg.textFont(schrift);
  pg.textAlign(CENTER, CENTER);
  pg.textSize(200);
  pg.background(255);
  pg.fill(0);
 pg.text("Glitch", pg.width/2, width/2);
  pg.endDraw();
  noLoop();
}

void draw() {
  background(255);
  noFill();
  yoff= 0;
  for (int y = 0; y < 800; y = y + distanza) 
  { 
     yoff = yoff + incremento;
     xoff = 0;
    for (int x = 0; x < 800; x = x + distanza) 
    {   
      xoff = xoff + incremento;
      if ( y >= 0 && y <= 800) 
      {
      distanza = (y/2000)+1;
      }
      
      if (pg.get (x, y) == color(0)) 
      {
        float shiftX = map(noise(xoff, yoff),0,1.1,-30,30);
        float shiftY = map(noise(xoff, yoff),0,1.1,-60,60);

    noStroke();
        
        fill(0,255,0);
        ellipse (x + shiftX, y + shiftY, 2.3, 2.3);

      }  
      
      {
       
      }     
    }

  }
}
