//Krakow Kwok
//Astroids

import java.util.ArrayList;

ArrayList<Bullet> bullets;
ArrayList<GameObject> objects;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int BOSSINTRO = 2;
final int BOSSFIGHT =3;
final int PAUSE = 4;
final int GAMEOVER = 5;

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
  
   intro = new PImage [95];
    for (int i =1; i <95; i++) {
      if (i<10) {
        intro[i] = loadImage("rayintro/ezgif-frame-0"+"0"+i+".png");
        //intro[i].resize(Sw, Sh);
      } else {
        intro[i] = loadImage("rayintro/ezgif-frame-0"+i+".png");
        //intro[i].resize(Sw, Sh);
      }
    }
 
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
  else if (mode == BOSSINTRO){
     bossintro(); 
  }
  else if (mode == BOSSFIGHT){
     bossfight(); 
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
