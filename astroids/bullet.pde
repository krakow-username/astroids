final int GUN1 = 1;
final int GUN2 = 2;
final int JIRACHIB = 3;
final int RAYRAY1 = 4;
final int RAYRAY2 = 5;
final int RAYRAY3 = 6;
final int RAYRAY4 = 7;



class Bullet extends GameObject {

  //PVector loc;
  //PVector vel;
  int timer, dir;

  Bullet(int _type, int _dir, int _xy) {
    super(demo.gun1.x, demo.gun1.y, demo.dir.x, demo.dir.y, 1, 8, _type);
    int xy = _xy;
    dir = _dir;



    if (type == RAYRAY1) {
      d = 10;
      timer = 250;
      loc.set(ray.loc.x, ray.loc.y);
      if (xy == 0) {
        vel.set(ray.dirbullet.x*dir, ray.dirbullet.y);
      } else {
        vel.set(ray.dirbullet.x, ray.dirbullet.y*dir);
      }
      vel.setMag(2);
    }
  }



  Bullet(int _type) {
    super(demo.gun1.x, demo.gun1.y, demo.dir.x, demo.dir.y, 1, 8, _type);
    if (type == GUN1 || type == GUN2) {
      timer = 80;
    }
    
    if ( type == RAYRAY3){
      d = 25;
      timer = 1000;
      loc.set(ray.loc.x, ray.loc.y);
      vel.set(ray.dirRing.x, ray.dirRing.y);
      vel.setMag(8);
    }
    
    if ( type == RAYRAY4){
      d = 25;
      timer = 1000;
      loc.set(ray.loc.x, ray.loc.y);
      vel.set(ray.dirQuad.x, ray.dirQuad.y);
      vel.setMag(4);
    }


    if (type == RAYRAY2) {
      d = 30;
      timer = 1000;
      lives = 20;
      loc.set(ray.loc.x, ray.loc.y);
      vel.set(ray.dir.x, ray.dir.y);
      vel.setMag(5);
    }


    if (type == JIRACHIB) {
      d = 4;
      timer = 250;
    }
    if (type == GUN1) loc.set(demo.gun1.x, demo.gun1.y);
    if (type == GUN2) loc.set(demo.gun2.x, demo.gun2.y);
    if (type == JIRACHIB) {
      loc.set(jirachi1.loc.x, jirachi1.loc.y);
      vel.set(jirachi1.vel.x, 80);
      vel.setMag(5);
    }


    if (type == GUN1 || type == GUN2) {
      vel = demo.dir.copy();
      vel.setMag(10);
      vel.add(demo.vel.copy());
    }
  }

  void show() {

    if (type == GUN1 || type == GUN2) {
      fill(255);
      stroke(0);
      pushMatrix();
      rectMode(CENTER);
      translate(loc.x, loc.y);
      rotate(PI/2);
      rotate(demo.dir.heading());
      rect(0, 0, 4, 12, 10);
      popMatrix();
    }

    if (type == JIRACHIB ) {
      fill(#EBF007);
      stroke(0);
      pushMatrix();
      translate(loc.x, loc.y);
      circle(0, 0, 4);
      popMatrix();
    }

    if (type == RAYRAY1) {
      fill(#67D5FF);
      stroke(0);
      pushMatrix();
      translate(loc.x, loc.y);
      circle(0, 0, d);
      popMatrix();
      
    }

    if (type == RAYRAY2) {
      fill(#ED2222);
      stroke(#EDDD22);
      pushMatrix();
      translate(loc.x, loc.y);
      circle(0, 0, d);
      popMatrix();
      //println(timer);
    }
    
     if (type == RAYRAY4) {
      fill(255);
      stroke(0);
      pushMatrix();
      translate(loc.x, loc.y);
      circle(0, 0, d);
      popMatrix();
    }
    if (type == RAYRAY3) {
      fill(0);
      stroke(#67D5FF);
      pushMatrix();
      translate(loc.x, loc.y);
      circle(0, 0, d);
      popMatrix();
    }
  }

  void act() {
    //println(timer);
    loc.add(vel);
    timer--;
    if (timer<0)lives=0;

    if (type == JIRACHIB) {
      if (loc.x > width || loc.x < 0) vel.x *= -1;
      if (loc.y > height || loc.y <0) vel.y *= -1;
      vel.y += 0.1;
    }

    if (type == RAYRAY1) {
      if (loc.x > width || loc.x < 0) vel.x *= -1;
      if (loc.y > height || loc.y <0) vel.y *= -1;
      //vel.y += 0.1;
      vel.setMag(vel.mag()+0.01);
    }
    
    if (type == RAYRAY3) {
      if (loc.x > width || loc.x < 0) lives = 0;
      if (loc.y > height || loc.y <0) lives = 0;
      vel.setMag(vel.mag()/1.008);
    }

    if (type == RAYRAY2 || type == RAYRAY4) {
      if (loc.x > width || loc.x < 0) lives = 0;
      if (loc.y > height || loc.y <0) lives = 0;
    }
  }
}
