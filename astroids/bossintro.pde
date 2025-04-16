
PImage[] intro;
int fintro = 1;

 void bossintro(){
   difficultyCurve = 930;
     imageMode(CENTER);
    image(intro[fintro], width/2, height/2);
    if (frameCount % 1 == 0) fintro++;
    if (fintro > 93) {
      mode = GAME;
    }
    
    spacekey = false;
    akey = false;
    dkey = false;
    wkey = false;
    
    
  }
