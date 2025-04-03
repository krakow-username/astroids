boolean mouseReleased;
boolean wasPressed;

void click(){
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed){
   mouseReleased = true;
   wasPressed = false;
  }
}

class Gif{
  
  String a, b;
  PImage[] gif;
  int NumOfFrames, f, x, y, Sw, Sh, speed;
  
  Gif(String _a, String _b, int _NumOfFrames, int _x, int _y, int _Sw, int _Sh, int _speed){
    a = _a;
    b = _b;
    NumOfFrames = _NumOfFrames;
    x = _x;
    y = _y;
    Sw = _Sw;
    Sh = _Sh;
    f=0;
    speed = _speed;
    
    gif = new PImage [NumOfFrames];
  for(int i =0; i <NumOfFrames; i++){
     if (i<10){
    gif[i] = loadImage(a+"0"+i+b);
  gif[i].resize(Sw,Sh);}
    else{ gif[i] = loadImage(a+i+b);
  gif[i].resize(Sw,Sh);}
  }
  }
  
  void show(){
    imageMode(CENTER);
     image(gif[f],x,y);
  if (frameCount % speed == 0) f++;
  if (f > NumOfFrames -1){ f = 0;}
    
    
  }
  
  
}


void keyPressed(){
  if (mode==GAME){
    
    if (key == 'W' || key == 'w')  wkey = true;
    if (key == 'A' || key == 'a')  akey = true;
    if (key == 'D' || key == 'd')  dkey = true;
    if (key == 'S' || key == 's') skey = true;
    if (key == ' ' ) spacekey = true;
    if (keyCode  == UP) upkey = true;
    if (keyCode  == DOWN) downkey = true;
    if (keyCode == LEFT)  leftkey = true;
    if (keyCode == RIGHT )  rightkey = true;
    
       
  }
}

void keyReleased(){
  if (mode==GAME){
    
    if (key == 'W' || key == 'w')  wkey = false;
    if (key == 'S' || key == 's')  skey = false;
    if (key == 'D' || key == 'd')  dkey = false;
    if (key == 'A' || key == 'a')  akey = false;
    if (key == ' ' ) spacekey = false;
    if (keyCode  == UP) upkey = false;
    if (keyCode  == DOWN) downkey = false;
    if (keyCode == LEFT)  leftkey = false;
    if (keyCode == RIGHT )  rightkey = false;
    
    
  }
  
}

/*
void mouseReleased() {
  if (mode==INTRO) {
    introClicks();
  } else if (mode==GAME) {
    gameClicks();
  } else if (mode==PAUSE) {
    pauseClicks();
  } else if (mode==GAMEOVER) {
    gameoverClicks();
  }
}
*/
