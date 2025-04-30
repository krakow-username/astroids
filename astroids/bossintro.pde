
PImage[] intro;
int fintro = 1;

 void bossintro(){
   Boss = true;
   difficultyCurve = 930;
     imageMode(CENTER);
     intro[fintro].resize(0,(int)(height *1.3));
    image(intro[fintro], width/2, height/2);
    if (frameCount % 1 == 0) fintro++;
    if (fintro > 93) {
      ray = new Rayquaza();
      objects.add(ray);
      mode = GAME;
    }
    
    spacekey = false;
    akey = false;
    dkey = false;
    wkey = false;
    
    
  }
