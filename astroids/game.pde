ship demo;


void game(){
  background(0,0,0);
  
  
  for( int i = 0; i < objects.size(); i++){
    GameObject currentObject = objects.get(i);
    currentObject.act();
    currentObject.show();
    
    if(currentObject.lives <= 0){
     objects.remove(i); 
     i--;
    } 
  }
  

}



void gameClicks(){

}
