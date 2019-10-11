class ball {
  PVector x, v;
  float r;

  ball() {
    x = new PVector(width/2, height/2);
    v = new PVector(0, 0);
    r = 20;
  }

  void render() {
    noStroke();
    fill(255, 0, 0);
    ellipse(x.x, x.y, 2*r, 2*r);
    fill(0);
  }

  void update() {
    if (dist(x.x, x.y, s.x.x, s.x.y) < r + s.r) {
      bounce(s);
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
    if (withinRect(x.x,x.y,goal_xpos,goal_ypos,goal_w,goal_h)) {
      s.score += 1;
    }

 //   if (withinRect(x.x,x.y,width-goal_w,0,goal_w,goal_h)) {
//      s2.score += 1;
//    }
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
  boolean withinRect(float x, float y, float a, float b, float w, float h) {
    if (dist(x, 0, a,0 ) <= w && dist(0,y,0,b) <= h) {
      return true;
    } else {
      return false;
    }
  }
}
