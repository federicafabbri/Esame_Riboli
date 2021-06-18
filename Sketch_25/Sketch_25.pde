float[][] heightMap;
int w = 600;
int h = 600;
int chunkX = 0;
int chunkY = 0;
int factor = 110;
float noiseZ = 240;
float frames = 400;
boolean stopped = false;

void setup() {
  size(600, 600);
  heightMap = new float[h][w];
  generateMap(noiseZ);
  background (255);
}

void generateMap(float z){
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) { 
      heightMap[y][x] = noise((float)x/2, (float)y/300, z) * 255 + x/20 - 100 + y / 10;
    }
  }
}

void draw() {
  for (int i = 0; i < 1; i++) {

    if (chunkX == w/factor) {
      chunkX = 0;
      chunkY++;;
    }
    if (chunkY == h/factor) {
     
      stopped=true;
    } else {
      
      renderChunk(chunkX * factor, chunkY * factor, factor);
      chunkX++;
    }
  }
}

void renderChunk(int xPos, int yPos, int chunkSize) {
  for (int py = yPos; py < yPos + chunkSize; py++) { 
    for (int px = xPos; px < xPos + chunkSize; px++) { 
      int y = h - 1;
      int z = h - py;
      while (y > 0 && heightMap[y][px] < z) {
        z--;
        y--;
      }
      int preY = y;
    
      while (heightMap[y][px] > z) {rotate(random(360));
        y--;
  
        if (y < 0) {rotate(random(360));
          break;
        }
      }

      stroke(preY, z * 1.2, max(500, 700));
      point(px, py);
    }
  }
}
