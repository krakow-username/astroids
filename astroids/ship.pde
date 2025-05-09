
public class ship extends GameObject {

  PVector  dir, acc, gun1, gun2, gundist;
  int d, bulletCD, bulletCDTime, invinsibleFrames, teleportCD, teleportCDTime,redTime,redTimeSet, maxLives;
  Gif deoxys_move;

  public ship() {
    super(width/2, height/2, 0, 0, 10);
    maxLives = 30;
    lives = maxLives;
    dir = new PVector(0.5, 0);
    acc = new PVector(1, 0);
    gun1 = new PVector(-6, 0);
    gun2 = new PVector(6, 0);
    gundist = new PVector(0, 6);
    acc.setMag(1);
    deoxys_move = new Gif("deoxys/deoxys_move", ".png", 4, 0, -5, 50, 55, 10);
    //vel.rotate(random(0,2*PI));
    d =20;
    bulletCDTime = 10;
    bulletCD = bulletCDTime;
    teleportCDTime = 20;
    teleportCD = teleportCDTime;
    redTimeSet= 20;
  }

  void it() {
    act();
    show();
  }

  void healthBar() {
    pushMatrix();
    translate(loc.x, loc.y +40);
    pushMatrix();
    translate(-30, -4);
    fill(#F53B3B);
    noStroke();
    rectMode(CORNERS);
    rect(0, 0, map(lives, 0, maxLives, 0, 60), 8);
    popMatrix();
    stroke(255);
    noFill();
    rectMode(CENTER);
    rect(0, 0, 60, 8);

    popMatrix();
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    drawShip();
    pushMatrix();
    rotate(PI/2);
    deoxys_move.show();
    popMatrix();
    popMatrix();
    //hitbox();
    healthBar();
    redScreen();
  }

  void act() {
    field(d);
    move();
    shoot();
    checkForCollisions();
    
  }

  void hitbox() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    circle(26, 0, 10);
    circle(-6, 10, 10);
    circle(-6, -10, 10);
    popMatrix();
  }

  void drawShip() {
    fill(0, 0, 0);
    stroke(255, 255, 255);
    triangle(-10, -10, -10, 10, 30, 0);
    circle(15, 0, 5);
  }

  void shoot() {
    if (spacekey) {
      if (bulletCD < 0) {
        //bullets.add(new Bullet(6));
        //bullets.add(new Bullet(-6));
        objects.add(new Bullet(1));
        objects.add(new Bullet(2));
        bulletCD = bulletCDTime;
      }
      bulletCD--;
    }
  }


  public boolean teleport() {
    int i = 0;
    int j = 0;
    //println("clicked");
    PVector temloc = new PVector(0, 0);
    while (i<300) {
      //println("b");
      j = 0;
      temloc.set(random(0, width), random(0, height));
      while ( j < objects.size()) {
        GameObject currentObject = objects.get(j);
        if ( currentObject instanceof Bullet || currentObject instanceof Jirachi ||currentObject instanceof Astroid || currentObject instanceof Rayquaza) {
          if (dist(temloc.x, temloc.y, currentObject.loc.x, currentObject.loc.y) < d/2 + currentObject.d/2 +100) {
            j = 1000;
            //println("a");
          }
        }
        j++;
      }
      if ( j <1000) {
        loc.set(temloc);
        return true;
      }
      i++;
    }
    redTime = redTimeSet;
    return false;
  }
  
  
  void redScreen(){
    if(redTime > 0){
    rectMode(CENTER);
    fill(#ED0C0C,50);
    rect(width/2,height/2,width+20,height);
    }
    redTime--;
  }


  void move() {
    acc.setMag(0.1);
    loc.add(vel);
    //gundist.add(dir);
    gun1.set(loc);
    gun2.set(loc);
    gun1.sub(gundist);
    gun2.add(gundist);
    //println(gundist);
    if ( vel.mag() < 8) {
      if (upkey || wkey){
        vel.add(dir);
        for (int i = 0; i < (int)random(2,4); i++){
          part.add(new Particle(loc.copy(),dir.copy())); 
        }
      }
    }
    if (leftkey || akey) {
      dir.rotate(-radians(3));
      acc.rotate(-radians(3));
      gundist.rotate(-radians(3));
    }
    if (rightkey || dkey) {
      dir.rotate(radians(3));
      acc.rotate(radians(3));
      gundist.rotate(radians(3));
    }


    if ( vel.mag() > 2) {
      //println(acc.mag());
      vel.setMag((vel.mag() - acc.mag()));
    } else {
      vel.setMag(2);
    }

    if (tkey) {
      if (teleportCD < 0) {
        if (teleport()) {
          //println("teleported");
        } else {
          //println("failed");
        }
        teleportCD = teleportCDTime;
      }
    }
    teleportCD--;
  }

  void checkForCollisions() {
    for (int i =0; i < objects.size(); i++) {
      GameObject currentObject = objects.get(i);
      if (currentObject instanceof Bullet) {
        if (currentObject.type == JIRACHIB ||currentObject.type ==RAYRAY1 || currentObject.type ==RAYRAY2|| currentObject.type ==RAYRAY3 || currentObject.type == RAYRAY4) {
          if (dist(loc.x, loc.y, currentObject.loc.x, currentObject.loc.y) < d/2 + currentObject.d/2) {
            currentObject.lives = 0;
            if (lives < 1) {
              lives =0;
            }
            lives--;
          }
        }
      }
    }
  }

  //void field(){
  //  if(loc.y < d/2) loc.y = height - d/2;
  //  if(loc.y > (height - d/2)) loc.y = d/2;
  //  if(loc.x < d/2) loc.x = width - d/2;
  //  if(loc.x > width - d/2) loc.x = d/2;

  //}
}
