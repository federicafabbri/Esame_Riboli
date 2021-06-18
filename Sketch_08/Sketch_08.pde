float x=300;
float y= 300;
float angle=90;
float dia = 20;

void setup () {
size (900,900);

}

void draw  () {
background (0);
translate (width/2, height/2);
rotate (radians(angle/3));
for (float a=0; a<360; a+=10) {

  pushMatrix ();
if (angle <272) rotate (radians (a)*sin (radians (angle)));
else rotate (radians(a));
stroke(255);
strokeWeight(3);
line(x*sin(radians(angle)),0,0,y-dia/2);

  fill(0);
  stroke(255,0,0);
  float rad = 100;
for(int b = 0; b<360; b+=9){
   float xoff = cos(radians(b))*rad;
       float yoff = sin(radians(b))*rad;
      
       ellipse(width/2+xoff,height/5+yoff, 2, 2);
        
   } 
   
    fill(0);
  stroke(255,0,0);
  float radi = 100;
for(int b = 0; b<360; b+=20){
   float xoff = cos(radians(b))*radi;
       float yoff = sin(radians(b))*radi;
      
      
        ellipse(width/7+xoff,height/7+yoff, 2, 2);
   } 
   
noStroke ();
fill (255,0,0);
rectMode (CENTER);
rect (x*sin (radians(angle)), 0, dia/2, dia/2);
stroke (255);
noFill();
rect (0,y,dia,dia);
popMatrix ();
   
}

angle++;
}
