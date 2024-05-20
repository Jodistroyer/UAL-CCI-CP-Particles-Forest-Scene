// Most of the stuff are from Tom's code and also his Week 9 Particle Lecture

class ParticleSystem {
  PVector origin; // The origin point where particles are generated
  ArrayList<Particle> particles;
  int count;

  // Initialize the particle system with a starting position and particle count
  ParticleSystem(float x, float y, int c) {
    origin = new PVector(x, y);
    particles = new ArrayList<Particle>();
    count = c;
  }
  
  // Apply a force to all particles in the system
  void addForce(PVector f) {
    for (int i = 0; i < particles.size(); i++) {
      particles.get(i).addForce(f); // Apply the force to each particle
    }
  }

  void update() {
    particles.add(new Particle(origin.x, origin.y)); // Add a new particle at the origin

    // Remove particles that have expired
    for (int i = particles.size()-1; i >= 0; i--) {
      if (particles.get(i).expired()) {
        particles.remove(i); // Remove expired particle from the list
      }
    }

    // Update each particle's state
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      p.update();
    }
  }

  // Method to display all particles in the system
  void display() {
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      p.display();
    }
  }
}
