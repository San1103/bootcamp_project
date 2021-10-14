class Player {
  PVector position;
  PVector velocity;

  float playersizeW;
  float playersizeH;

  color colour1;
  int score;





  Player(int startX) {
    position = new PVector(startX, height/2);

    velocity = new PVector(0, 7);
    playersizeW = 10;
    playersizeH = 70;
    colour1 = color (255, 0, 0);
    
    score = 0;
  }


  boolean inRect(float x, float y) {

    return (position.x < x && x < position.x + playersizeW) && (position.y < y && y < position.y + playersizeH);
  }



  void draw() {
    fill(0);
    rect(position.x, 0, playersizeW, height);
    fill(colour1);
    rect(position.x, position.y, playersizeW, playersizeH);
  }

  void move() {

    if (key == 'w' ) {

      position.y = position.y - velocity.y;
    } else if (key == 's' ) {

      position.y = position.y + velocity.y;
    }
    if (position.y <= 10) {
      position.y = 10;
    }

    if (position.y >= height-playersizeH) {

      position.y = height-playersizeH;
    }
  }
}


class PlayerTwo extends Player {

  PlayerTwo(int startX) {

    super(startX);

    colour1 = color (0, 0, 255);
  }
  void move() {

    //  if (keyCode == UP) {

    //    position.y = position.y + velocity.y;
    //  } else if (keyCode == DOWN) {

    //    position.y = position.y - velocity.y;
    //  }
    position.y = (mouseY);
  }
}
