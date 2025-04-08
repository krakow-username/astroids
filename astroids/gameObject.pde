
class GameObject{
 
  PVector loc;
  PVector vel;
  int lives;
  
  
  GameObject(float lx, float ly, float vx, float vy, int _lives){
    loc = new PVector(lx,ly);
    vel = new PVector(vx,vy);
    lives = _lives;
  }
  
  GameObject(PVector _loc, PVector _vel, int _lives){
    loc = _loc;
    vel = _vel;
    lives = _lives;
  }
  
  void act(){
    
  }
  
  void show(){
    
    
  }
  
  void field(int r){
    //if(loc.y < 0) loc.y = height ;
    //if(loc.y > height) loc.y = 0;
    //if(loc.x < 0) loc.x = width =0;
    //if(loc.x > width) loc.x = 0;
    if(loc.y < -r/2) loc.y = height + r/2;
    if(loc.y > (height + r/2)) loc.y = -r/2;
    if(loc.x < -r/2) loc.x = width + r/2;
    if(loc.x > width + r/2) loc.x = -r/2;
  }
  
}
