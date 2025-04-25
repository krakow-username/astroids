

class Jirachi extends GameObject{
  int dir, sinx, timer,frame;
  Gif run;
  boolean dead = false;
  PImage death[];
  
  Jirachi(){
    //x, y, velx, vely, lives, d
    super(0,0,0,0,3,40);
    timer = 10;
    dir = (int)random(-1,2);
    loc.y = random(0,height/3);
    if (dir>0) loc.x = -100; vel.x = 3 * -1;
    if (dir<0) loc.x = width +100; vel.x = 3;
    run = new Gif("jirachi/Jir", ".png", 3, -10, 0, 75, 50, 10);
    death = new PImage[4];
    for (int i =0; i < 4; i++){
      death[i] = loadImage("jirachi/dead"+"0"+i+".png");
      
    }
    death[0].resize(75,60);
    death[1].resize(65,40);
    death[2].resize(65,40);
    death[3].resize(65,40);
    frame = 0;
  }
  
  void show(){
    if (!dead){
    //circle(loc.x,loc.y,d);
    pushMatrix();
    translate(loc.x,loc.y);
    run.show();
    popMatrix();
    }
  }
  
  void act(){
    if(dead){
      deathAnimation();
    } else{
    loc.add(vel);
    //fix the sinWavw
    vel.y = (5 * sin(PI*sinx/15));
    
    vel.x = vel.x + vel.y/10;
    //println(vel.x);
    sinx++;
    shoot();
    checkForCollisions();
    }
  }
  
  void shoot(){
    if (timer < 0){
    objects.add(new Bullet(3));
    timer = 8;
    }
    timer--;
  }
  
  void deathAnimation(){
    if (frame > 2) {
      //dead = false;
      lives = 0;
    }
     image(death[frame],loc.x,loc.y);
    if (frameCount % 50 == 0) frame++;
    
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
          dead = true;
          currentObject.lives = 0;
          //if (lives < 1) {
          //  lives =0;
          //}
          //objects.add(new Astroid(loc.x, loc.y, vel.copy(), 1, lives-1));
          //objects.add(new Astroid(loc.x, loc.y, vel.copy(), -1, lives-1));
          //lives = 0;
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
        //if (lives < 1) {
        //  lives =0;
        //}
        //objects.add(new Astroid(loc.x, loc.y, vel.copy(), 1, lives-1));
        //objects.add(new Astroid(loc.x, loc.y, vel.copy(), -1, lives-1));
        //lives = 0;
        dead = true;
      }
  }
  
}
