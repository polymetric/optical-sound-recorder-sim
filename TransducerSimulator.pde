Transducer t;
SoundTrack st;
int step;
float framerate;
float freq_a, freq_b, freq_c;

void setup() {
  size(1600, 800, P3D);
  smooth(8);
  
  t = new Transducer(3f, .05, 0.9f);
  st = new SoundTrack(new PVector(width, height/2), 1600);
  step = 0;
  framerate = 60;
  freq_a = 1;
  freq_b = 1;
  freq_c = 4;
}




void draw() {
  float steps_per_frame = 10;
  float steprate = framerate * steps_per_frame;
  for (int i = 0; i < steps_per_frame; i++) {
    float signal = 0;
    //signal += (step * freq_a) % steprate < steprate/2 ? 1 : -1;
    signal += sin((step/steprate) * freq_b * PI * 2);
    //signal += sin((step/framerate) * freq_c * PI * 2);
    //println(signal, t.pos);
    t.applyForce(signal);
    t.tick();
    st.push(t.pos+height/4);
    step++;
  }
  
  clear();
  
  stroke(255);
  st.draw();
  
  noStroke();
  fill(127);
  circle(width, t.pos+height*3/4, 10);
}
