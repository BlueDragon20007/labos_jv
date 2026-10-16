 class Emitter {
  PVector position;
  int particleRate;
  int maxParticles;
  int lastParticleTime;
  ArrayList<Particle> particles;

  Emitter(PVector l, int rate, int mp) {
    position = l.copy();
    particleRate = rate;
    maxParticles = mp;
    lastParticleTime = 0;
    particles = new ArrayList<Particle>();
  }
  
  void applyForce(PVector force) {
    for (Particle p : particles) {
      p.applyForce(force);
    }
  }

  void update(int deltaTime, Player pl) {
    if (millis() - lastParticleTime > particleRate && particles.size() < maxParticles) {
      lastParticleTime = millis();
      Particle p = new Particle(this);
      p.setDistance(200);
      p.setPlayer(pl);
      p.setLifespan(random(300, 500));
      particles.add(p);
    }

    for (Particle p : particles) {
      p.update(deltaTime);
    }
  }

  void display() {
    for (Particle p : particles) {
      p.display();
    }
  }
}
