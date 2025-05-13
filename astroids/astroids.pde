//Krakow Kwok
//Astroids

import java.util.ArrayList;

ArrayList<Bullet> bullets;
ArrayList<GameObject> objects;
ArrayList<Particle> part;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int BOSSINTRO = 2;
final int BOSSFIGHT =3;
final int PAUSE = 4;
final int GAMEOVER = 5;

boolean wkey, skey, akey, dkey, upkey, downkey, leftkey, rightkey, spacekey, tkey, Won;
PImage deoxysBar, ast, over, lose;
PImage[] earth;
Jirachi jirachi1;
Rayquaza ray;
Gif introgif;
int currentWidth;

void setup() {

  
  //size(1500,1400,P2D);
  rectMode(CENTER);
  size(1000, 700, P2D);
  mode = INTRO;
  Boss = false;
  Won = false;
  objects = new ArrayList();
  part = new ArrayList();
  demo = new ship();
  jirachi1 = new Jirachi();
  //objects.add(jirachi1);
  objects.add(demo);
  objects.add(new Astroid());
  objects.add(new Astroid());
  objects.add(new Astroid());
  
  introgif = new Gif("intro/frame_", "_delay-0.08s.gif", 32, width/2, height/2, width, height, 5);  
  
  earth = new PImage[15];
  for(int i = 0; i < 15; i++){
    if(i < 10){
      println(i);
    earth[i] = loadImage("earth/frame_0" + i + "_delay-0.14s.png");
    } else{
      earth[i] = loadImage("earth/frame_" + i +  "_delay-0.14s.png");
    }
  }

  bullets = new ArrayList();

  deoxysBar = loadImage("bar/ae64153eb57cf7afa9b94e1ae996dedc.png");
  deoxysBar.resize(80, 80);
  ast = loadImage("pixel-sport.png");
  ast.resize(width/3,0);
  over = loadImage("9397242.jpg");
  lose = loadImage("lose.png");
  lose.resize(width/3,0);
  intro = new PImage [95];
  for (int i =1; i <95; i++) {
    if (i<10) {
      intro[i] = loadImage("rayintro/ezgif-frame-0"+"0"+i+".png");
      //intro[i].resize(0, height +20);
    } else {
      intro[i] = loadImage("rayintro/ezgif-frame-0"+i+".png");
      //intro[i].resize(0, height +20);
    }
  }
  currentWidth = width;
  ray = new Rayquaza();
    //test
    
    //mode = BOSSINTRO;
    //fintro = 90;
    
}

void draw() {
  // (objects.size());
  if (mode==INTRO) {
    intro();
  } else if (mode==GAME) {
    game();
  } else if (mode==PAUSE) {
    pause();
  } else if (mode==GAMEOVER) {
    gameover();
  } else if (mode == BOSSINTRO) {
    bossintro();
  } else if (mode == BOSSFIGHT) {
    bossfight();
  } else {
    println("Error:Mode = " +mode);
  }


  /*click();
   myButton.show();
   if (myButton.clicked){
   back = myButton.c2;
   }
   */
}
