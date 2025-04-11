ship demo;

int score, astroidCount;
float difficultyCurve;
final int scoreNeeded = 500;

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
}

void spawning(){
  difficultyCurve = map(score, 0, scoreNeeded, 990,930) ;
  //println(astroidCount);
  if (objects.size() < 10){
  
  if(random(0,1000) > difficultyCurve){ objects.add(new Astroid());astroidCount++;}
  }
}



void gameClicks(){

}
