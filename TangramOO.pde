// Creado por Juan David Wilches (MadLies)  
 
// Implementar:
// 1. La creación de las siete distintas piezas (por ahora son todas Rect) 
// 2. La interacción: selección y manipulación de las piezas (ratón, teclas, touch...)
// 3. La evaluacion de la solucion
// 4. El modo de creacion de nuevos problemas


// Controles - Instrucciones
//Dando clic podras interactuar en el menu
//Con clic izquierdo se eligen las figuras 
//Con clic derecho se sueltan las figuras
//Mientras la figura este seleccionada se pueden usar las flechas izquierda y derecha para rotarla 
//Con el espacio refleja el romboide
//Para volver al menu se debe oprimir la tecla b 
//ocultar o mostrar la cuadricula con la tecla g
//Para que un nivel sea valido el numero de pixeles negros (número mostrado en la ezquina superior derecha) debe ser menor de mil(1000)
//Para poder crear un nivel se debe ingresar en el  modo libre, organizar las piezas a gusto, quitar la cuadricula y presionar la tecla s para guardarlo
//Ahora se podra acceder  a este nivel en mis niveles creados, en donde se guardara como el primer nivel del mundo 1 y asi ira avanzando por cada nivel nuevo mientras el programa se ejecuta
//Cuando ingreses a mis niveles podras interactuar con las flechas izquiera y derecha para ingresar al mundo 1 y al mundo 2 respectivamente
//Ya estando en el mundo deseado presionar algún número entre uno y nueve(1-9) para ingresar al nivel deseado
//Estando en el modo de juego libre  y en tus niveles podras utilizar las teclas 0, 1, 2 para escoger el tamaño de las fichas
//donde 0 es la mitad del tamaño, 1 el tamaño normal y 2 el tamaño aumentado un 50%
// A jugar :3 



Shape[] shapes;
boolean drawGrid = true;
color getPix;
int menu=0;
boolean reflex = false;
int newLevel = 1;
int myLevel = 0;


void setup() {
  size(1200,1000);
  objects();
}

void draw() {
 
  background(255, 255, 255);

  philtre();
 if(menu==5||menu==6)presentMyLevels();
 if (drawGrid)drawGrid(10);
 if (menu !=0 && menu!=5 && menu!=6){for (Shape shape : shapes)
   shape.draw();}  
 if (menu==0) mainMenu(); 
 if (menu!=0 && menu!=5 && menu!=6 && menu!=4 )  evaluate();
   getPix= get(mouseX,mouseY);
}

// Se encarga de dibujar la cuadricula 
void drawGrid(float scale) {
  push();
  strokeWeight(1);
  int i;
  for (i=0; i<=width/scale; i++) {
    stroke(0, 0, 0,30);
    line(i*scale, 0, i*scale, height);
  }
  for (i=0; i<=height/scale; i++) {
    stroke(0, 0, 0,30);
    line(0, i*scale, width, i*scale);
  }
  pop();
}
void objects(){
  shapes = new Shape[7];
  shapes[0] = new Triangle(new PVector(0, 0),1,color(163,78,0));
  shapes[1] = new Triangle(new PVector(0, 0),1,color(150,0,0));
  shapes[2] = new Triangle(new PVector(0, 0),3,color(0,67,130));
  shapes[3] = new Rect(84.84, color(150, 95, 0));
  shapes[4] = new Rhomboid(new PVector(0,0),color(0,80,37));
  shapes[5] = new Triangle(new PVector(0, 0),2,color(0,128,102));
  shapes[6] = new Triangle(new PVector(0, 0),2,color(87,35,100));
  
}
// Se encarga de aplicar el filtro a la imagen para que se cree la sombra a blanco y negro 
void philtre(){
  PImage defaultLevel;
  PImage freePlay;
  PImage withFilter;
  PImage createdLevels;
  int treshold = 200;
  if (menu==1||menu==2||menu==3){
defaultLevel = loadImage("defaultLevel"+menu+".jpg");
  withFilter= createImage(1200,1000,RGB);
defaultLevel.loadPixels();
  withFilter.loadPixels();
  for(int x = 0; x<1200; x++){
    for(int y = 0; y<1000; y++){
      int loc = x+y*1200;
      if (brightness(defaultLevel.pixels[loc])<treshold)withFilter.pixels[loc]=color(2);
      else  withFilter.pixels[loc]=color(255);
  }
  }
  withFilter.updatePixels(); 
  image(withFilter,0,0);
  }

    if (menu==4){
  freePlay = loadImage("free play.jpg");
  withFilter= createImage(1200,1000,RGB);
  freePlay.loadPixels();
  withFilter.loadPixels();
  
  for(int x = 0; x<1200; x++){
    for(int y = 0; y<1000; y++){
      int loc = x+y*1200;
      if (brightness(freePlay.pixels[loc])<treshold)withFilter.pixels[loc]=color(2);
      else  withFilter.pixels[loc]=color(255);
  }
  }
  withFilter.updatePixels(); 
  image(withFilter,0,0);
  }  
      if (menu==7){
  createdLevels = loadImage("level"+myLevel+".jpg");
  withFilter= createImage(1200,1000,RGB);
  createdLevels.loadPixels();
  withFilter.loadPixels();
  
  for(int x = 0; x<1200; x++){
    for(int y = 0; y<1000; y++){
      int loc = x+y*1200;
      if (brightness(createdLevels.pixels[loc])<treshold)withFilter.pixels[loc]=color(2);
      else  withFilter.pixels[loc]=color(255);
  }
  }
  withFilter.updatePixels(); 
  image(withFilter,0,0);
  }  
}


//Se encarga de contar cuantos pixeles negros hay para evaluar la solución
void evaluate(){
  PImage goku;
  goku = loadImage("goku.png");
  int blackPixels =0;
  loadPixels();
  for (int i=0;i<pixels.length;i++){
   if (pixels[i]==color(2))blackPixels+=1;
  }
  updatePixels();
  fill(0,0,100);
  text("Black Pixels "+blackPixels,100,50);
  if ( blackPixels <=1000){
   image(goku,800,500,300,400);
  
  }
}


//Se encarga de dibujar una versión miniatura de cada nivel para que el usuario sepa cual escoger
void presentMyLevels(){
  PImage presentLevel;
  PImage withFilter;
  int treshold = 200;
  if (menu ==5){
    fill(0);
    textSize(60);
    text("Mundo 1",420,50);
    text("Presiona un número",100,100);
  }
  if (menu==6){
   fill(0);
   textSize(60);
   text("Mundo 2",420,50);
   text("Presiona un número",100,100);
  }
  
 for(int i =1 ; i<=18;i++){   
  presentLevel = loadImage("level"+i+".jpg");
  withFilter= createImage(1200,1000,RGB);
  presentLevel.loadPixels();
  withFilter.loadPixels();
  
  for(int x = 0; x<1200; x++){
    for(int y = 0; y<1000; y++){
      int loc = x+y*1200;
      if (brightness(presentLevel.pixels[loc])<treshold)withFilter.pixels[loc]=color(2);
      else  withFilter.pixels[loc]=color(255);
  }
  }
  withFilter.updatePixels(); 
  if (menu==5){
  if (i==1){
    image(withFilter,150,100,300,300);
    text(i,270,350); }
  if (i==2){
    image(withFilter,450,100,300,300);
    text(i,570,350);}
  if (i==3){
    image(withFilter,750,100,300,300);
    text(i,870,350);}
  if (i==4){
    image(withFilter,150,400,300,300);
     text(i,270,650);}
  if (i==5){
    image(withFilter,450,400,300,300);
    text(i,570,650);}
  if (i==6){
    image(withFilter,750,400,300,300);
     text(i,870,650);}
  if (i==7){
    image(withFilter,150,700,300,300);
     text(i,270,950);}
  if (i==8){
    image(withFilter,450,700,300,300);
     text(i,570,950);}
  if (i==9){
    image(withFilter,750,700,300,300);
     text(i,870,950);}      
  }  
  
  if (menu==6){
      if (i==10){
    image(withFilter,150,100,300,300);
    text(1,270,350); }
  if (i==11){
    image(withFilter,450,100,300,300);
    text(2,570,350);}
  if (i==12){
    image(withFilter,750,100,300,300);
    text(3,870,350);}
  if (i==13){
    image(withFilter,150,400,300,300);
     text(4,270,650);}
  if (i==14){
    image(withFilter,450,400,300,300);
    text(5,570,650);}
  if (i==15){
    image(withFilter,750,400,300,300);
     text(6,870,650);}
  if (i==16){
    image(withFilter,150,700,300,300);
     text(7,270,950);}
  if (i==17){
    image(withFilter,450,700,300,300);
     text(8,570,950);}
  if (i==18){
    image(withFilter,750,700,300,300);
     text(9,870,950);}      
  }
 }
}

//Se encarga de dibujar el menu para que se pueda interatuar con el 
void mainMenu(){
 PImage boat, fox, fish,play, bob;
 PFont font;
 font = loadFont("Woodcut-100.vlw");  
 boat = loadImage("barco.png");
 fox = loadImage("zorro.png");
 fish = loadImage("pez.png");
 play = loadImage("play.jpg"); 
 bob = loadImage("bob.png");
 textFont(font);
 fill(0);
 textSize(50);
 text("TANGRAM",400,100);
 text("Barco",100,250);
 image(boat,100,300,250,250);
 text("Zorro",500,250);
 image(fox,500,300,250,250);
 text("Pez",920,250);
 image(fish,900,300,250,250);
 text("juego libre",100,650);
 image(play,130,700,400,200);
  text("mis niveles",650,650);
 image(bob,650,650,300,300);
}



void keyPressed() {

  if (key == 'g' || key == 'G')drawGrid = !drawGrid; 
  if (key== 32) reflex=!reflex;
  if (key ==  'b' || key == 'B'){
    menu=0;
    objects();
  }
  if( drawGrid == false && menu==4){
    if (key ==  's' || key == 'S'){
      save("data//level"+newLevel+".jpg");
      newLevel+=1;
      }
    }
  if (menu ==5 || menu ==6 ) {
  if (keyCode == LEFT) menu=5;
  if (keyCode == RIGHT) menu=6;
  }
if (menu== 5){

 if (key==  '1'){
   myLevel=1; 
   menu=7;}
 if (key==  '2'){
   myLevel=2;
   menu=7;}
 if (key==  '3'){
   myLevel=3; 
   menu=7;}
 if (key==  '4'){
   myLevel=4; 
   menu=7;}
 if (key==  '5'){
   myLevel=5; 
   menu=7;}
 if (key==  '6'){
   myLevel=6; 
   menu=7;}
 if (key==  '7'){
   myLevel=7; 
   menu=7;}
 if (key==  '8'){
   myLevel=8;
   menu=7;}
 if (key==  '9'){
   myLevel=9; 
   menu=7;}  
}
 
if (menu== 6){
 if (key==  '1'){
   myLevel=10; 
   menu=7;}
 if (key==  '2'){
   myLevel=11;
   menu=7;}
 if (key==  '3'){
   myLevel=12;
   menu=7;}
 if (key==  '4'){
   myLevel=13;
   menu=7;}
 if (key==  '5'){
   myLevel=14;
   menu=7;}
 if (key==  '6'){
   myLevel=15;
   menu=7;}
 if (key==  '7'){
   myLevel=16;
   menu=7;}
 if (key==  '8'){
   myLevel=17;
   menu=7;}
 if (key==  '9'){
   myLevel=18; 
   menu=7;}
}
}


void mouseClicked(){
if (menu==0)  {
if(mouseX>=100 && mouseX<=350){
  if(mouseY>=300 && mouseY<=550) menu=1;
}
if(mouseX>=500 && mouseX<=750){
  if(mouseY>=300 && mouseY<=550) menu=2;
}
if(mouseX>=900 && mouseX<=1150){
  if(mouseY>=300 && mouseY<=550) menu=3;
}
if(mouseX>=150 && mouseX<=550){
  if(mouseY>=700 && mouseY<=900) menu=4;
}
if(mouseX>=650 && mouseX<=950){
  if(mouseY>=650 && mouseY<=950) menu=5;
}
}

}
