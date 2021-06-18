int n = 150; 

float[] m = new float[n]; 
float[] x = new float[n];
float[] y = new float[n];
float[] vx = new float[n];
float[] vy = new float[n];
float[] redchannel = new float[n]; 
float[] bluechannel = new float[n];
float[] greenchannel = new float[n];
float[] shape = new float[n];

void setup() {
 background(0);
  size(800,800);
  reset();
}


void draw() {
  noStroke();
  fill(255);
  rectMode(CENTER);
  rect (width/2, height/2, width/2, height/2);

  for (int i = 0; i < n; i++) { 
    float dx = mouseX - x[i]; 
    float dy = mouseY - y[i];

    float d = sqrt(dx*dx + dy*dy); 
    if (d < 1) d = 0.5; 

    float f = cos(d * 0.08) * m[i] / d*2; 

    vx[i] = vx[i] * 0.9 - f * dx; 
    vy[i] = vy[i] * 0.9 - f * dy;
  }

  for (int i = 0; i < n; i++) {
    x[i] += vx[i];
    y[i] += vy[i];

    if (x[i] < 0) x[i] = width;
    else if (x[i] > width) x[i] = 0;

    if (y[i] < 0) y[i] = height;
    else if (y[i] > height) y[i] = 0;

    if (m[i] < 0) fill(bluechannel[i], greenchannel[i] , 255);
    else fill(255, bluechannel[i],redchannel[i]);
    
      if (shape[i] > 2) fill(bluechannel[i], greenchannel[i] , 255);
    else fill(255, bluechannel[i],redchannel[i]);
   

    if (shape[i] > 2)  rect(x[i], y[i],12,12);
else if (shape[i] > 1 && shape[i] <=2) rect(x[i],y[i],2,2);
else ellipse(x[i], y[i],12,12);
    
  }
}



void reset() { 
  for (int i = 0; i < n; i++) { 
    m[i] = randomGaussian() * 7; 
    x[i] = random(width);
    y[i] = random(height);
    bluechannel[i] = random(50);
    redchannel[i] = random(50);
    greenchannel[i] = random(50); 
    shape [i] = random(0,3); 
  }
}
