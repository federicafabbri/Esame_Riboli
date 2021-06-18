int tsize = 41, 
    margin = 5, 
    tnumber = 90; 

int[][] link, 
        nlink; 

float idx;

PGraphics pg;
color bgcolor;  

void setup() {
  size(700, 700);  
  bgcolor = color(random(255), random(255), random(255));
  
  pg = createGraphics(tsize*tnumber + 2*margin, tsize*tnumber + 2*margin);
  
  link = new int[tnumber + 1][tnumber + 1];
  nlink = new int[tnumber + 1][tnumber + 1]; 
  
  for (int i = 0; i < link.length; i++)  {
    for (int j = 0; j < link[0].length; j++)  {
      link[i][j] = nlink[i][j] = 1;
    }
  }
  
  configTile();
  
  background(bgcolor);
}

void draw() {
 
  if (idx <= 1)  drawTile();  
  translate(width/2, height/2);
  rotate(random(360));  

  imageMode(CENTER);
  image(pg, 0, 0);  
 
}

void configTile() {
  
  idx = 0; 
  
  for (int i = 0; i < link.length; i++) {
    for (int j = 0; j < link[0].length; j++) {
      link[i][j] = nlink[i][j];
    }
  }
  

  float limit = random(4,7);
  
  for (int i = 0; i < nlink.length; i++) {
    for (int j = i; j < nlink[0].length/2; j++) {
      
      int l = 0;      
      if (random(1) > limit)  l = 8;
     
      nlink[j][i] = l;  
      nlink[nlink[0].length - j - 1][i]  = l; 
   
      nlink[j][nlink.length - 1 - i] = l; 
      nlink[nlink[0].length - 1 - j][nlink.length - 1 - i] = l; 
    }
  }

}
  

void drawTile() {
  pg.beginDraw();
  
  pg.background(bgcolor);
  pg.noFill();
  pg.stroke(255);
  pg.strokeWeight(random(2,5));
  
  for (int i = 0; i < tnumber; i++) {
    for (int j = 0; j < tnumber; j++) {
      if ((i+j)%2 == 0) {
        
        float top_left = tsize/2 * lerp(link[i][j], nlink[i][j], idx);
        float top_right = tsize/2 * lerp(link[i + 1][j], nlink[i + 1][j], idx);
        float bottom_right = tsize/2 * lerp(link[i + 1][j + 1], nlink[i + 1][j + 1], idx);
        float bottom_left = tsize/2 * lerp(link[i][j + 1], nlink[i][j + 1], idx);
        
        pg.rect(i*tsize + margin, j*tsize + margin, tsize, tsize, top_left, top_right, bottom_right, bottom_left);          
        pg.point(i*tsize + tsize/2 + margin, j*tsize+tsize/2 + margin);
        
      }
    }
  }

  pg.endDraw();
  
  idx += 0.02;
  idx = constrain(idx, 0, 1);
}
