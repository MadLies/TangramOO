  
class Rect extends Shape {
  float _edge;
 
  Rect() {
    this(84.84, color(0,0,0));
  }

  Rect(float edge, color hue) {
    setEdge(edge);
    setHue(hue);
  }

  @Override
  void aspect() {
   rectMode(CENTER);
   noStroke();
   rect(0,0 , edge(), edge());
  }
  
  
 
  public float edge() {
    return _edge;
  }

  public void setEdge(float edge) {
    _edge = edge;
  }
}
