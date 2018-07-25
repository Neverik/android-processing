int pos = 1;
int lines = 4;
float speed = 4;
float acc = 0.05;
int space;
int score = 0;

class Block {
  public float y;
  int x;
  public Block (float x) {
    this.x = (int)x;
    y = 0;
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
  r = new ArrayList<Block>();
  speed = 4;
  pos = 1;
  r.add(new Block(random(lines)));
  score = 0;
}

void draw () {
  background(55);
  for (int i = 1; i < lines; i++) {
    line (width/lines*i, 0, width/lines*i, height);
  }
  fill(255);
  rect(width/lines * pos, height-width/lines, width/lines, width/lines);
  if (mouseX != 0) {
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
    fill(200,55,55);
    rect(width/lines * i.x, i.y, width/lines, width/lines);
    if (pos == i.x &&  i.y > height-width/lines*2) {
      restart();
    }
    if (i.y > height) {
      del = i;
    }
  }
  if (del != null) {
    r.remove(del);
    score++;
  }
  speed += acc;
  fill(200);
  textAlign(LEFT);
  textAlign(BOTTOM);
  text (score, 0, 0);
}