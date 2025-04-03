
class Button {
  float x, y, w, h;
  color c1, c2;
  String text;
  boolean clicked;
  PImage image;

  Button(float _x, float _y, float _w, float _h, color _c1, color _c2, String _text) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    c1 = _c1;
    c2 = _c2;
    //image = _text;
    if (_text.contains("png"))
      image = loadImage(_text);

    if (image == null) {
      text = _text;
    } else {
      image.resize((int)w/3, (int)h/2);
    }
    clicked = false;
  }



  void show() {
    drawRect();
    drawText();
    doStuff();
  }





  boolean touchingMouse() {
    if (  mouseX > x - w/2 && mouseX < x + w/2 && mouseY < y + h/2 && mouseY > y - h/2) {
      return true;
    } else {
      return false;
    }
  }

  void drawRect() {
    rectMode(CENTER);
    if (touchingMouse()) {
      fill(c2);
    } else {
      fill(c1);
    }


    if ( touchingMouse()) {
      rect(x, y, w +20, h +20, 30);
    } else {
      rect(x, y, w, h, 30);
    }

    if (touchingMouse()) {
      fill(c1);
    } else {
      fill(c2);
    }
  }
  void drawText() {
    textAlign(CENTER, CENTER);
    textSize(w/3);
    if (text != null) {
      text(text, x, y );
    } else {
      image(image, x, y);
    }
  }

  void doStuff() {
    if (mouseReleased && touchingMouse()) {
      clicked = true;
    } else {
      clicked = false;
    }
  }
}
