void setup() {
  fullScreen(P3D);
  lights();
}

float y = 0;
float x = 0;
float v = 0.01;

void draw () {
  background(55);
  fill(185);
  translate(width/2,height/2,0);
  rotateX(y);
  rotateY(x);
  box(width/3);
  if (mouseX != 0) {
    x += -v * v * (mouseX - width/2);
  }
  if (mouseY != 0) {
    y += -v * v * (mouseY - height/2);
  }
}