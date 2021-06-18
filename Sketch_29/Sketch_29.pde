void setup()
{
  size(640, 959);
  colorMode(HSB,3);
  background(0);
}

void draw()
{
  final int ingrandimento = 20;
  
  String nomeimg = String.format("natura.jpg");
  PImage img = loadImage(nomeimg);
  
  copy(
    ingrandimento, ingrandimento, width - ingrandimento * 2, height - ingrandimento * 2,
    0, 0, width, height
  );
  
  for (int y = 0; y < height; y++)
  {
    for (int x = 0; x < width; x++)
    {
      color bg = get(x, y);
      color fg = img.get(x, y);
      
      float h = (hue(bg) + 0.002) % 1;
      float s = min(saturation(bg) + 0.04, 1);
      float b = max(brightness(bg) - 0.01, 0);

      float fg_b = brightness(fg);
      fg_b = round(fg_b * 3) / 3.0;
      
      if (fg_b > 0)
      {
        h *= 0.5;
        s *= 0.5;
        b = lerp(b, fg_b, 0.75);
      }
      
      set(x, y, color(h, s, b));
    }
  }
  
}

void keyPressed (){
 if (key == ' ') {
 background (0);
   
 }

}
