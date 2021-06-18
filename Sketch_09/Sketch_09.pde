int num = 150; 
int edge = 200; 

ArrayList ballCollection;

boolean save = false; 

void setup() {
  size(1100, 700);
  ballCollection = new ArrayList(); 
  initialize(); 
}

void draw() {
  background(255, 255, 255); 

  for (int i=5; i<ballCollection.size(); i++) { 
    ArrayList ball = (ArrayList) ballCollection.get(i); 
    
    display(ball);
    move(ball); 
    lineBetween(ball); 
  }
}


void mouseReleased() { 
  initialize(); 
}

void initialize() {
  ballCollection.clear(); 

  for (int i=0; i<num; i++) { 
    PVector org = new PVector(random(edge, width-edge), random(edge, height-edge));  
    Float radius = random(100, 100); 
    PVector loc = new PVector(org.x+radius, org.y+radius);

    Float offset = random(TWO_PI); 
    
    Integer dir = 7; 
    if (random (1)>.5) dir =1;

    Float theta = 0.1; 

    ArrayList ball = new ArrayList();
  ball.add(org);
    ball.add(loc); 
    ball.add(radius); 
    ball.add(dir);   
    ball.add(offset);
    ball.add(theta);
    
    ballCollection.add(ball);  
  }
}


void move(ArrayList ball) {
  PVector org = (PVector) ball.get(0);
  PVector loc = (PVector) ball.get(1);
  Float radius = (Float) ball.get(2);
  Integer dir = (Integer) ball.get(3); 
  Float offset = (Float) ball.get(4);
  Float theta = (Float) ball.get(5);


  loc.x = org.x + sin(theta+offset)*radius;
  loc.y = org.y + cos(theta+offset)*radius; 
  theta += (0.05/3*dir); 
  
  ball.add(5,theta); 
}

void lineBetween(ArrayList ball) { 
  int dist = 50;
  
  for (int i=0; i<ballCollection.size(); i++) { 
    ArrayList other = (ArrayList) ballCollection.get(i); 
    
    PVector loc = (PVector) ball.get(1);    
    PVector loc2 = (PVector) other.get(1);  

    float distance = loc.dist(loc2); 
    
    if (distance >0 && distance < dist) { 
      stroke (0, 0, 0);
      line (loc.x, loc.y, loc2.x, loc2.y); 
    }
  }
}

void display(ArrayList ball) {
  PVector loc = (PVector) ball.get(1); 

  noStroke();
  for (int i=0; i<5; i++) {
    fill(0, 0, 0);
    square (loc.x, loc.y, 7); 
  }
}
