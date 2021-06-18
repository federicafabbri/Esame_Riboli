ArrayList<Particle> particles;
int[] list;
PVector axis;
float distance;
PFont font;
int count, max;
String textHolder = "TYPE";

void setup() {
  size(800,600);
  background(255,250,245);
  strokeCap(SQUARE);
  frameRate(90);
  stroke(255);
  strokeWeight(1);
  distance = 40;
  particles=new ArrayList<Particle>();
  count=0;
  max=300;
  
  font = createFont("YoungSerif-Regular.otf", 200);
  textFont(font);
  fill(0);
  textAlign(CENTER,CENTER);
  text(textHolder, width/2, height/2-60);
  list = new int[width*height];
  loadPixels();
  for(int y = 0; y<=height-1; y++){
    for(int x = 0; x<=width-1; x++){
      color pb = pixels[y*width+x];
      if(red(pb)<5){  list[y*width+x]=0;  }
      else {  list[y*width+x]=1;  }}}
  updatePixels();
}

void draw() {
  if(count<max){
    int i=0;
    while(i<0.5){
      axis = new PVector(int(random(100,width-100)),int(random(100,height-100)));
      if(list[int(axis.y*width+axis.x)]==0 && list[int(axis.y*width+axis.x+1)]==0 && 
      list[int(axis.y*width+axis.x-1)]==0 && list[int((axis.y+1)*width+axis.x)]==0 && 
      list[int((axis.y+1)*width+axis.x)]==0){
      particles.add(new Particle(axis.x,axis.y));
      i++;
      count++;
      }
    }
  }
  
  background(0);
  
    
  for (int i = 0; i < particles.size(); i++) {
    Particle p=particles.get(i);
 
    for(int j=i+1;j<particles.size();j++){
      Particle pp=particles.get(j);
      if (dist(p.location.x , p.location.y , pp.location.x , pp.location.y) < distance) {
        line(p.location.x , p.location.y , pp.location.x , pp.location.y);
      }
    }
  }
}


class Particle {
  PVector location;
  PVector velocity;

  Particle(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector(random(1),5);
    
     
  }
  
 
  }
