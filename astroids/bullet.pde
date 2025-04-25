final int GUN1 = 1;
final int GUN2 = 2;
final int JIRACHIB = 3;



class Bullet extends GameObject {

  //PVector loc;
  //PVector vel;
  int timer;

  Bullet(int _type) {
    super(demo.gun1.x, demo.gun1.y, demo.dir.x, demo.dir.y, 1, 8, _type);
    if (type == GUN1 || type == GUN2){
    timer = 80;
    }
    if (type == JIRACHIB){
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
    
    if (type == JIRACHIB){
      fill(#EBF007);
      stroke(0);
      pushMatrix();
      translate(loc.x, loc.y);
      circle(0,0,4);
      popMatrix();
    }
  }

  void act() {
    //println(timer);
    loc.add(vel);
    timer--;
    if (timer<0)lives=0;
    
    if (type == JIRACHIB){
      if (loc.x > width || loc.x < 0) vel.x *= -1;
      if (loc.y > height || loc.y <0) vel.y *= -1;
      vel.y += 0.1;
    }
    
  }
}
