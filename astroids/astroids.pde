//Krakow Kwok
//Astroids

import java.util.ArrayList;

ArrayList<Bullet> bullets;
ArrayList<GameObject> objects;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
boolean wkey, skey,akey,dkey, upkey, downkey,leftkey, rightkey, spacekey;


void setup(){
  //size(1500,1400);
  rectMode(CENTER);
  size(1000,700, P2D);
  mode = GAME;
  objects = new ArrayList();
  demo = new ship();
  objects.add(demo);
  objects.add(new Astroid());
  
  bullets = new ArrayList();
 
}

void draw(){
  //println(objects.size());
  if (mode==INTRO){
    intro();
  }
  else if (mode==GAME){
    game();
  }
  else if (mode==PAUSE){
    pause();
  }
  else if (mode==GAMEOVER){
    gameover();
  }
  else {
    println("Error:Mode = " +mode);
  }
  
  
  /*click();
  myButton.show();
  if (myButton.clicked){
    back = myButton.c2;
  }
 */
}
