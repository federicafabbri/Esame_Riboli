void setup () {
  size(700, 700);
  frameRate(4); 
}
 
void draw () {
  background(255);
  fill(0,0,255,50);
  noStroke();
  
  int num = (int) map ((random(300,600)), 0,60, 130, (random (1000,2000)));
  int numRadius = (int) map((random(10,20)),(random (10, 60)),20,100,0);
  
   int i = 0;
  while (i < num) {
    float a = PI / num * i*2;
      float radiusAngle  = map (i, 0, num, 0, numRadius *TWO_PI);
    float radius = 20 + sin(radiusAngle) * (random(20,90));
    float x = width/2 + cos(a) * radius*2 ;
    float y = height/2 + sin(a) * radius*2 ;
    
    ellipse(x, y, 3, 3); 
      
    i = i + 1;
    
     if (mousePressed == true) {

     fill(255,0,0,90);
  }

  }
}
