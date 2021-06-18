ArrayList<Particle> particles;
int NUM_PARTICLES = 400;
float particleSpeed = 8;
int maxdistance = 80;
int bg = color(00, 00, 00);
int fg = color(random(255), random(255), random(255));
int connections = 0;

PGraphics textconstraint;

void setup() {
    fullScreen();
    stroke(fg);
    fill(fg);
    particles = new ArrayList<Particle>();
    for(int i = 0; i < NUM_PARTICLES; i++) {
        particles.add(new Particle());
    }
    maxdistance *= maxdistance;
}

void draw() {
    background(bg);
    for(int i = 0; i < NUM_PARTICLES; i++) {
        particles.get(i).update();
        if (mousePressed == true) {
        fill(random(255), random(255), random(255));
        stroke(random(255), random(255), random(255));
    }}
    
    for(int j = 0; j < NUM_PARTICLES; j++) {
        
        boolean noDraw = false;
        for(int i = 0; i < NUM_PARTICLES; i++) {
            
          
          if(Math.pow(particles.get(i).pos.x - particles.get(j).pos.x, 2)
             + Math.pow(particles.get(i).pos.y - particles.get(j).pos.y, 2)
             < maxdistance) {
                line(particles.get(j).pos.x, particles.get(j).pos.y, particles.get(i).pos.x, particles.get(i).pos.y);
                connections++;
            }
        }
        if(!noDraw) ellipse(particles.get(j).pos.x, particles.get(j).pos.y, 30, 30);
        if (mousePressed == true) {    
    ellipse(particles.get(j).pos.x, particles.get(j).pos.y, 60, 60);
  }  
    }
}

class Particle {
    public PVector pos;
    PVector vel;
    float theta;

    public Particle() {
        pos = new PVector(random(width), random(height));
        vel = PVector.fromAngle(random(1) * TWO_PI);
        vel.setMag(particleSpeed);
        theta = atan2(vel.y, vel.x);
    }

    void update() {
        pos.add(vel);
        if(pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
            reinit();
        }
    }

    void reinit() {
        pos = new PVector(random(width), random(height));
        vel = PVector.fromAngle(random(1) * TWO_PI);
        vel.setMag(particleSpeed);

    }
    void show() {
        ellipse(pos.x, pos.y, 4,4);
    }
}
