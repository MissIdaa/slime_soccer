float g = 0.5;
ball b;
slime s;
slime s2;
PFont font;
String time = "10";
int t;
int interval = 100;
int goal_w;
int goal_h;
int goal_xpos;
int goal_ypos;

void setup() {
  size(865, 450);
  b = new ball();
  s = new slime(100, 100, color(0,255,0));
  s2 = new slime(765, 100, color(255,0,0));
  fill(0);
  font = createFont("Arial", 50);
  goal_w = 110;
  goal_h = 125;
  goal_xpos = 0;
  goal_ypos = height-goal_h;
}

void draw() {
  background(255);

  s.render();
  s2.render();
  b.render();

  s.update();
  s2.update();
  b.update();
  stroke(0);
  noFill();
  strokeWeight(5);
  rect(goal_xpos, goal_ypos, goal_w, goal_h);
  strokeWeight(2);

  t = interval-int(millis()/1000);
  time = nf(t, 3);
  text(time, width/2, 100);
  if (t <= 0) {
    noStroke();
    fill(0, 255, 0);
    rect(0, 0, width, height);
    fill(255);
    text("Spillet er slut\n"+s.score, width/2, 50);
  }
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
  if (keyCode == UP) {
    s2.jump = true;
  }
  if (keyCode == LEFT) {
    s2.moveLeft = true;
  }
  if (keyCode == RIGHT) {
    s2.moveRight = true;
  }
}

void keyReleased() {
  if (key == 'a') {
    s.moveLeft = false;
  }
  if (key == 'd') {
    s.moveRight = false;
  }
  if (keyCode == LEFT) {
    s2.moveLeft = false;
  }
  if (keyCode == RIGHT) {
    s2.moveRight = false;
  }
}
