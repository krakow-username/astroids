

class Astroid extends GameObject{

  int rotation, temp;
  Gif miniorS;
  
  Astroid(){
   super(width*1.2, height*1.2,1,1,3,1); 
   vel.setMag(random(1,2));
   vel.rotate(random(TWO_PI));
   d = lives*50;
   loc.x = loc.x * (int)random(-1,2);
   loc.y = loc.y * (int)random(-1,2);
   miniorS = new Gif("minior/miniorS",".png",3,0,-5,d,d,10);
  }
  
  Astroid(float x, float y, PVector mag, int dir, int life){
   super(x, y,1,1,life,1); 
   vel = mag;
   vel.setMag(random(2,3)*dir);
   vel.rotate(random(TWO_PI));
   d = lives*50;
   temp = (int) random(1,2.9);
   skins();
  }
  
  void show(){
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(radians(rotation));
    fill(0);
    stroke(255);
    circle(0,0,d);
    line(0,0, d/2,0);
    if(lives>0)miniorS.show();
    rotation++;
    popMatrix();
    
  }
  
  void skins(){
    if(lives>0){
      
      if (temp==1) miniorS = new Gif("minior/miniorS",".png",3,0,-5,(int)(d *1.3),(int)(d *1.3),10);
      if (temp==2) miniorS = new Gif("minior/miniorLB",".png",4,0,-5,(int)(d *1.3),(int)(d *1.3),10);
    }
  }
  
  void act(){
    loc.add(vel);
    field(d);
    checkForCollisions();
    if(loc.x > width*2 || loc.y > height*2 || loc.y < -height || loc.x < -width){
      lives=0;
    }
  }
  
  void checkForCollisions() {
    for (int i =0; i < objects.size(); i++) {
      GameObject currentObject = objects.get(i);
      if (currentObject instanceof Bullet) {
        if (dist(loc.x,loc.y,currentObject.loc.x,currentObject.loc.y) < d/2 + currentObject.d/2){
          currentObject.lives = 0;
          if(lives < 1){
             lives =0; 
          }
          objects.add(new Astroid(loc.x,loc.y,vel.copy(),1,lives-1));
          objects.add(new Astroid(loc.x,loc.y,vel.copy(),-1,lives-1));
          lives = 0;
          //println(lives);
          
        }
      }
    }
  }
  
  if ( dist(loc.x,loc.y, demo.loc.x +
  
}
