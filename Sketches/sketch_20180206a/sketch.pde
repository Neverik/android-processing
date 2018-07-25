int lines = 20;
int start = -2000;
int lightnings = 3;
int dur = 500;
int rate = 16;

boolean erase = false;

void setup () {
  fullScreen();
  paper();
  stroke(0);
  mouseX = width / 2;
  mouseY = height / 2;
  pmouseX = width / 2;
  pmouseY = height / 2;
}

void draw () {
  if (mouseY > height - height / lines) {
    start = millis();
    mouseX = width / 2;
    mouseY = height / 2;
  }
  if (mouseX > width - width / lines) {
    erase = false;
  }
  if (mouseX < width / lines) {
    erase = true;
  }
  if (mouseY < height / lines) {
    paper();
  }
  if (millis() - start < dur + 100 || millis() < 1000) {
    paper();
    strokeWeight(2);
    stroke(0,0,20);
    for(int i = 0; i < lines; i++) {
      line(0,height/lines*i,width,height/lines*i);
    }
  }
  if (millis() - start < dur) {
    paper();
    strokeWeight(2);
    stroke(0,0,20);
    for(int i = 0; i < lines; i++) {
      line(0,height/lines*i,width,height/lines*i);
    }
    strokeWeight(10);
    stroke(0,0,255);
    float x = random(width);
    float y = random(height);
    for(int i = 0; i < lightnings; i++) {
      float nx = random(width);
      float ny = random(height);
      line(x,y,nx,ny);
      x = nx;
      y = ny;
    }
    frameRate(rate);
  } else {
    frameRate(60);
    strokeWeight(2);
    stroke(0,0,20);
    stroke(255,0,0);
    strokeWeight(5);
    line(pmouseX,pmouseY,mouseX,mouseY);
    start = frameCount;
  }
}

void paper() {
  background(255);
}