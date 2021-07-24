class Rhomboid extends Shape {
  PVector _center;
  
  Rhomboid() {
    this(new PVector(0,0),color(0,0,0));

  }

  Rhomboid(PVector center,color hue) {
   
    setCenter(center);
    setHue(hue);

  }

  @Override
  void aspect() {
    rectMode(CENTER);
     noStroke();
  if (reflex==false)  {
    beginShape();
    vertex(-30,-30);
    vertex(+90,-30);
    vertex(+30,+30);
    vertex(-90,+30);
    endShape(CLOSE); 
  }
   if (reflex==true)  {
     beginShape();
     vertex(-90,-30);
     vertex(+30,-30);
     vertex(+90,+30);
     vertex(-30,+30);
     endShape(CLOSE);
  }
  }
  PVector center() {
    return _center;
  }

   void setCenter(PVector center) {
    _center = center;
  }
  
}
