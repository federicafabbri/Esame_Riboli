PImage img; 
PImage store; 
int power; 
PImage displacement; 
int dimensioneDistortX = 300; 
int dimensioneDistortY = 300;
int ratio = 120; 

void setup() {
  size(1080, 1080);
  img = loadImage("digitaldesigntheory.png");
  store = loadImage("digitaldesigntheory.png");
  displacement = loadImage("digitaldesigntheory.png");
  displacement.resize(dimensioneDistortX, dimensioneDistortY);
  imageMode(CENTER);
}
int time = 1;

void draw() {

  for (int x = 0; x < img.width; x++) {

    for (int y = 0; y < img.height; y++) {

      int bright = (int)brightness(displacement.get(
        (x+time)%displacement.width, 
        (y+time)%displacement.height
        )

        );
        
      power = (int)sqrt(10000000/(1+(int)pow(((int)dist(x, y, mouseX, mouseY)), 2)));

      int lim = 80;
      if (power > lim) power = lim;
      
 
      color c = img.get(
        x+bright/ratio + power, 
        y+bright/ratio + power 
        );

      int contrast = 10;
        int noise = (int)random(-contrast, contrast);
      c = color(red(c)+noise,green(c)+noise,blue(c)+noise);
  
      set(x, y, c);
    }
  }
 
  time++;
}
