class scia{
  float x,y;
 scia (float x_,float y_) {
    x = x_;
    y = y_;
  }
  void run() {
   noStroke();
    ellipse(x,y,15,15);
  }
}
class pendulum {
  float theta,thetaMax, l,g, t;
  float x, y;
  float[] rgb  = {random(0,150),random(200,250),random(0,150)};
   float[] rgb2  = {random(200,250),random(0,150),random(200,250)};
   ArrayList<scia> a = new ArrayList();
  pendulum(float x_, float y_) {
    x = x_;
    y = y_;
    theta = 0;
    thetaMax = radians(360);
    l = 50 + random(150);
    g = 200;
    t = random(4.);
    for (int i = 0; 10 > i; i++) {
      a.add(new scia(0,0));
    }
    
  }
  void run() {
   
    theta = thetaMax * sin( radians(sqrt(l/g) * t) );
    stroke(rgb[0],rgb[1],rgb[2],100);
    strokeWeight (3);
    
    line(x,y,x + (sin(theta) * l), y + (cos(theta) * l) );
    fill(rgb2[0],rgb2[1],rgb2[2],random(120));
     for (int i = 0; a.size() > i; i++) {
      a.get(i).run();
    }
    a.remove(0);
    a.add(new scia(x+ (sin(theta) * l),y+ (cos(theta) * l)));
    ellipse(x + (sin(theta) * l),y + (cos(theta) * l),15,15);
    t+= 1.6;
    
  }
}

ArrayList<pendulum> a = new ArrayList();
void setup() {
  
 fullScreen();
  float w = width/2;
  for (int i = 0; 50 > i; i++) {
    
    a.add(new pendulum(w,random(height-100)));
    
  }
}
float r = 0.8;
void draw() {
  background(0);
blendMode(ADD);
  
  for (int i = 0; a.size() > i; i++) {
  a.get(i).run();
  }
}
