

class Astroid extends GameObject{

  int rotation;
  Gif miniorS;
  Astroid(){
   super(random(width), random(height),1,1,3,1); 
   vel.setMag(random(1,2));
   vel.rotate(random(TWO_PI));
   d = lives*50;
   miniorS = new Gif("minior/miniorS",".png",3,0,-5,50,55,10);
  }
  
  Astroid(float x, float y, PVector mag, int dir, int life){
   super(x, y,1,1,life,1); 
   vel = mag;
   vel.setMag(random(2,3)*dir);
   vel.rotate(random(TWO_PI));
   d = lives*50;
  }
  
  void show(){
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(radians(rotation));
    fill(0);
    stroke(255);
    circle(0,0,d);
    line(0,0, d/2,0);
    miniorS.show();
    rotation++;
    popMatrix();
    
  }
  
  void act(){
    loc.add(vel);
    field(d);
    checkForCollisions();
  }
  
  void checkForCollisions() {
    for (int i =0; i < objects.size(); i++) {
      GameObject currentObject = objects.get(i);
      if (currentObject instanceof Bullet) {
        if (dist(loc.x,loc.y,currentObject.loc.x,currentObject.loc.y) < d/2 + currentObject.d/2){
          currentObject.lives = 0;
          objects.add(new Astroid(loc.x,loc.y,vel.copy(),1,lives-1));
          objects.add(new Astroid(loc.x,loc.y,vel.copy(),-1,lives-1));
          lives = 0;
          //println(lives);
          
        }
      }
    }
  }
  
}
