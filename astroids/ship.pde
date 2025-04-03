
public class ship{
 
  PVector loc, vel, dir, acc;
  int d;
  Gif deoxys_move;
  
  public ship(){
    loc = new PVector(width/2,height/2);
    vel = new PVector(0,0);
    dir = new PVector(0.5,0);
    acc = new PVector(1,0);
    acc.setMag(1);
    deoxys_move = new Gif("deoxys_move",".png",4,0,-5,50,55,10);
    //vel.rotate(random(0,2*PI));
    d =20;
    act();
    show();
    
  }
  
  void it(){
    act();
    show();
  }
  
  void show(){
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(dir.heading());
    drawShip();
    pushMatrix();
    rotate(PI/2);
    deoxys_move.show();
    popMatrix();
    popMatrix();
  }
  
  void act(){
    field();
    move();
    shoot();
  }
  
  void drawShip(){
   fill(0,0,0);
   stroke(255,255,255);
   triangle(-10,-10,-10,10,30,0);
   circle(15,0,5);
  }
  
  void shoot(){
    if(spacekey){
     bullets.add(new Bullet(6)); 
     bullets.add(new Bullet(-6)); 
    }
  }
  
  void move(){
    acc.setMag(0.1);
    loc.add(vel);
    println(acc.mag());
    if( vel.mag() < 10) {
    if (upkey || wkey) vel.add(dir);
    }
    if(leftkey || akey){dir.rotate(-radians(3)); acc.rotate(-radians(3));}
    if(rightkey || dkey){dir.rotate(radians(3)); acc.rotate(-radians(3));}
    
    
    if ( vel.mag() > 2){
      println(acc.mag());
      vel.setMag((vel.mag() - acc.mag()));} else{
        vel.setMag(2);
      }
    
  }
  
  void field(){
    if(loc.y < d/2) loc.y = height - d/2;
    if(loc.y > (height - d/2)) loc.y = d/2;
    if(loc.x < d/2) loc.x = width - d/2;
    if(loc.x > width - d/2) loc.x = d/2;
    
  }
  
  
}
