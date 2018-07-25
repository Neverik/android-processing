class ball {
  public float x;
  public float y;
  public float xs;
  public float ys;
  public float xa;
  public float ya;
  public float jm;
  public float w;
  public float c;
  
  public ball(float xx,float yy, float ww, float cc) {
    jm = 0.9;
    x = xx;
    y = yy;
    xs = 0;
    ys = 0;
    xa = 0;
    ya = 9.1;
    w = ww;
    c = cc;
  }
  public void frame(ball[] other) {
    x += xs;
    y += ys;
    xs += xa;
    ys += ya;
    for (ball i : other) {
      if ((x < 1 && xs < 0) || (x > width - 1 && xs > 0)) {
        xs = -xs * jm;
      }
      if ((y < 1 && ys < 0) || (y > height - 1 && ys > 0)) {
        ys = -ys * jm;
      }
      if(dist(x,y,i.x,i.y) < w/2 + i.w/2) {
        xs += (i.x - x) / w * jm * dist(x,y,i.x,i.y);
        ys += (i.y - y) / w * jm * dist(x,y,i.x,i.y);
      }
    }
  }
}

int len = 5;

ball[] b = new ball[len];

void setup() {
  fullScreen();
  orientation(PORTRAIT);
  for (int i = 0; i < len; i += 1) {
    b[i] = new ball(random(0,width/2),random(0,height/2),random(10,35), random(0,255));
    b[i].xs = random(-10,10);
  }
  frameRate(20);
  noStroke();
}

void draw () {
  background(55);
  for (ball i:b) {
    fill(i.c);
    ellipse(i.x,i.y,i.w,i.w);
    i.frame(b);
  }
}

void mousePressed() {
  for(ball i:b) {
    i.xs += random(-30,30);
    i.ys += random(-30,30);
  }
}