
class Particle extends GameObject {
  int trans = 200;
  Particle(PVector _loc, PVector _vel) {
    super(_loc, _vel, 1);
    vel.setMag(2);
    vel.mult(-1);
    vel.x+= random(-5,6);
    vel.x*= random(-2,3);
    d = 10;
  }

  void act() {
    loc.add(vel);
    vel.div(1.1);
    if(vel.mag()<0.5 || trans < 0){
        lives = 0;
      }
      trans-=10;
     println(trans);
  }
  
  void show(){
   fill(#F59825,trans);
   //fill(#F54825,trans);
      stroke(#F1F525);
      pushMatrix();
      translate(loc.x, loc.y);
      circle(0, 0, d);
      popMatrix(); 
  }
}
