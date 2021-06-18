String [] city = {"Roma?","Milano?","Torino?","Genova?","Venezia?","Napoli?", "Palermo?"};
String textHolder= "Dove vorresti andare?";

void setup () {
frameRate(2);
size (800,800);
println(city.length);

}

void draw () {
  
  
  textSize (random (20,40));
 background (0);
 
 for (int i=0; i<800; i++){
 
 text (textHolder, random(800), 2.9*i+ i*30);
}}

void keyPressed() {
   if (key == 'R') {
  textHolder= city [0];}
    if (key == 'M') {
  textHolder= city [1];}
  if (key == 'T') {
  textHolder= city [2];}
    if (key == 'G') {
  textHolder= city [3];}
  if (key == 'V') {
  textHolder= city [4];}
  if (key == 'N') {
  textHolder= city [5];}
   if (key == 'P') {
  textHolder= city [6];}

}
