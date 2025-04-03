class Bullet{
 
  PVector loc;
  PVector vel;
  
  Bullet(int position){
   loc = new PVector(demo.loc.x + position, demo.loc.y);
   vel = demo.dir.copy();
   vel.setMag(10);
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
  }
}
