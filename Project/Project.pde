int mode = 0;
float alpha = 0.005;



//Player player1;
//Player player2;
Player[] players;

Ball ball1;

void setup() {

  println("Press 1 for Two Player, press 2 for Single player.");


  background(0);

  size(400, 300);


  players = new Player[2];

  ball1 = new Ball();


  players[0] = new Player(0);

  players[1] = new PlayerTwo(width-10);
}

void draw() {



  switch(mode) {
  case 0:

    break;

  case 1:

    twoPlayer();
    break;
  case 2:

    onePlayer();


    //
    break;

  default:
    println("error 404");
    break;
  }
}
void twoPlayer() {

  fill(0, 0, 0, 10);

  rect(0, 0, width, height);
  players[0].draw();


  if (keyPressed) {
    players[0].move();
  }


  players[1].draw();

  ball1.draw();
  ball1.move();
}

//void keyPressed() {

//  players[0].move();
//}

void mouseMoved() {

  players[1].move();
}

void keyPressed() {
  switch (key) {

  case '1':

    mode = 1;
    break;

  case '2':

    mode = 2;
    break;
  }
}

void onePlayer() {
  fill(0, 0, 0, 10);

  rect(0, 0, width, height);
  players[0].draw();

  rectMode(CENTER);
  fill(0);
  rect(width/2, 10, 20, 20);
  fill(0, 255, 0);
  textSize(30);
  text(players[0].score, width/2, 20);
  rectMode(CORNER);


  if (keyPressed) {
    players[0].move();
  }

  ball1.draw();
  ball1.move();

  fill(0, 0, 255);
  rect(width-10, 0, 10, height);
}
