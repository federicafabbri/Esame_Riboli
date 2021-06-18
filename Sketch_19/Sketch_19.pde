float yOffset = 0.0;

Blob[] blobs = new Blob[3];

void setup() {
  size(1000, 1000);
  stroke(0);

  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob();
  }
}

void draw() {
  background(255);
  translate(width / 2, height / 2);

  for (Blob blob : blobs) {
    blob.makeBlob(425.0, 50.0, color(255));
    blob.makeBlob(380.0, 50.0, color(255));
    blob.makeBlob(335.0, 50.0, color(255));
    blob.makeBlob(290.0, 50.0, color(255));
    blob.makeBlob(245.0, 5.0, color(255));
    blob.makeBlob(200.0, 20.0, color(255));
  }

  yOffset += 10;
  
}


class Blob {

  void makeBlob(float radius, float _xoffset, color bColor) {

    fill(bColor);

    beginShape();

    float xOffset = _xoffset;
    for (float i = 0; i < 50; i += 0.1) {
      float offset = map(noise(xOffset, yOffset), 0, 1, -30, 30);
      float r = radius + offset;
      float x = r * cos(i);
      float y = r * sin(i);

      vertex(x, y);

      xOffset += 0.1;
      
      if (mousePressed == true) {
        xOffset += 200;
        yOffset += 250;
        strokeWeight(3);
        
      }
      
      
      else {
      yOffset += 0.02;
      strokeWeight(1);
      
      }
    }

    endShape();
  }
}
