// Implementar:
// 1. El estilo del shape (e.g., stroke, stroke weight).
// 2. El método contains(int x, int y) que diga si un punto de coordenadas
// (x,y) se encuentra o no al interior del shape. Observe que esta
// función puede servir para la selección de la pieza con un puntero.
// 3. El resto de shapes que se requieran para el Tangram, como se
// hace con la clase Rect (ver Rect.pde).

abstract class Shape {
  float _rotation;
  float _scaling;
  PVector _position;
  color _hue;
  boolean _select;


  Shape() {
    this(new PVector(random(100, 300), random(100, 900)),
         0,
         1,
         color(random(0, 255), random(0, 255), random(0, 255)),
         false);
  }

  Shape(PVector position, float rotation, float scaling, color hue, boolean select) {
    setPosition(position);
    setRotation(rotation);
    setScaling(scaling);
    setHue(hue);
    setSelect(select);
  }

  void draw() {
    push();
    fill(hue());
    translate(position().x, position().y);
    rotate(rotation());
    scale(scaling(), scaling());
    aspect();
   select();
    pop();
  }

  abstract void aspect();

  /*
  // Escoja uno solo de los siguientes dos prototipos para la funcion contains:
  boolean contains(int x, int y) {
    return true;
  }
  
  abstract boolean contains(int x, int y);
  // */

  float scaling() {
    
    if (menu!=4 && menu!=7 )_scaling=1;
    if(menu==4 || menu==7){
    if (keyPressed){
     if ( key == '0')_scaling= 0.5;
     if ( key == '1')_scaling= 1;
     if ( key == '2')_scaling= 1.5;
    }
    }
    return _scaling;
  }

  void setScaling(float scaling) {
    _scaling = scaling;
  }

 float rotation() {
if (_select==true   ){
  if (keyPressed){
   if (keyCode == LEFT)_rotation-=PI/36;
   if (keyCode == RIGHT)_rotation+=PI/36;
}
}
    return _rotation;
  }

  void setRotation(float rotation) {
    _rotation = rotation;
  }

boolean select(){
if (mouseButton == LEFT)  {
 if (getPix==_hue)_select =true;}
if (mouseButton == RIGHT){  
 if (getPix==_hue)_select = false;}
  
  return _select;
}

   void setSelect(boolean select) {
  
     _select= select;
 
  }
  
  PVector position() {

    if (_select==true   ){
  
    _position.x= mouseX;
    _position.y = mouseY;
       
    }
    return _position;
  }

  void setPosition(PVector position) {
    _position = position;
  }

  color hue() {
    
    return _hue;
  }

  void setHue(color hue) {
    _hue = hue;
  }
}
