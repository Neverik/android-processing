float time;
float mult = 0.5;  
boolean should = false;
boolean first;
float start = 0;

void restart () {
  time = 2048;
  background (55);
  first = true;
}

void next() {
  time *= mult;
  should = false;
  background(255);
  background (random(255),random(255),random(255));
  start = millis();
  should = true;
}

void draw() {
  if (first) {
    first = false;
    next();
  }
  if (mousePressed) {
    if (should) {
      if (millis() - time * mult < start) {
        next();
      }
    } else {
      restart();
    }
  }
}

void setup () {
  fullScreen();
  restart();
}