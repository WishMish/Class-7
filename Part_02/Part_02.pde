// Code_1_FA18
// Week 7
// Bryan Ma

// this sketch creates 10 instances of a ball class. 
// it does this in the setup() function in a loop instead of 
//  doing it based on mouse presses as we did in class.

// review this approach, then create your own class that draws
//  a different visual to the screen with its own behavior. 
//  it could be abstract or more explicit. think about how to 
//  parameterize your object's constructor. once you've created 
//  a class like this, create a number of instances of your 
//  class on the canvas by any means you prefer.

ArrayList<Diamond> diamonds = new ArrayList<Diamond>();

void setup() {
  size(800, 800);
  for (int i = 0; i < 50; i++) {
    diamonds.add(new Diamond(random(width), random(100,700)));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < diamonds.size(); i++) {
    Diamond diamond = diamonds.get(i);
    diamond.display();
    diamond.update();
  }
}

class Diamond {
  float posX;
  float posY;
  float velX;
  float velY;
  float size;
  float r, b, o;

  // create the constructor
  Diamond(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
    this.velX = random(0);
    this.velY = random(-5, 5);
    this.size = random(50, 100);
    r = random(150,255);
    b = random(150,255);
    o = random(150,255);
  }

  // draw to the screen
  void display() {   
    noStroke();
    rectMode(CENTER);
    rect(this.posX, this.posY, size, size);
    fill(r,0,b,o);

  }

  // update its position and velocity.
  void update() {
    this.posX += this.velX;
    this.posY += this.velY;

    // check if it goes off
    if (this.posY > height-this.size/2 || this.posY < this.size/2) {
      this.velY *= -1;
    }
  }
}
