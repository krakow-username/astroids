ship demo;

int score, astroidCount;
float difficultyCurve;
final int scoreNeeded = 500;
boolean Boss;
int time =0;

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
  
  if (!Boss){
    progressBar();
  }
  
}

void progressBar(){

   pushMatrix();
   translate(width/2 - width*3/4/2,height*5/6 -20);
   fill(#08F9FF,100);
   noStroke();
   rectMode(CORNERS);
   rect(0,0,map(score,0,scoreNeeded,0,width*3/4),40);
   
   popMatrix();
   stroke(255);
   noFill();
   rectMode(CENTER);
   rect(width/2,height*5/6,width*3/4,40);
   
   pushMatrix();
   translate(width/2 - width*3/4/2,height*5/6 -20);
   imageMode(CENTER);
   image(deoxysBar,map(score,0,scoreNeeded,0,width*3/4),20);
   popMatrix();
}

void spawning(){
  println(time);
  time++;
  if (fintro < 10){
  difficultyCurve = map(score, 0, scoreNeeded, 990,930) ;
  }
  //println(astroidCount);
  if (objects.size() < 10){
  
  if(random(0,1000) > difficultyCurve){ objects.add(new Astroid());astroidCount++;}
  
  if (time % 100 == 0){
    jirachi1 = new Jirachi();
    objects.add(jirachi1);
  }
  
  }
}



void gameClicks(){

}
