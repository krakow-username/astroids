ship demo;


void game(){
  background(0,0,0);
  
  
  for( int i = 0; i < bullets.size(); i++){
    Bullet currentBullet = bullets.get(i);
    currentBullet.act();
    currentBullet.show();
  }
  
  demo.it();
}



void gameClicks(){

}
