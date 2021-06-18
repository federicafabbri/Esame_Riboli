Particle[] particles = new Particle[2000];
PGraphics bg;

int bgc = color(0);
int fgc = color(255);
int tc = color(255);

void setup() {
    background(bgc);
    size(800,800);
    fill(0, 6);
    for(int i = 0; i < particles.length; i++) {
        particles[i] = new Particle();
    }
    bg = createGraphics(width, height);
    bg.beginDraw();
    bg.textFont(createFont("Helvetica", 118, false));
    bg.textAlign(CENTER, CENTER);
    bg.fill(255);
    bg.stroke(255);
    bg.text("FIREWORKS", width/2, height/2);
    bg.endDraw();
    println(bg.pixels.length);
}

float z = 0;
float noiseScl = 10;
int framecounter = 0;
void draw() {
    stroke(bgc);
    rect(0, 0, width, height);
    stroke(fgc);
    z += 0.5;

    for(int i = 0; i < particles.length; i++) {
        particles[i].update();
        particles[i].trace();
        particles[i].wrap();
    }
}

class Particle {

    PVector pos, vel, acc, prevpos;

    public Particle() {
        this.init();
    }

    void init() {
        pos = new PVector(random(width), random(height));
        vel = new PVector(20, 20);
        acc = new PVector(20, 20);
        prevpos = pos.copy();
    }

    void show() {
        ellipse(pos.x, pos.y, 5, 5);
    }

    void trace() {
        line(prevpos.x, prevpos.y, pos.x, pos.y);
        stroke(random(255), random(255), random(255));
        
        if (mousePressed == true) {
   stroke(random(fgc), random(fgc), random(fgc));
}
    }

    void update() {
        PVector force;

        if(bg.pixels[min(bg.pixels.length - 1, floor(pos.y) * width + floor(pos.x))] == color(255)) {
            vel.x = random(1) * TWO_PI - PI;
            vel.y = random(1) * TWO_PI - PI;
            stroke(tc);
        } else {
            force = PVector.fromAngle(noise(pos.x*noiseScl, pos.y*noiseScl, z) * TWO_PI - PI/3);
            force.setMag(0.1);
            acc.add(force);
            vel.add(acc);
        }
        vel.limit(3);
        updatePrevious();
        pos.add(vel);
        acc.mult(0);
    }

    void wrap() {
        if(pos.x < 0) {
            pos.x = width;
            pos.y = random(height);
            updatePrevious();
        }
        if(pos.y < 0) {
            pos.y = height;
            pos.x = random(width);
            updatePrevious();
        }
        if(pos.x > width) {
            pos.x = 0;
            pos.y = random(height);
            updatePrevious();
        }
        if(pos.y > height) {
            pos.y = 0;
            pos.x = random(height);
            updatePrevious();
        }
    }
    private void updatePrevious() {
        prevpos.x = pos.x;
        prevpos.y = pos.y;
    }

}
