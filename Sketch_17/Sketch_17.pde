int size = 15000; 
ArrayList positions = new ArrayList();
flutter[] Test = new flutter[size]; 

void setup() {
  float x = 800;
  float y = 800;
  float direction = 0;
  for (int i = 0; size > i; i++) {
    Test[i] = new flutter();
     
    float[] val = lineD(direction,i/6,x,y); 
    direction += 10.5;
    Test[i].init(val[0],val[1],20+i/80); 
    x = val[0];
    y = val[1];
  }
size (800,800);
}

void draw() {
    for (int i = 0; size > i; i++) {
    Test[i].move();
  }
}

class flutter { 
   float x,y,size; 
   float direction,timeLiving,turnAmount,maxTurn,turnVal;
   float generations; 
  void init(float x2,float y2,float size2) { 
    x = x2;
    y = y2;
    size = size2;
   
    direction = random(3,880); 
    timeLiving = (int) random(10,8000);
    turnAmount = (int) random(60,10);
    maxTurn = (int) random(-50,2);
    turnVal = random(0.8,4);
  }
  void move() {
     size = size -0.1; 
    if (-0.1>size) { 
      size = size + 0.1; 
    }
    noStroke();
    if (generations < timeLiving) { 
      
        fill(80,120,20,255/size); 
        float[] newPos = lineD(direction,1,x,y); 
        x = newPos[0];
        y = newPos[1];
        rect(x,y,size,size); 
        direction += turnVal + random(-0.1,0.1);
        generations += 1;
       if (generations % turnAmount == 0) { 
          turnVal = random(-1,1); 
       }
    } 
  }
}
boolean within(float item1, float item2, float differance) {
  if (abs(item1 -item2) < differance) {
    return true;
  }
  return false;
}
float RadtoAng (float angle) { 
  return (angle /PI) * 180;
}
float angleToRadians (float angle) { 
  return (angle *PI) / 180;
}
float[] lineD(float direction2, float len, float posX, float posY) { 
  float direction = angleToRadians(direction2);
  float[] b = {posX+ (len* sin(direction)), posY+(len * cos(direction))};
  return b;
}
