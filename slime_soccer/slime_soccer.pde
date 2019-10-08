int score;
float g = 0.5;
ball b;
slime s;

void setup() {
  size(865, 450);
  b = new ball();
  s = new slime();
}

void draw() {
  background(255);

  s.render();
  b.render();

  s.update();
  b.update();
  stroke(0);
  noFill();
  strokeWeight(5);
  rect(-10, 320, 80, 300);
  strokeWeight(2);
}

void keyPressed() {
  if (key == 'w') {
    s.jump = true;
  }
  if (key == 'a') {
    s.moveLeft = true;
  }
  if (key == 'd') {
    s.moveRight = true;
  }
}

void keyReleased() {
  if (key == 'a') {
    s.moveLeft = false;
  }
  if (key == 'd') {
    s.moveRight = false;
  }
}
