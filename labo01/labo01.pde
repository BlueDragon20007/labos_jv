int currentTime;
int deltaTime;
int previousTime;

Emitter emitter;

Player player;

void setup() {
  size(800, 600);
  player = new Player(width / 2, 590, 40, 5);
  emitter = new Emitter(new PVector( width / 2, height / 4), 1, 1000);
}

void draw() {
  currentTime = millis();
  deltaTime = currentTime - previousTime;
  previousTime = currentTime;
  
  update(deltaTime);
  display();
}

void update(int deltaTime) {
  player.update();
  emitter.applyForce(new PVector(0, 0.05)); // Gravite
  emitter.update(deltaTime, player);
}

void display() {
  background(255);
  player.display();
  emitter.display();
}
