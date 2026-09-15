class Player {
  PVector position;
  float diameter;
  float speed;

  Player(float startX, float groundY, float d, float s) {
    this.position = new PVector(startX, groundY - d / 2);
    this.diameter = d;
    this.speed = s;
  }

  void update() {
    if (keyPressed) {
       switch(Character.toLowerCase(key)) {
          case 'a': 
            position.x -= speed;
            break;
          case 'd': 
            position.x += speed;
            break;
       }
    }

    position.x = constrain(position.x, diameter / 2, width - diameter / 2);
  }

  void display() {
    noStroke();
    fill(0, 0, 255);
    ellipse(position.x, position.y, diameter, diameter);
  }
}
