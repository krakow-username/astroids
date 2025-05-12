

void gameover() {
  background(#67C2F2);
  image(over, width/2, height/2);
  over.resize(0, height);

  if ( Won == false) {
    image(lose, width/2, height/5);
  }
}

void gameoverClicks() {
  mode = INTRO;
  objects.clear();
  Boss = false;
  Won = false;
  score = 0;
  demo = new ship();
  jirachi1 = new Jirachi();
  //objects.add(jirachi1);
  objects.add(demo);
  objects.add(new Astroid());
  objects.add(new Astroid());
  objects.add(new Astroid());
  ray = new Rayquaza();
  fintro = 0;

  spacekey = false;
  akey = false;
  dkey = false;
  wkey = false;
  tkey = false;
  upkey = false;
  leftkey = false;
  rightkey = false;
}
