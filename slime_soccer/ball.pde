class ball {
  PVector x, v;
  float r;
  boolean stop;
  boolean stop2;

  ball() {
    x = new PVector(width/2, height/2);
    v = new PVector(0, 0);
    r = 20;
    stop = false;
  }

  void render() {
    noStroke();
    fill(0, 0, 0);
    ellipse(x.x, x.y, 2*r, 2*r);
    fill(0);
  }

  void update() {
    if (dist(x.x, x.y, s.x.x, s.x.y) < r + s.r) {
      bounce(s);
    } else if (dist(x.x, x.y, s2.x.x, s2.x.y) < r + s2.r) {
      bounce(s2);
    } else {
      v.mult(0.99);
      v.y += g;
    }

    if (x.y == 0) {
      v.mult(0.7);
    }

    v.limit(20);
    x.add(v);

    if (x.y + r > height) {
      x.y = height - r;
      v.y = -v.y;
    }
    if (x.x + r > width) {
      x.x = width - r;
      v.x = -v.x;
    }
    if (x.x - r < 0) {
      x.x = 0 + r;
      v.x = -v.x;
    }
    if (withinRect(x.x, x.y, goal_xpos, goal_ypos, goal_w) && stop == true) {
      s.score += 1;
      s.x.x = 100;
      s.x.y = 100;
      s2.x.x = 765;
      s2.x.y = 100;
      x.x = width/2;
      x.y = height/2;
      v.x = 0;
      x.y = 0;
      stop = false;
    }
    if (!withinRect(x.x, x.y, goal_xpos, goal_ypos, goal_w)) {
      stop = true;
    }
    if (withinRect(x.x, x.y, goal2_xpos, goal2_ypos, goal_w) && stop2 == true) {
      s2.score += 1;
      s.score += 1;
      s.x.x = 100;
      s.x.y = 100;
      s2.x.x = 765;
      s2.x.y = 100;
      x.x = width/2;
      x.y = height/2;
      v.x = 0;
      x.y = 0;
      stop2 = false;
    }
    if (!withinRect(x.x, x.y, goal2_xpos, goal2_ypos, goal_w)) {
      stop2 = true;
    }
  }

  void bounce(slime s) {
    PVector n = PVector.sub(x, s.x);
    float distanceCor = r + s.r - n.mag();
    n.normalize();
    v.sub(PVector.mult(n, 2*PVector.dot(n, v)));
    x.add(n.setMag(distanceCor));
    x.add(s.v);
    v.mult(1.5);
  }
  boolean withinRect(float x, float y, float a, float b, float w) {
    if (dist(x, 0, a, 0 ) <= w && y > b) {
      return true;
    } else {
      return false;
    }
  }
}
