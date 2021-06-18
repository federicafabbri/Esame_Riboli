PGraphics pg; 
int distanza = 1; 
float xoff, yoff, yoff2; 
float incremento = 0.2/10;
float incrementoY = 0.4/10;
float incrementoY2 = 0.4;
float xoffB, yoffB; 
float incrementoB = 00.01;

float xoffG, yoffG; 
float incrementoG = 00.01;

float xoffR, yoffR; 
float incrementoR = 00.01;

float shiftX = map(noise(xoff, yoff),0,1,-30,30);
     

void setup() {
  size(800, 600);
  PFont schrift = createFont("BagnardSans.otf", 800);
  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.textFont(schrift);
 pg.textAlign(CENTER, CENTER);
 pg.textSize(240);
 pg.background(0, 0, 1);
 pg.fill(0);
 pg.text("Waves", pg.width/2, 250);
 pg.endDraw();
 noLoop();
}

void draw() {
background(0,200,200);
  
  
  for (int y = 0; y < 500; y = y + distanza) 
  { 
     yoff = yoff + incrementoY;
     yoff2 = yoff2 + incrementoY2;
     yoffB = yoffB + incrementoB;
    yoffG = yoffG + incrementoG;
    yoffR = yoffR + incrementoR;
     xoff = 0;
      xoffG = 0;
    xoffR = 0;
    xoffB = 0;
    for (int x = 0; x < 800; x = x + distanza) 
    {   
      xoff = xoff + incremento;
       xoffB = xoffB + incrementoB;
      xoffG = xoffG + incrementoG;
      xoffR = xoffR + incrementoR;
      if ( y >= 0 && y <= 800) 
      {
        distanza = (y/1000)+2;
      }
     
      
      if (pg.get (x, y) == color(0)) 
      {
        float shiftX = map(noise(xoff, yoff),0,1,-30,30);
        float shiftY = map(noise(xoff, yoff),0,1,-70, 70);
        float shiftY2 = map(noise(xoff, yoff2),0,1,-50, 50);
   
  
       fill(255,140);
       
        noStroke();
        rect (x + shiftX, y + shiftY, 2, 2);
        fill(0,0,200,20);
        rect (x+shiftX , y+shiftY2 , 2, 2);
      }  
   
      { 
      }     
    }

  }}
