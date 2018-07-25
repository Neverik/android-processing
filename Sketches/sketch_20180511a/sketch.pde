import cassette.audiofiles.*;
import java.util.Map;

HashMap<Integer, SqrOsc> o;
float start = 440;
float end = 880;

void setup() {
  o = new HashMap<Integer, SqrOsc>();
}

void draw () {
  for (int i = 0; i < touches.length; i++) {
    SqrOsc s = o.get(new Integer(i));
    float p = map(touches[i].x, 0, width, start, end);
    if (s == null) {
      o.put(new Integer(touches[i].id), new SqrOsc());
      o.play();
    } else {
      s.freq(p);
    }
  }
  ArrayList<Integer> toDel = new ArrayList<Integer>();
  for (Map.Entry osc : o.entrySet()) {
    boolean m = false;
    for (int i = 0; i < touches.length; i++) {
      if (touches[i].id == osc.getKey().intValue()) {
        m = true;
      }
    }
    if (!m) {
      toDel.add(osc.getKey().intValue());
    }
  }
  for (Integer del : toDel) {
    o.remove(del);
  }
}