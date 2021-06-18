import geomerative.*;

RShape   grp;
RShape   rect;

boolean ignoringStyles = false;

void setup(){
  size(600, 600);
  smooth();
  frameRate(25);

  
  RG.init(this);
  
  grp = RG.loadShape("M.svg");

  RG.setPolygonizer(RG.ADAPTATIVE);
  RG.setPolygonizerAngle(0.065);
  grp = RG.polygonize(grp);
    
  rect = RG.getRect(0, 0, 20, 20);
  rect = RG.centerIn(rect, g, 200);  
}

void draw(){
  translate(width/2, height/2);
  background(#fcb08b);

  noFill();
  stroke(0, 0);
  
  float t = map(mouseX, 0, width, 0.01, 1);
  RShape rectSeg = RG.split(rect, t)[0];
  
  RG.setAdaptor(RG.BYPOINT);
  RShape adaptedGrp = RG.adapt(grp, rectSeg);
  
  RG.shape( adaptedGrp );
  RG.shape( rectSeg );
}
