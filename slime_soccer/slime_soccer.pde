int score;
float g = 0.5;
ball b;
slime s;
PFont font;
String time = "10";
int t;
int interval = 10;

void setup() {
  size(865, 450);
  b = new ball();
  s = new slime();
  fill(0);
  font = createFont("Arial", 50);
  
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
  
  t = interval-int(millis()/1000);
  time = nf(t, 3);
  text(time, width/2,100);
  if(t <= 0) {
    noStroke();
    fill(0, 255, 0);
    rect(0, 0, width, height);
    fill(255);
    text("Spillet er slut\n"+score,width/2,50);
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
