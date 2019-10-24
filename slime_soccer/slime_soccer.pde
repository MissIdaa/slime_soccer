float g = 0.5;
ball b;
slime s;
PFont font;
String time = "10";
int t;
int interval = 10;
int goal_w;
int goal_h;
int goal_xpos;
int goal_ypos;

void setup() {
  size(865, 450);
  b = new ball();
  s = new slime();
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
  b.render();

  s.update();
  b.update();
  stroke(0);
  noFill();
  strokeWeight(5);
  rect(goal_xpos, goal_ypos, goal_w, goal_h);
  strokeWeight(2);
  
  t = interval-int(millis()/1000);
  time = nf(t, 3);
  text(time, width/2,100);
  if(t <= 0) {
    noStroke();
    fill(0, 255, 0);
    rect(0, 0, width, height);
    fill(255);
    text("Spillet er slut\n"+s.score,width/2,50);
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
}

void keyReleased() {
  if (key == 'a') {
    s.moveLeft = false;
  }
  if (key == 'd') {
    s.moveRight = false;
  }
}
