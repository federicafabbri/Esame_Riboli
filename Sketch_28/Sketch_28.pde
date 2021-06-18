PImage img;

void setup()
{
  size(500, 500);
  img = loadImage("poseidone.jpg");
  colorMode(HSB, 1);
 
}

void draw()
{
  final int Frametot = 10;
  float time = 0.2 / Frametot * frameCount;

  background(255,10);
  strokeWeight(1.3);
  final int res_x = width;
  final int res_y = height/5;
  
  final float dx = 1.3 / res_x;
  final float dy = 1.3 / res_y;

  float omega = sin(time % 5 * PI / 2);

  for (int iy = 0; iy < res_y; iy++)
  {
    float x = 0;
    float k = 0;
    float w = 0;
    
    for (int ix = 0; ix < res_x; ix++)
    {
      float b = 1 - brightness(img.get(
        (int)(lerp(0.2, 0.8, ix * dx) * img.width),
        (int)(lerp(0.1, 0.7, iy * dy) * img.width)
      ));
      
      b = lerp(k, b, 0.5);
      
      x += lerp(100, 1000, b) * dx * omega;
      
      float y2 = sin(x) * 0.68 * b;
      
      if (ix > 0)
        line((ix - 1) * dx * width, (iy + w + 0.8) * dy * height,
              ix      * dx * width, (iy + y2 + 0.8) * dy * height);

      w = y2;
      k = b;
    }
  }
}
