

class Astroid extends GameObject{
  int radius;
  
  Astroid(){
   super(random(width), random(height),1,1,3); 
   vel.setMag(random(1,3));
   vel.rotate(random(TWO_PI));
   radius = lives*50;
  }
  
  void show(){
    fill(0);
    stroke(255);
    circle(loc.x,loc.y,radius);
    line(loc.x,loc.y,loc.x + radius/2,loc.y);
    
    
  }
  
  void act(){
    loc.add(vel);
    field(radius);
  }
  
}
