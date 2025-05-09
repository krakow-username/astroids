

void intro(){
  background(255,0,255);
  introgif.show();
  if( currentWidth != width){
    currentWidth = width;
    imageMode(CENTER);
    introgif = new Gif("intro/frame_", "_delay-0.08s.gif", 32, width/2, height/2, width, height, 5);

  }
  textAlign(CENTER);
  textSize(20);
  text("Click To Start", width/2, height*2/3);
  image(ast,width/2,height/5);
}

void introClicks(){
  mode = GAME;
}
