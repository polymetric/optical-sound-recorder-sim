class SoundTrack {
    float[] widths;
    final int resolution = 4096; // must be a power of 2
    int pointer;
    float trackwidth;
    PVector origin;
    
    public SoundTrack(PVector origin, float trackwidth) {
      widths = new float[resolution];
      pointer = 0;
      this.origin = origin;
      this.trackwidth = trackwidth;
    }
    
    public void push(float f) {
      pointer = (pointer + 1) & (resolution - 1);
      widths[pointer] = f;
    }
    
    public void draw() {
      for (int i = 0; i < resolution; i++) {
        int newpointer = (pointer - i) & (resolution - 1);
        float w = widths[newpointer];
        strokeWeight(trackwidth/resolution);
        line(origin.x-(i/(resolution/trackwidth)), origin.y-w, origin.x-(i/(resolution/trackwidth)), origin.y+w);
      }
    }
}
