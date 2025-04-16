
void bossfight(){
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
   mode++; 
  }
  
  
  
}
