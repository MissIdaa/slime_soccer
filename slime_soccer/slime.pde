class slime {
  PVector x, v;
  float r;
  boolean jump, moveLeft, moveRight;

  slime() {
    r = 65;
    x = new PVector(100, 100);
    v = new PVector(0, 0);
    jump = false;
    moveLeft = false;
    moveRight = false;
  }

  void render() {
    noStroke();
    fill(0, 255, 0);
    arc(x.x, x.y, 2*r, 2*r, PI, TWO_PI);
    stroke(0);
    fill(255);
    ellipse(x.x+40, x.y-42, 0.5*r, 0.5*r);
    fill(0);
    ellipse(x.x+48, x.y-42, 0.2*r, 0.2*r);
  }

  void update() {
    v.y += g;

    if (moveLeft) {
      v.x += -8;
    }
    if (moveRight) {
      v.x += 8;
    }
    if (jump && x.y == height) {
      v.y = -10;
      jump = false;
    }

    x.add(v);

    if ( x.y > height) {
      x.y = height;
      v.y = 0;
    }

    v.x = 0;

    if (s.x.x+s.r >= width) {
      s.moveRight = false;
      s.x.x = width-s.r;
    }
    if (s.x.x-s.r <= 0) {
      s.moveLeft = false;
      s.x.x = 0+s.r;
    }
  }
}
