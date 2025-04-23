

class Jirachi extends GameObject{
  int dir, sinx, timer;
  Gif run;
  
  Jirachi(){
    //x, y, velx, vely, lives, d
    super(0,0,0,0,3,60);
    timer = 10;
    dir = (int)random(-1,2);
    loc.y = random(0,height/3);
    if (dir>0) loc.x = -100; vel.x = 1 * -1;
    if (dir<0) loc.x = width +100; vel.x = 1;
    run = new Gif("jirachi/Jir", ".png", 3, -10, 0, 110, 85, 10);
    
  }
  
  void show(){
    //circle(loc.x,loc.y,d);
    pushMatrix();
    translate(loc.x,loc.y);
    run.show();
    popMatrix();
  }
  
  void act(){
    loc.add(vel);
    //fix the sinWavw
    vel.y = (5 * sin(PI*sinx/15));
    
    vel.x = vel.x + vel.y/10;
    //println(vel.x);
    sinx++;
    shoot();
    checkForCollisions();
  }
  
  void shoot(){
    if (timer < 0){
    objects.add(new Bullet(3));
    timer = 10;
    }
    timer--;
  }
  
  void checkForCollisions() {
    
    if (loc.x > width *1.2 || loc.x < (0 - width*0.2)){
      lives = 0;
      
    }
    
    
    
    
    for (int i =0; i < objects.size(); i++) {
      GameObject currentObject = objects.get(i);
      if (currentObject instanceof Bullet) {
        if (currentObject.type == GUN1 || currentObject.type == GUN2){
        if (dist(loc.x, loc.y, currentObject.loc.x, currentObject.loc.y) < d/2 + currentObject.d/2) {
          currentObject.lives = 0;
          if (lives < 1) {
            lives =0;
          }
          //objects.add(new Astroid(loc.x, loc.y, vel.copy(), 1, lives-1));
          //objects.add(new Astroid(loc.x, loc.y, vel.copy(), -1, lives-1));
          lives = 0;
          //println(lives);
        }
        }
      }
    }
    //physical contact for ship
    if (demo.invinsibleFrames < 1) {
      if ( dist(loc.x, loc.y, demo.loc.x, demo.loc.y) < d/2 + demo.d/2) {
        demo.lives--;
        demo.invinsibleFrames = 1000;
        //println(demo.lives);
      }
    }
    //physical contact for jirachi
    if ( dist(loc.x, loc.y, demo.loc.x, demo.loc.y) < d/2 + demo.d/2) {
        if (lives < 1) {
          lives =0;
        }
        //objects.add(new Astroid(loc.x, loc.y, vel.copy(), 1, lives-1));
        //objects.add(new Astroid(loc.x, loc.y, vel.copy(), -1, lives-1));
        lives = 0;
      }
  }
  
}
