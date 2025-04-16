ship demo;

int score, astroidCount;
float difficultyCurve;
final int scoreNeeded = 5;

void game(){
  background(0,0,0);
  //println(score);
  spawning();
  
  for( int i = 0; i < objects.size(); i++){
    GameObject currentObject = objects.get(i);
    currentObject.act();
    currentObject.show();
    
    if(currentObject.lives <= 0){
      if (currentObject instanceof Astroid) score++; ;
     objects.remove(i); 
     i--;
    } 
  }
  
  if (demo.lives <= 0){
   mode = GAMEOVER; 
  }
  
  if (fintro < 10){
  if (score >= scoreNeeded){
    fintro = 1;
    mode = BOSSINTRO;
  }
  }
  
}

void spawning(){
  if (fintro < 10){
  difficultyCurve = map(score, 0, scoreNeeded, 990,930) ;
  }
  //println(astroidCount);
  if (objects.size() < 10){
  
  if(random(0,1000) > difficultyCurve){ objects.add(new Astroid());astroidCount++;}
  }
}



void gameClicks(){

}
