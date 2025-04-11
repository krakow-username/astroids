
public class ship extends GameObject{
 
  PVector  dir, acc, gun1, gun2, gundist;
  int d, bulletCD, bulletCDTime;
  Gif deoxys_move;
  
  public ship(){
    super(width/2,height/2,0,0, 1);
    dir = new PVector(0.5,0);
    acc = new PVector(1,0);
    gun1 = new PVector(-6,0);
    gun2 = new PVector(6,0);
    gundist = new PVector(0,6);
    acc.setMag(1);
    deoxys_move = new Gif("deoxys/deoxys_move",".png",4,0,-5,50,55,10);
    //vel.rotate(random(0,2*PI));
    d =20;
    bulletCDTime = 10;
    bulletCD = bulletCDTime;
    
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
    hitbox();
  }
  
  void act(){
    field(d);
    move();
    shoot();
  }
  
  void hitbox(){
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(dir.heading());
    circle(26,0,10);
    circle(-6,10,10);
    circle(-6,-10,10);
    popMatrix();
    
    
  }
  
  void drawShip(){
   fill(0,0,0);
   stroke(255,255,255);
   triangle(-10,-10,-10,10,30,0);
   circle(15,0,5);
  }
  
  void shoot(){
    if(spacekey){
      if(bulletCD < 0){
         //bullets.add(new Bullet(6)); 
         //bullets.add(new Bullet(-6));
         objects.add(new Bullet(1));
         objects.add(new Bullet(2));
         bulletCD = bulletCDTime;
      }
      bulletCD--;
    }
  }
  
  void move(){
    acc.setMag(0.1);
    loc.add(vel);
    //gundist.add(dir);
    gun1.set(loc);
    gun2.set(loc);
    gun1.sub(gundist);
    gun2.add(gundist);
    //println(gundist);
    if( vel.mag() < 8) {
    if (upkey || wkey) vel.add(dir);
    }
    if(leftkey || akey){dir.rotate(-radians(3)); acc.rotate(-radians(3)); gundist.rotate(-radians(3));}
    if(rightkey || dkey){dir.rotate(radians(3)); acc.rotate(radians(3)); gundist.rotate(radians(3));}
    
    
    if ( vel.mag() > 2){
      //println(acc.mag());
      vel.setMag((vel.mag() - acc.mag()));} else{
        vel.setMag(2);
      }
    
  }
  
  //void field(){
  //  if(loc.y < d/2) loc.y = height - d/2;
  //  if(loc.y > (height - d/2)) loc.y = d/2;
  //  if(loc.x < d/2) loc.x = width - d/2;
  //  if(loc.x > width - d/2) loc.x = d/2;
    
  //}
  
  
}
