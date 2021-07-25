class Triangle extends Shape {
  PVector _center;
  int _type;

 
  Triangle() {
    this(new PVector(0, 0),1, color(0,0,0) );
  }

  Triangle(PVector center,int type, color hue) {
    setCenter(center);
    setType(type);
    setHue(hue);
  }

  @Override
   void aspect() {
    rectMode(CENTER);
     noStroke();
    if (_type==1){
    beginShape();
    vertex(0,-60);
    vertex(120,+60);
    vertex(-120,+60);
    endShape(CLOSE);
    
   }
   if (_type==2){
    beginShape();
    vertex(0,-30);
    vertex(60,30);
    vertex(-60,30);
    endShape(CLOSE);
   }
   if (_type==3){
   beginShape();
    vertex(0,-42.42);
    vertex(+(84.85),+42.42);
    vertex(-(84.85),+42.42);
    endShape(CLOSE);
   }
  } 
   public int type() {
    return _type;
  }

  public void setType(int type) {
    _type = type;
  }

  public PVector center() {
    return _center;
  }

  public void setCenter(PVector center) {
    _center = center;
  }
}
