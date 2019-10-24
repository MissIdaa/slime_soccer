class slime {
  PVector x, v;
  float r;
  boolean jump, moveLeft, moveRight;
  int score;
  color farve;
  
  slime(int tempX, int tempY, color tempFarve) {
    r = 65;
    x = new PVector(tempX, tempY);
    v = new PVector(0, 0);
    jump = false;
    moveLeft = false;
    moveRight = false;
    farve = tempFarve;
  }

  void render() {
    noStroke();
    fill(farve);
    arc(x.x, x.y, 2*r, 2*r, PI, TWO_PI);
    stroke(0);
    fill(255);
    ellipse(x.x+40, x.y-42, 0.5*r, 0.5*r);
    fill(0);
    ellipse(x.x+48, x.y-42, 0.2*r, 0.2*r);
    textSize(30);
    textAlign(CENTER);
    text("Scoren er "+score,x.x,50);
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

    if (x.x+r >= width) {
      moveRight = false;
      x.x = width-r;
    }
    if (x.x-r <= 0) {
      moveLeft = false;
      x.x = 0+r;
    }
  }
}
