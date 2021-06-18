import geomerative.*;

RShape shp1;
RShape shp2;
RShape shp3;
RShape cursorShape;

void setup()
{
  size(860, 640);

  RG.init(this);

  shp1 = RG.loadShape("Hide.svg");
  shp2 = RShape.createCircle(0, 0, 100);

  shp1.centerIn(g);
}

void draw()
{
  background(255);    
  translate(width/2, height/2);

  cursorShape = new RShape(shp2);
  cursorShape.translate(mouseX - width/2, mouseY - height/2);

  shp3 = RG.intersection( shp1, cursorShape );

  strokeWeight( 3 );

  if (mousePressed) {

    RG.shape(shp1);

    fill( 0, 80 );
    stroke( 0 );
    RG.shape(cursorShape);
  } 
  else {
    RG.shape(shp3);
  }
}
