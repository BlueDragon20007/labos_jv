class Particle {
  Emitter emitter;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float baseLifespan = 500;
  float lifespan;
  float distance = 0;
  color c;
  Player player;

  Particle(Emitter e) {
    emitter = e;
    position = e.position.copy();
    initialize();
  }
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    acceleration.add(f);
  }
  
  void initialize() {
    velocity = new PVector(random(-2, 2), random(-4, 0));
    acceleration = new PVector(0, 0);
    lifespan = baseLifespan;
    c = color(0, 0, 255);
  }

  void update(int delta) {
    if (detectPlayer()) {
      c = color(0, 255, 0);
      applyPlayerForce();
    } else {
      c = color(0, 0, 255);
    }
    
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
    
    if(isDead()) {
      reset();
    }
  }

  void display() {
    stroke(0, lifespan);
    fill(c, lifespan);
    ellipse(position.x, position.y, 10, 10);
  }
  
  boolean isDead() {
    return lifespan < 0.0;
  }
  
  void reset() {
    position.set(emitter.position.copy());
    velocity.set(random(-2, 2), random(-4, 0));    
    lifespan = baseLifespan;
    c = color(0, 0, 255);
  }
  
  void setDistance(int d) {
    distance = d;
  }
  
  void setPlayer(Player p) {
    player = p;
  }
  
  void setLifespan(float ls) {
    baseLifespan = ls; 
  }
  
  boolean detectPlayer() {
    if (player == null) return false;
    float d = position.dist(player.position);
    return (d < distance);
  }
  
  void applyPlayerForce() {
    PVector force = PVector.sub(player.position, position);
    float d = force.mag();
    d = constrain(d, 10, distance);
    
    float G = 2000;
    float magnitude = G / (d * d);
    
    force.setMag(magnitude);
    applyForce(force);
  }
}
