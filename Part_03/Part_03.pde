// Code_1_FA18
// Week 7
// Bryan Ma

// this is the leap we made from a single arraylist of ball objects,
//  to an arraylist of particle generators, all which possess their own
//  arraylist of particle objects. clicking on the screen creates a new
//  object of the Generator class. 

// modify the behavior of the particle (and potentially the particle 
//  generator to create an effect that simulates some kind of natural 
//  phenonema. think about the youtube video we saw in class - 
//  (https://www.youtube.com/watch?v=heW3vn1hP2E) that shows how a few 
//  simple changes to a basic particle system can create some convincing 
//  effects, like fire, smoke, and water. 
// see how far you can get and be creative. maybe it could be raindrops on
//  a window, stars zooming by in space, a waterfall? Use color, opacity,
//  size, and lifetimes to control things. try mapping the values of your 
//  parameters to the lifetime, just as in the example each particle gets
//  smaller as it reaches the end of its life. try changing particle speeds,'
//  directions, and other behavior. 
ArrayList<Generator> generators;

void setup() {
  size(800, 800);
  generators = new ArrayList<Generator>();
}

void draw() {
  background(30);
  for (int i = 0; i < generators.size(); i++) {
    Generator g = generators.get(i);
    g.addParticles();
    g.drawParticles();
    
  }
}

void mousePressed() {
  generators.add(new Generator(mouseX, mouseY));
}

class Particle {
  float posX;
  float posY;
  float velX;
  float velY;
  float life;
  float size;
  float gravity;
  float r, g, b;

  Particle(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
    this.velX = random(-5, 5);
    this.velY = random(-5, 5);
    life = 50;
    size = random(4, 8);
  }

  void display() {
    noStroke();
    ellipse(this.posX, this.posY, size*life/50, size*life/50);
    r = map(life, 0, 50, 255, 0);
    g = map(life, 0, 50, 255, 0);
    b = map(life, 0, 50, 255, 0);
    if(mouseX < 266){
      fill(255, g, b);
    }
    if(mouseX > 266 && mouseX < 533){
      fill(g, 255, b);
    }
    if(mouseX > 533){
      fill(g, b, 255);
    }
  }

  void update() {
    life--;
    this.posX += this.velX;
    this.posY += this.velY;

    // check if it goes off
    if (this.posX > width || this.posX < 0) {
      this.velX *= -1;
    }
    if (this.posY > height || this.posY < 0) {
      this.velY *= -1;
    }

  }
}

class Generator {
  ArrayList<Particle> particles;
  float posX;
  float posY;
  float rate; 

  Generator(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
    particles = new ArrayList<Particle>();
  }

  void addParticles() {
    particles.add(new Particle(this.posX, this.posY));
  }

  void drawParticles() {
    for (int i = 0; i < particles.size(); i++) {
      Particle b = particles.get(i);
      b.update();
      b.display();
    } 

    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      if (p.life < 0) {
        particles.remove(i);
      }
    }
  }
}
