int pos = 1;
int lines = 4;
float speed = 4;
float acc = 0.01;
int space;
int score = 0;
boolean cheat = false;
int prev = 1;
int pprev = 1;

class Block {
  public float y;
  int x;
  public Block (float x) {
    this.x = (int)x;
    y = -height/lines;
  }
  public void move() {
    this.y += speed;
  }
}

ArrayList<Block> r = new ArrayList<Block>();

void setup () {
  fullScreen();
  space = height / 3;
  r.add(new Block(random(lines)));
}

void restart () {
  delay(1000);
  r = new ArrayList<Block>();
  speed = 4;
  pos = 1;
  r.add(new Block(random(lines)));
  score = 0;
}

void draw () {
  if (pos == 0 && prev == 3 && pprev == 2) {
    cheat = true;
  }
  background(55);
  strokeWeight (5);
  stroke(255);
  if (cheat) {
    stroke(0,255,255);
  }
  for (int i = 1; i < lines; i++) {
    line (width/lines*i, 0, width/lines*i, height);
  }
  strokeWeight (0);
  fill(255);
  rect(width/lines * pos, height-width/lines, width/lines, width/lines);
  if (mouseX != 0) {
    prev = pos;
    pprev = prev;
    for (pos = 0; pos < lines; pos++) {
      if (mouseX < width/lines*(1+pos)) {
        break;
      }
    }
  }
  Block del = null;
  for (Block i : r) {
    i.move();
    if (space < i.y && space > i.y - speed) {
      r.add(new Block(random(lines)));
    }
    fill(55,55,155);
    noStroke();
    rect(width/lines * i.x, i.y, width/lines, width/lines);
    if (pos == i.x &&  i.y > height-width/lines*2) {
      score++;
      del = i;
    }
    if (i.y > height && !cheat) {
      //background(200,0,0);
      //text(score,width/2,height/2);
      restart();
    }
  }
  if (del != null) {
    r.remove(del);
  }
  speed += acc;
  fill(55);
  stroke(255);
  rect(-2,-2,width+4,150);
  strokeWeight(2);
  textSize(100);
  //textAlign(LEFT);
  textAlign(CENTER);
  fill(200);
  text (score, width/2, 100);
}