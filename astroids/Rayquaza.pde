

class Rayquaza extends GameObject {
  PVector dir, dirbullet, dirRing;
  float spin = 0.005;
  int bulletCD;
  int beamCD;
  int bulletCDTime = 15;
  int beamCDTime = 2;
  int ringCD;
  int ringCDTime = 50;

  Rayquaza() {
    super(width/2, height/4, 100, height/6);
    dir = new PVector(0, -0.5);
    dirbullet = new PVector(0, -0.5);
    dirRing = new PVector(0, -0.5);
  }

  void show() {
    pushMatrix();
    noFill();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    circle(0, 0, d);
    line(0, 0, d/2, 0);
    popMatrix();
  }

  void act() {
    dir.rotate(spin);
    dirbullet.rotate(spin*8);
    shoot();
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

      //objects.add(new Bullet(RAYRAY1));
      bulletCD = bulletCDTime;
    }
    bulletCD--;
  }
}
