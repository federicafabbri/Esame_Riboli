PFont fontscelto;

void setup (){
size (600,600);
background(255);
frameRate(7);}


void draw () {
  translate (width/2,height/2);
fontscelto = createFont ("RobotoSlab-VariableFont_wght.ttf",5);
textFont (fontscelto,250);
background(255);
for (int i=0; i<800; i=i+400) {
for (int j=0; j<800; j=j+400) {
for (int k=0; k<7; k=k+1) {  
  
  fill ((random(100,255)),0,(random(100,255)),50);
  pushMatrix();
  textAlign (CENTER);
  rotate (random(360));
  text ("W", 0, 0);
  popMatrix ();
  
}}}}
