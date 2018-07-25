boolean eraser = false;
void setup() {
  size(700,1000);
  background(255);
}

void mouseClicked() {
  if(mouseY < 50) {
    if(mouseX < 350) {
      eraser = !eraser;
    }
    else {
      background(255);
    }
  }
}

void draw() {
  strokeWeight(0);
  fill(230,20,10);
  rect(0,0,350,100);
  fill(10,20,230);
  rect(350,0,350,100);
  strokeWeight(5);
  if (eraser) {
    strokeWeight(20);
    stroke(255);
  } else {
    stroke(55);
  }
  fill(55);
  line(pmouseX,pmouseY,mouseX,mouseY);
}