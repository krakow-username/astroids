

class Rayquaza extends GameObject {
  PVector dir, dirbullet, dirRing, dirQuad;
  float spin = 0.005;
  int bulletCD;
  int beamCD;
  int bulletCDTime = 15;
  int beamCDTime = 2;
  int ringCD;
  int ringCDTime = 50;
  Gif rays;

  Rayquaza() {
    super(width/2, height/4, 100, height/6);
    dir = new PVector(0, -0.5);
    dirbullet = new PVector(0, -0.5);
    dirRing = new PVector(0, -0.5);
    dirQuad = new PVector(-0.5,-0.5);
    rays  = new Gif("rayrayray/ray", ".png", 2, 0, 0, d, d, 10);
  }

  void show() {
    pushMatrix();
    noFill();
    translate(loc.x, loc.y);
    //rotate(dir.heading());
    //circle(0, 0, d);
    //line(0, 0, d/2, 0);
    rays.show();    
    popMatrix();

  }

  void act() {
    dir.rotate(spin);
    dirbullet.rotate(spin*8);
    dirQuad.rotate(spin*1.5);
    shoot();
    checkForCollisions();
  }
  
  
  
  void checkForCollisions() {
    println(lives);
    
    
    
    for (int i =0; i < objects.size(); i++) {
      GameObject currentObject = objects.get(i);
      if (currentObject instanceof Bullet) {
        if (currentObject.type == GUN1 || currentObject.type == GUN2){
        if (dist(loc.x, loc.y, currentObject.loc.x, currentObject.loc.y) < d/2 + currentObject.d/2) {
          lives--;
          currentObject.lives = 0;
        }
        }
      }
    }
    //physical contact for ship
    if (demo.invinsibleFrames < 1) {
      if ( dist(loc.x, loc.y, demo.loc.x, demo.loc.y) < d/2 + demo.d/2) {
        lives--;
        demo.lives--;
        demo.invinsibleFrames = 1000;
        //println(demo.lives);
      }
    }
  }
  
  
  

  void shoot() {

    if (ringCD<0) {
      for (int i =0; i <16; i++) {
        dirRing.rotate((2*PI)/16*i);
        objects.add(new Bullet(RAYRAY3));
      }
      ringCD = ringCDTime;
    }
    ringCD--;
    
    

    if (beamCD < 0) {
      objects.add(new Bullet(RAYRAY2));

      beamCD = beamCDTime;
    }
    beamCD--;

    if (bulletCD < 0) {
      //bullets.add(new Bullet(6));
      //bullets.add(new Bullet(-6));
      objects.add(new Bullet(RAYRAY1, 1, 0));
      objects.add(new Bullet(RAYRAY1, -1, 1));
      objects.add(new Bullet(RAYRAY1, 1, 1));
      objects.add(new Bullet(RAYRAY1, -1, 0));
      
      
      for (int i =0; i <4; i++) {
        dirQuad.rotate((2*PI)/4*i);
        objects.add(new Bullet(RAYRAY4));
      }
      
      //objects.add(new Bullet(RAYRAY1));
      bulletCD = bulletCDTime;
    }
    bulletCD--;
  }
}
