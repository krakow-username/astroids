
class GameObject {

  PVector loc;
  PVector vel;
  int lives, d,type;
  
  //rayray
  GameObject(float lx, float ly, int _lives, int _d){
    loc = new PVector(lx,ly);
    lives = _lives;
    d =_d;
  }


  GameObject(float lx, float ly, float vx, float vy, int _lives) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    lives = _lives;
  }
  
  GameObject(float lx, float ly, float vx, float vy, int _lives, int _d) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    lives = _lives;
    d = _d;
  }
  
   GameObject(float lx, float ly, float vx, float vy, int _lives, int _d, int _type) {
    type = _type;
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    lives = _lives;
    d = _d;
  }

  GameObject(PVector _loc, PVector _vel, int _lives) {
    loc = _loc;
    vel = _vel;
    lives = _lives;
  }


  

  void act() {
  }

  void show() {
  }

  

  void field(int r) {
    //if(loc.y < 0) loc.y = height ;
    //if(loc.y > height) loc.y = 0;
    //if(loc.x < 0) loc.x = width =0;
    //if(loc.x > width) loc.x = 0;
    if (loc.y < -r/2) loc.y = height + r/2;
    if (loc.y > (height + r/2)) loc.y = -r/2;
    if (loc.x < -r/2) loc.x = width + r/2;
    if (loc.x > width + r/2) loc.x = -r/2;
  }
}
