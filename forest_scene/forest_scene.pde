// click mouse to trigger particle system
// hold w to add wind
// press r to reset sketch

PImage bg;
PVector gravity, wind, strongWind;

ArrayList<ParticleSystem> systems;

void setup() {
  size(626, 417);
  bg = loadImage("cherryBlossom.jpg");

  gravity = new PVector(0, 0.02);
  wind = new PVector(random(-0.002, 0.02), 0);
  strongWind = new PVector(0.1, 0);
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
  background(bg);
  
  // draw pink rectangle at the bottom to match flowers
  fill(189, 73, 120);
  rect(0, height - 10, width, 10); 

  for (ParticleSystem ps : systems) {
    ps.addForce(gravity);
    ps.addForce(wind);
    ps.update();
    ps.display();
  }
  
}

void mousePressed() {
  // Generate particles across the width of the screen
  for (int i = 0; i < 1; i++) { // Adjust the number of particles as needed
    float randomX = random(width); // Random x-coordinate across the width
    systems.add(new ParticleSystem(randomX, 10, 6)); 
  }
  
}

void keyPressed() {
  if (key == 'r') {
    setup();
  }
  if (key == 'w') {
    for (ParticleSystem ps : systems) {
      ps.addForce(strongWind);
    }
  }
}
