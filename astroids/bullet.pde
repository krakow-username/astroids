class Bullet extends GameObject{
 
  //PVector loc;
  //PVector vel;
  int timer = 100;
  
  Bullet(int type){
    super(demo.gun1.x, demo.gun1.y,demo.dir.x,demo.dir.y, 1,8);
    if (type == 1) loc = new PVector(demo.gun1.x, demo.gun1.y);
    if (type == 2) loc = new PVector(demo.gun2.x, demo.gun2.y);
   
   vel = demo.dir.copy();
   vel.setMag(10);
   vel.add(demo.vel.copy());
  }
  
  void show(){
   fill(255);
   stroke(0);
   pushMatrix();
   rectMode(CENTER);
   translate(loc.x,loc.y);
   rotate(demo.dir.heading());
   rotate(PI/2);
   rect(0,0,4,12,10);
   popMatrix();
  }
  
  void act(){
   loc.add(vel); 
   timer--;
   if (timer<0)lives=0;
  }
}
