int bg = 30;
int verts = 100;
float xoff = 100;
float yoff = -300;
float scale = 150;
float ringsspace = 8;
float e = 150;
float ee = 2;
float ringx = -(scale + e);
float z = 8;
int[][] colar = {

  { color(44, 62, 80), color(253, 116, 108)}, 
  { color(255, 0, 0), color(255, 160, 0)  }, 
  { color(32, 0, 44), color(203, 180, 212)}, 
  { color(0, 100, 230), color(160, 0, 255)  }, 
  { color(55, 220, 60), color(0, 221, 195)  }, 
  { color(131, 96, 195), color(46, 191, 145) }, 
  { color(255, 153, 102), color(255, 94, 98)  }, 
  { color(218, 68, 83), color(137, 33, 107) }, 
  { color(99), color(162, 171, 88) }, 
  { color(201, 75, 75), color(75, 19, 79)   }, 
  { color(54, 209, 220), color(91, 134, 229) }, 
  { color(189, 195, 199), color(44, 62, 80)   } 

};

int fg1, fg2;

void initScheme() {
  int[] scheme = colar[floor(random(0, colar.length))];
  if (round(random(1)) == 0) {
    fg1 = scheme[0];
    fg2 = scheme[1];
  } else {
    fg1 = scheme[1];
    fg2 = scheme[0];
  }
}

void setup() {
  fullScreen();
  background(bg);
  stroke(255);
  pixelDensity(displayDensity());
  noFill();
  strokeWeight(2);
  initScheme();
  smooth();
}

void draw() { 
  stroke(lerpColor(fg1, fg2, ringx / width));
  beginShape();
  for (int i = 0; i < verts; i++) {
    PVector vert = PVector.fromAngle((float) i / verts * TWO_PI);
    vert.mult(scale + noise((vert.x + xoff) * ee, (vert.y + yoff) * ee) * e);
    curveVertex(vert.x + ringx, vert.y + height * noise(z));
  }
  endShape(CLOSE);
  xoff += 0.01;
  yoff += 0.01;
  ringx += ringsspace;
  z += 0.01;
  if (ringx > width + (scale + e)) {
    ringx = -(scale + e);
    delay(2000);
    background(bg);
    initScheme();
  }
}
