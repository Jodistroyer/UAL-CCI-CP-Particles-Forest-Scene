// Most of the framework are from Tom's code and also his Week 9 Particle Lecture

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float decay;
  float randomX = random(width);
  float rotationSpeed;
  float colorChange;
  float leafSize;

  Particle(float x, float y) {
    position = new PVector(randomX, y);
    velocity = new PVector(random(-1,1),random(-1,1));
    acceleration = new PVector();
    lifespan = 255;
    decay = 0.5;
    rotationSpeed = random(-50, 50);
    colorChange = random(-50, 50);
    leafSize = random(1, 10);
  }

  void addForce(PVector f) {
    acceleration.add(f);
  }
  
  boolean expired() {
    return lifespan < 0;
  }
  
  void update() {
    lifespan -= decay;
    
    velocity.add(acceleration);
    position.add(velocity);
    
    if (position.y >= height - 10) { // If the particle hits the bottom
      position.y = height - 10; // Reset particle position to be on the bottom
      velocity.x = 0; // Set the vertical velocity to zero to stop sliding
    }

    acceleration.mult(0); // Set the acceleration to zero to stop sliding
  }

  void display() {
    pushMatrix();
  
    translate(position.x, position.y);
    noStroke();
    
    // Make different flower shapes and sizes inspired by (https://p5js.org/examples/hello-p5-simple-shapes.html)
    for (int i = 0; i < 10; i++) {
      fill(200 + colorChange, 10, 168 + colorChange, lifespan);
      ellipse(0, 3 + leafSize, 2 + leafSize, 8 + leafSize);
      rotate(PI/5 + rotationSpeed);
    }

    popMatrix();
  }
}
