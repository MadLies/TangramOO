
// Implementar:
// 1. La creación de las siete distintas piezas (por ahora son todas Rect) 
// 2. La interacción: selección y manipulación de las piezas (ratón, teclas, touch...)
// 3. La evaluacion de la solucion
// 4. El modo de creacion de nuevos problemas


// Controles 
//Dando clic podras interactuar en el menu
//Con clic izquierdo se eligen las figuras 
//Con clic derecho se sueltan las figuras
//Mientras la figura este seleccionada se pueden usar las flechas izquierda y derecha para rotarla 
//Con el espacio refleja el romboide
//Para volver al menu se debe oprimir la tecla b 
//ocultar o mostrar la cuadricula con la tecla g
//Para que un nivel sea valido el numero de pixeles negros (número mostrado en la ezquina superior derecha) debe ser menor de mil
//Para poder crear un nivel se debe ingresar en el modo modo libre, organizar las piezas a gusto, quitar la cuadricula y presionar la tecla s
//Ahora se podra acceder este nivel en mis niveles creados, en donde se guardara como el primer nivel del mundo 1 y asi ira avanzando por cada nivel nuevo
//mientras el programa se ejecuta



Shape[] shapes;
boolean drawGrid = true;
color getPix;
int menu=0;
boolean reflex = false;
int newLevel = 1;
int myLevel = 0;


void setup() {
  size(1200,1000);
  shapes = new Shape[7];
  shapes[0] = new Triangle(new PVector(0, 0),1,color(163,78,0));
  shapes[1] = new Triangle(new PVector(0, 0),1,color(150,0,0));
  shapes[2] = new Triangle(new PVector(0, 0),3,color(0,67,130));
  shapes[3] = new Rect(84.84, color(150, 95, 0));
  shapes[4] = new Rhomboid(new PVector(0,0),color(0,80,37));
  shapes[5] = new Triangle(new PVector(0, 0),2,color(0,128,102));
  shapes[6] = new Triangle(new PVector(0, 0),2,color(87,35,100));
}

void draw() {
 
  background(255, 255, 255);

  philtre();
 if (drawGrid)drawGrid(10);
 if (menu==0) mainMenu(); 
 if (menu==5 || menu==6)selectLevel(); 
 if (menu !=0 && menu!=5 && menu!=6){for (Shape shape : shapes)
   shape.draw();}  
 if (menu!=0 && menu!=5 && menu!=6 && menu!=4 )  evaluate();
   getPix= get(mouseX,mouseY);
  


}

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

void evaluate(){
  PImage goku;
  goku = loadImage("goku.png");
  int blackPixels =0;
  loadPixels();
  for (int i=0;i<pixels.length;i++){
   if (pixels[i]==color(2))blackPixels+=1;
  }
  updatePixels();
  fill(255,0,0);
  text(blackPixels,800,200);
  if ( blackPixels <=1000){
   image(goku,800,500,300,400);
  
  }
}

void selectLevel(){
  if (menu==5) {
   fill(0);
   textSize(60);
   text("Mundo 1",420,300);
   text("Presiona un número",100,450);
   text("entre",450,600);
   text("1 - 9",500,750); }
  if (menu==6) {
   fill(0);
   textSize(60);
   text("Mundo 2",420,300);
   text("Presiona un número",100,450);
   text("entre",450,600);
   text("1 - 9",500,750); }  
   
}


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
    menu=0;}
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
 if (key==  '1')myLevel=1; 
 if (key==  '2')myLevel=2; 
 if (key==  '3')myLevel=3; 
 if (key==  '4')myLevel=4; 
 if (key==  '5')myLevel=5; 
 if (key==  '6')myLevel=6; 
 if (key==  '7')myLevel=7; 
 if (key==  '8')myLevel=8; 
 if (key==  '9')myLevel=9; 
 if (keyPressed  && keyCode != LEFT && keyCode != RIGHT )menu=7;
}
if (menu== 6){
 if (key==  '1')myLevel=10; 
 if (key==  '2')myLevel=11; 
 if (key==  '3')myLevel=12; 
 if (key==  '4')myLevel=13; 
 if (key==  '5')myLevel=14; 
 if (key==  '6')myLevel=15; 
 if (key==  '7')myLevel=16; 
 if (key==  '8')myLevel=17; 
 if (key==  '9')myLevel=18; 
 if (keyPressed && keyCode != LEFT && keyCode != RIGHT)menu=7;
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
