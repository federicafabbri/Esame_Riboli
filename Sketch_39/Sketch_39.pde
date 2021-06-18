PFont myFont;

void setup()
{
  size(500,500);
  myFont = 
  createFont("Arial",48);
  background(0);
  for(int i=-0; i<500; i=i+20)
  
  {
    for(int j=-0; j<500; j=j+30)
    {
      fill(255,255,255,random(abs(i-150)));
      textFont(myFont, random(abs(i-50)));
      text("c", i, random(j));
      text("o", i, random(j));
      text("n", i, random(j));
      text("f", i, random(j));
      text("u", i, random(j));
      text("s", i, random(j));
      text("i", i, random(j));
      text("o", i, random(j));
      text("n", i, random(j));
    }
  }
}
